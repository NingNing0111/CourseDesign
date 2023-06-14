<template>
  <div class="poster">
    <el-form
      :model="registerForm"
      status-icon
      :rules="rules"
      ref="registerForm"
      label-position="left"
      class="register-container"
    >
      <h3 class="register_title">
        系统注册
        <el-button @click="toLogin">点我登录</el-button>
      </h3>

      <el-form-item label="" prop="uNickname">
        <el-input
          type="text"
          v-model="registerForm.uNickname"
          autocomplete="off"
          placeholder="请输入您的昵称"
          prefix-icon="el-icon-user"
        ></el-input>
      </el-form-item>

      <el-form-item label="" prop="uEmail">
        <el-input
          type="email"
          v-model="registerForm.uEmail"
          autocomplete="off"
          placeholder="请输入您的邮箱"
          prefix-icon="el-icon-message"
        ></el-input>
      </el-form-item>

      <el-form-item label="" prop="uPhone">
        <el-input
          type="number"
          v-model="registerForm.uPhone"
          autocomplete="off"
          placeholder="请输入您的手机号"
          prefix-icon="el-icon-phone-outline"
        ></el-input>
      </el-form-item>

      <el-form-item label="" prop="uPassword">
        <el-input
          type="password"
          v-model="registerForm.uPassword"
          autocomplete="off"
          placeholder="请输入您的密码"
          prefix-icon="el-icon-lock"
        ></el-input>
      </el-form-item>

      <el-form-item label="" prop="checkPassword">
        <el-input
          type="password"
          v-model="registerForm.checkPassword"
          autocomplete="off"
          placeholder="请确认密码"
          prefix-icon="el-icon-lock"
        ></el-input>
      </el-form-item>

      <el-form-item label="" prop="uAddress">
        <el-input
          v-model.number="registerForm.uAddress"
          placeholder="请输入您的住宿地址"
          
          prefix-icon="el-icon-place"
        >
        </el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="register"
          >注册</el-button
        >
      </el-form-item>

    </el-form>
  </div>
</template>

<script>
export default {
  name: "Register",
  data() {
    var checkNickname = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("昵称不能为空"));
      }else{
        return callback()
      }
    };

    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else {
        if (this.registerForm.checkPassword !== "") {
          this.$refs.registerForm.validateField("uPassword");
        }
        callback();
      }
    };
    var validatePass2 = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.registerForm.uPassword) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };

    var checkEmail = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("邮箱不能为空"));
      }else{
        return callback();
      }
    };

    var checkPhone = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("手机号不能为空"));
      }else{
        return callback()
      }
    };

    var checkAddress = (rule, value, callback) => {
      if (!value) {
        return callback(new Error("住宿地址不能为空"));
      }else{
        return callback()
      }
    };


    return {
      registerForm: {
        uPassword: "",
        checkPassword: "",
        uNickname: "",
        uEmai: "",
        uPhone: "",
        uAddress: ""
      },
      rules: {
        uPassword: [{ validator: validatePass, trigger: "blur" }],
        checkPassword: [{ validator: validatePass2, trigger: "blur" }],
        uNickname: [{ validator: checkNickname, trigger: "blur" }],
        uEmail: [{ validator: checkEmail, trigger: "blur" }],
        uPhone: [{ validator: checkPhone, trigger: "blur" }],
        uAddress: [{ validator: checkAddress, trigger: "blur" }]
      }
    };
  },
  methods: {
    register(){
      console.log(this.registerForm);
      let registerData = new FormData();
      registerData.append('uNickname',this.registerForm.uNickname);
      registerData.append('uEmail',this.registerForm.uEmail);
      registerData.append('uPhone',this.registerForm.uPhone);
      registerData.append('uPassword',this.registerForm.uPassword);
      registerData.append('uAddress',this.registerForm.uAddress);

      this.axios.post("http://localhost:8888/user/register/",registerData).then(resp => {
        console.log(resp);
        if(resp.data.message === "注册成功"){
          this.$message({
              message: resp.data.message,
              type: "success",
          });
          this.$router.push({ path: "/Login" });
        }
      }).catch(error => {
        console.log(error);
      })

      console.log(registerData);
    },
    toLogin() {
      this.$router.push({ path: "/Login" });
    },
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
  margin: 0px;
  padding: 0px;
}

.register-container {
  border-right: 15px;
  background-clip: padding-box;
  margin: 90px auto;
  width: 350px;
  padding: 35px 35px 15px 35px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 20px #cac6c6;
}
.register_title {
  margin: 0px auto 40px auto;
  text-align: center;
  color: #505458;
}
</style>