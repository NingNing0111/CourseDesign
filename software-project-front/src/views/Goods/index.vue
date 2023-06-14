<template>
  <div>
    <div style="padding-bottom: 20px">
      <el-input
        placeholder="搜索商品名"
        v-model="gName"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-input
        placeholder="搜索商品价格"
        v-model="gPrice"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-input
        placeholder="搜索商品描述"
        v-model="gContent"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-button type="primary" @click="search">搜索</el-button>
    </div>
    <div>
      <el-button type="primary" size="small" @click="addGoods">添加</el-button>
      <el-button type="danger" size="small" @click="deleteIds"
        >批量删除</el-button
      >
    </div>
    <el-table
      ref="multipleTable"
      :data="goods"
      tooltip-effect="dark"
      style="width: 100%"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55"> </el-table-column>
      <el-table-column
        prop="gid"
        label="商品ID"
        width="120"
        sortable
      ></el-table-column>
      <el-table-column
        prop="gname"
        label="商品名"
        width="120"
      ></el-table-column>
      <el-table-column prop="gcount" label="商品数量" width="120" sortable>
      </el-table-column>
      <el-table-column prop="gprice" label="商品价格" width="120" sortable>
      </el-table-column>
      <el-table-column
        prop="gcontent"
        label="商品描述"
        show-overflow-tooltip
      ></el-table-column>
      <el-table-column prop="gimage" label="商品图片" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="glevel" label="商品评价" width="120" sortable>
      </el-table-column>
      <el-table-column prop="uid" label="卖家ID" width="120" sortable>
      </el-table-column>

      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
            >编辑</el-button
          >
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="pageLimits"
      :page-size="limit"
      layout="total, sizes, prev, pager, next, jumper"
      :total="itemTotal"
    >
    </el-pagination>

    <el-drawer
      title="编辑商品"
      :visible.sync="drawerEdit"
      direction="rtl"
      :before-close="handleClose"
    >
      <div style="margin: 10px">
        <el-form label-position="left" label-width="80px" :model="goodsItem">
          <el-form-item label="商品名称:">
            <el-input
              v-model="goodsItem.gname"
              :placeholder="goodsItem.gname"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品价格:">
            <el-input
              v-model="goodsItem.gprice"
              :placeholder="goodsItem.gprice"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品数量:">
            <el-input
              v-model="goodsItem.gcount"
              :placeholder="goodsItem.gcount"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品图片:">
            <el-input
              v-model="goodsItem.gimage"
              :placeholder="goodsItem.gimage"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品描述:">
            <el-input
              v-model="goodsItem.gcontent"
              type="textarea"
              :placeholder="goodsItem.gcontent"
            ></el-input>
          </el-form-item>

          <el-form-item style="display: flex; justify-content: center">
            <el-button type="primary" @click="submitEdit">修改</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-drawer>

    <el-drawer title="添加商品" :visible.sync="drawerAdd" direction="rtl">
      <div style="margin: 10px">
        <el-form label-position="left" label-width="80px" :model="goodsItem">
          <el-form-item label="商品名称:">
            <el-input
              v-model="goodsItem.gname"
              :placeholder="goodsItem.gname"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品价格:">
            <el-input
              v-model="goodsItem.gprice"
              :placeholder="goodsItem.gprice"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品数量:">
            <el-input
              v-model="goodsItem.gcount"
              :placeholder="goodsItem.gcount"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品图片:">
            <el-input
              v-model="goodsItem.gimage"
              :placeholder="goodsItem.gimage"
            ></el-input>
          </el-form-item>
          <el-form-item label="商品描述:">
            <el-input
              v-model="goodsItem.gcontent"
              type="textarea"
              :placeholder="goodsItem.gcontent"
            ></el-input>
          </el-form-item>

          <el-form-item style="display: flex; justify-content: center">
            <el-button type="primary" @click="submitAdd">添加</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-drawer>
  </div>
</template>

