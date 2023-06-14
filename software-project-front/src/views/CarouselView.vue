<template>
  <div class="block">
    <el-header v-if="!loginFlag" style="padding: none; background-color: none">
      <el-menu class="el-menu-demo">
        <el-menu-item style="float: left; font-size: large; font-weight: 900">
          校园二手交易平台
        </el-menu-item>
        <el-menu-item style="float: right">
          <el-button @click="toRegister">注册</el-button>
        </el-menu-item>
        <el-menu-item style="float: right">
          <el-button @click="toLogin">登录</el-button>
        </el-menu-item>
      </el-menu>
    </el-header>
    <el-header v-else>
      <el-menu class="el-menu-demo">
        <el-menu-item style="float: left; font-size: large; font-weight: 900">
          校园二手交易平台
        </el-menu-item>
        <el-menu-item style="float: right">
          <el-button @click="toLoginout">退出登录</el-button>
        </el-menu-item>
        <el-menu-item style="float: right">
          <el-button @click="toHome">个人中心</el-button>
        </el-menu-item>
      </el-menu>
    </el-header>

    <el-carousel height="500px">
      <!-- <el-carousel-item v-for="item in carouselGoods" :key="item.gid">
        <el-image :src="item.gimage" @click="toCarousel"> </el-image>
      </el-carousel-item> -->
      <el-carousel-item style="text-align: center;">
        <el-image style="display: block; margin: 0 auto; width: 100%; height: 100%;" src="https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.7ct07wmmu780.webp">
        </el-image>
      </el-carousel-item>

      <el-carousel-item style="text-align: center;">
        <el-image style="display: block; margin: 0 auto; width: 100%; height: 100%;" src="https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.4dzsflb2xgk0.png">
        </el-image>
      </el-carousel-item>
    </el-carousel>

    <div style="margin: 20px">
      <el-row>
        <el-tabs @tab-click="handleClick" class="tab" v-model="activeName">
          <el-tab-pane
            v-for="(lab, index) in labels"
            :label="lab"
            :key="index"
            :name="names[index]"
          >
            <!-- 卡片 -->
            <el-row style="margin: 10px">
              <el-col v-for="item in goods" :key="item.id" :span="8">
                <el-card :header="item.title" v-if="item.gcount > 0">
                  <el-image :src="item.gimage"> </el-image>
                  <div style="padding: 14px">
                    <div class="bottom clearfix">
                      <span
                        style="
                          display: inline-block;
                          text-align: left;
                          width: 100%;
                        "
                        ><b>描述：</b> {{ item.gcontent }} </span
                      ><br />
                      <span
                        style="
                          display: inline-block;
                          text-align: left;
                          width: 100%;
                        "
                        ><b>价格：</b>{{ item.gprice }} 元</span
                      >
                      <span
                        style="
                          display: inline-block;
                          text-align: left;
                          width: 100%;
                        "
                        ><b>数量：</b>{{ item.gcount }} 个</span
                      ><br />
                      <span
                        style="
                          display: inline-block;
                          text-align: left;
                          width: 100%;
                        "
                        ><b>评价：</b>{{ item.glevel }} 分</span
                      >
                      <el-button type="text" class="button" @click="onBuy(item)"
                        >购买</el-button
                      >
                    </div>
                  </div>
                </el-card>
              </el-col>
            </el-row>
          </el-tab-pane>
        </el-tabs>
      </el-row>
    </div>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="pageLimits"
      :page-size="pageSize"
      layout="total, sizes, prev, pager, next, jumper"
      :total="itemTotal"
    >
    </el-pagination>
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      activeIndex: "1",
      carouselGoods: [],
      activeName: "all",
      goods: [],
      labels: ["全部", "类别一", "类别二", "类别三"],
      names: ["all", "group-one", "group-two", "group-three"],
      currentPage: 1,
      pageLimits: [10, 20, 30, 40, 50],
      pageSize: 10,
      itemTotal: 10,
      searchName: "",
      loginFlag: false,
      token: null,
      currGoods: {},
      currUser: null,
    };
  },
  methods: {
    toLogin() {
      this.$router.push({ path: "/Login" });
    },
    toRegister() {
      this.$router.push({ path: "/Register" });
    },
    handleClick(tab, event) {
      let clickName = tab.name;
      if (clickName === "all") {
        this.searchName = "";
      } else if (clickName === "group-one") {
        this.searchName = "1";
      } else if (clickName === "group-two") {
        this.searchName = "2";
      } else if (clickName === "group-three") {
        this.searchName = "3";
      }
      this.currentPage = 1;
      this.getGoods(this.currentPage, this.limit);
    },
    getGoods(page, limit) {
      this.axios
        .get(
          "http://localhost:8888/goods/search",
          {
            params: {
              gName: this.searchName,
              page: page,
              limit: limit,
            },
          },
          { emulateJSON: true }
        )
        .then((resp) => {
          if (resp.data.message === "ok") {
            this.itemTotal = resp.data.data.total;
            this.goods = resp.data.data.records;
            this.carouselGoods = this.goods.slice(0, 4);
            // console.log(resp);
            // this.goods.forEach((item) => {
            //   console.log(item.gid);
            // });
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    handleSizeChange(limit) {
      this.limit = limit;
      this.currentPage = 1;
      this.getGoods(this.currentPage, this.limit);
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      this.getGoods(this.currentPage, this.limit);
    },
    toCarousel() {},
    onBuy(res) {
      console.log(res);
      if (!this.token) {
        this.$message({
          message: "请先登录",
          type: "error",
        });
      } else {
        this.currGoods = res;

        this.$confirm("确认购买后将生成订单信息", "确认信息", {
          distinguishCancelAndClose: true,
          confirmButtonText: "确认购买",
          cancelButtonText: "取消",
        })
          .then(() => {
            this.buyGoods();
          })
          .catch((action) => {
            this.$message({
              type: "warning",
              message: "已放弃购买",
            });
          });
      }
    },
    toLoginout() {
      console.log(this.token, "<<<<<token");
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
        })
        .catch((error) => {
          console.log(error);
        });
    },
    toHome() {
      this.$router.push({ path: "/Home" });
    },
    buyGoods() {
      this.axios.defaults.headers.post["Content-Type"] =
        "application/x-www-form-urlencoded";
      const params = new URLSearchParams();
      params.append("token", this.token);
      params.append("dAmount", this.currGoods.gprice);
      params.append("dCount", 1);
      params.append("sId", this.currGoods.uid);
      params.append("gId", this.currGoods.gid);
      params.append("bId", this.currUser.uid);

      this.axios
        .post("http://localhost:8888/order/add", params)
        .then((resp) => {
          console.log(resp);
          this.getGoods();
          this.$message({
            type: "success",
            message: "订单生成成功，请前往个人中心完成支付  ",
          });
          this.currGoods = {};
        })
        .catch((error) => {
          console.log(error);
        });
      this.currGoods = {};
    },
  },

  created() {
    this.getGoods(1, 10);
    let token = localStorage.getItem("token");
    console.log(token);
    if (token === null) {
      this.loginFlag = false;
      this.token = null;
      this.currUser = null;
    } else {
      this.token = token;
      this.loginFlag = true;
      this.currUser = JSON.parse(localStorage.getItem("currUser"));
    }
  },
};
</script>

<style>
.block {
  margin: 5px 80px;
}

.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 150px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;

}

.tab {
  margin: 50px;
}
</style>