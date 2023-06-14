<template>
  <div>
    <el-container style="height: 100%; border: 1px solid #eee">
      <el-aside width="200px">
        <h3 class="title">校园二手交易管理系统</h3>
        <el-menu
          :default-openeds="['1', '3']"
          background-color="#FFF"
          text-color="#000"
          style="border-right: none"
        >
          <el-menu-item index="1">
            <router-link tag="div" to="/goods">商品管理</router-link>
          </el-menu-item>
          <el-menu-item index="2">
            <router-link tag="div" to="/order">订单管理</router-link>
          </el-menu-item>
          <el-menu-item index="3" v-show="currUser.unickname == 'admin'">
            <router-link tag="div" to="/user" >用户管理</router-link>
          </el-menu-item>
          <el-menu-item index="4" v-if="currUser.unickname != 'admin'">
            <router-link tag="div" to="/analyze">数据分析</router-link>
          </el-menu-item>
          <el-menu-item index="4" v-else>
            <router-link tag="div" to="/analyzeAll">数据分析</router-link>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-container>
        <el-header style="text-align: right; font-size: 12px">
          <el-dropdown @command="handleCommand">
            <span class="el-dropdown-link">
              <i class="el-icon-user-solid"></i>
              {{currUser.unickname}}
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="userInfo">个人信息</el-dropdown-item>
              <el-dropdown-item command="toIndex">首页</el-dropdown-item>
              <el-dropdown-item command="loginout">登出</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </el-header>

        <el-main>
          <router-view />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  data() {
    return {
      token: localStorage.getItem("token"),
      currUser: JSON.parse(localStorage.getItem('currUser')),
      multipleSelection: [],
    };
  },
  methods: {
    toggleSelection(rows) {
      if (rows) {
        rows.forEach((row) => {
          this.$refs.multipleTable.toggleRowSelection(row);
        });
      } else {
        this.$refs.multipleTable.clearSelection();
      }
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    handleCommand(command) {
      console.log(command);
      if (command === "toIndex") {
        this.$router.push({ path: "/" });
      } else if (command === "loginout") {
        console.log("登出", this.token);
        this.axios
          .post("http://localhost:8888/user/loginout", null, {
            params: {
              token: this.token,
            },
          })
          .then((resp) => {
            console.log(resp);
            localStorage.removeItem("token");
            this.loginFlag = false;
            this.token = null;
            this.$message({
              message: "退出成功",
              type: "success",
            });
            this.$router.push({ path: "/" });
          })
          .catch((error) => {
            console.log(error);
          });
      }else{
        console.log("用户信息");
      }
    },
  },
};
</script>

<style>
.el-header {
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}

.el-dropdown-link {
  cursor: pointer;
  color: #409eff;
}
.el-icon-arrow-down {
  font-size: 12px;
}

.title {
  text-align: center;

  height: 60px;
  line-height: 60px;
}
</style>