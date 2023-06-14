<template>
  <body id="poster">
    <el-form
      class="login-container"
      :model="loginForm"
      label-width="0px"
      lable-position="left"
    >
      <h3 class="login_title">
        系统登录
        <el-button @click="toRegister">点我注册</el-button>
      </h3>
      <el-form-item label="">
        <el-input
          type="text"
          v-model="loginForm.email"
          placeholder="邮箱"
        ></el-input>
      </el-form-item>
      <el-form-item label="">
        <el-input
          type="password"
          v-model="loginForm.password"
          placeholder="密码"
        ></el-input>
      </el-form-item>

      <el-form-item style="width: 100%">
        <el-button
          type="primary"
          style="width: 100%; background: #505458; border: none"
          @click="onLogin"
          >登录</el-button
        >
      </el-form-item>
    </el-form>
  </body>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      loginForm: {
        email: "",
        password: "",
        token: ''
      },
    };
  },
  methods: {
    onLogin() {
      let formData = new FormData();
      formData.append("email", this.loginForm.email);
      formData.append("password", this.loginForm.password);
      this.axios
        .post("http://localhost:8888/user/login/", formData)
        .then((resp) => {
          let data = resp.data;
          if (data.message === "登录成功") {
            localStorage.setItem("token", data.data.token);
            this.token = data.data.token;
            this.getInfo();
            this.$router.push({ path: "/" });
            this.$message({
              message: data.message,
              type: "success",
            });
          } else {
            this.$message({
              message: data.message,
              type: "error",
            });
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    toRegister() {
      this.$router.push({ path: "/Register" });
    },
    getInfo(){
      this.axios.get("http://localhost:8888/user/tokenInfo",{
        params:{
          token: this.token
        }
      })
      .then(resp => {
        localStorage.setItem('currUser',JSON.stringify(resp.data.data))
        console.log(JSON.parse(localStorage.getItem('currUser')));
      })
      .catch(error => {
        console.log(error);
      })
    }
  },
};
</script>

<style>
#poster {
  background-position: center;
  height: 100%;
  width: 100%;
  background-size: cover;
  position: fixed;
}
body {
  margin: 0px;
  padding: 0px;
}
.login-container {
  border-right: 15px;
  background-clip: padding-box;
  margin: 90px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 20px #cac6c6;
}
.login_title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}
</style>