<script>
export default {
  name: "Goods",
  data() {
    return {
      currUser: JSON.parse(localStorage.getItem("currUser")),
      drawerEdit: false,
      drawerAdd: false,
      token: localStorage.getItem("token"),
      gName: null,
      gPrice: null,
      gContent: null,
      currentPage: 1,
      pageLimits: [10, 20, 30, 40],
      limit: 10,
      ids: [],
      itemTotal: 10,
      goods: [],
      goodsItem: {},
    };
  },
  methods: {
    handleClose(done) {
      this.goodsItem = {};
      done();
    },
    handleSelectionChange(val) {
      this.ids.length = 0;
      val.forEach((item) => {
        this.ids.push(item.gid);
      });
    },
    getGoods() {
      this.axios
        .get(
          "http://localhost:8888/goods/search",
          {
            params: {
              gName: this.gName,
              gPrice: this.gPrice,
              gContent: this.gContent,
              uId: this.currUser.uid,
              page: this.currentPage,
              limit: this.limit,
            },
          },
          { emulateJSON: true }
        )
        .then((resp) => {
          if (resp.data.message === "ok") {
            this.itemTotal = resp.data.data.total;
            this.goods = resp.data.data.records;
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
    search() {
      this.getGoods();
    },
    handleEdit(index, row) {
      this.goodsItem = row;
      console.log(this.goodsItem.gimage);
      this.drawerEdit = true;
      // console.log(index, row);
    },
    handleDelete(index, row) {
      this.goodsItem = row;
      this.$confirm("删除商品后不可恢复, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.axios.defaults.headers.post["Content-Type"] =
            "application/x-www-form-urlencoded";
          const params = new URLSearchParams();
          params.append("token", this.token);
          params.append("gId", this.goodsItem.gid);
          this.axios
            .post("http://localhost:8888/goods/delete", params)
            .then((resp) => {
              console.log(resp);
              this.$message({
                type: "success",
                message: resp.data.message,
              });
              this.getGoods();
            })
            .catch((error) => {
              console.log(error);
            });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
      // this.goodsItem = {};
    },
    submitEdit() {
      console.log(this.goodsItem.gimage);
      this.axios.defaults.headers.post["Content-Type"] =
        "application/x-www-form-urlencoded";
      const params = new URLSearchParams();
      params.append("token", this.token);
      params.append("gId", this.goodsItem.gid);
      params.append("gName", this.goodsItem.gname);
      params.append("gPrice", this.goodsItem.gprice);
      params.append("gCount", this.goodsItem.gcount);
      params.append("gContent", this.goodsItem.gcontent);
      params.append("gImage", this.goodsItem.gimage);
      params.append("uId", this.goodsItem.uid);
      params.append("gLevel", this.goodsItem.glevel);
      this.axios
        .post("http://localhost:8888/goods/update", params)
        .then((resp) => {
          console.log(resp.data.message);
          this.$message({
            message: resp.data.message,
            type: "success",
          });
          this.drawer = false;
          this.getGoods();
        })
        .catch((error) => {
          console.log(error);
        });
      this.goodsItem = {};
    },
    addGoods() {
      this.drawerAdd = true;
    },
    submitAdd() {
      this.axios.defaults.headers.post["Content-Type"] =
        "application/x-www-form-urlencoded";
      const params = new URLSearchParams();
      params.append("token", this.token);
      params.append("gName", this.goodsItem.gname);
      params.append("gPrice", this.goodsItem.gprice);
      params.append("gCount", this.goodsItem.gcount);
      params.append("gContent", this.goodsItem.gcontent);
      params.append("gImage", this.goodsItem.gimage);
      params.append("uId", this.currUser.uid);
      this.axios
        .post("http://localhost:8888/goods/add", params)
        .then((resp) => {
          console.log(resp.data.message);
          this.$message({
            message: resp.data.message,
            type: "success",
          });
          this.drawer = false;
          this.getGoods();
        })
        .catch((error) => {
          console.log(error);
        });
      this.goodsItem = {};
    },
    deleteIds() {
      console.log(this.ids);
      if (this.ids.length === 0) {
        this.$message({
          message: "没有要删除的内容",
          type: "error",
        });
      } else {
        this.axios.defaults.headers.post["Content-Type"] =
          "application/x-www-form-urlencoded";
        const params = new URLSearchParams();
        params.append("token", this.token);
        params.append("listId", this.ids);
        this.axios
          .post("http://localhost:8888/goods/deleteById", params)
          .then((resp) => {
            console.log(resp.data.message);
            this.$message({
              message: resp.data.message,
              type: "success",
            });
            this.getGoods();
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
  },
  created() {
    this.getGoods();
  },
};
</script>

<style>
</style>