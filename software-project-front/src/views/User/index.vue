<template>
  <div>
    <el-table
      ref="multipleTable"
      :data="users"
      tooltip-effect="dark"
      style="width: 100%"
    >
      <el-table-column
        prop="uid"
        label="用户ID"
        width="120"
        sortable
      ></el-table-column>
      <el-table-column
        prop="unickname"
        label="用户昵称"
        width="120"
      ></el-table-column>
      <el-table-column prop="uphone" label="用户联系方式" width="120">
      </el-table-column>
      <el-table-column prop="uemail" label="用户邮箱" width="120">
      </el-table-column>
      <el-table-column
        prop="uaddress"
        label="用户住址"
        show-overflow-tooltip
      ></el-table-column>
      <el-table-column prop="ulevel" label="用户评价等级" show-overflow-tooltip>
      </el-table-column>

      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >注销账号</el-button
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
  </div>
</template>

<script>
export default {
  name: "User",
  data() {
    return {
      currUser: JSON.parse(localStorage.getItem("currUser")),
      token: localStorage.getItem("token"),
      currentPage: 1,
      pageLimits: [10, 20, 30, 40],
      limit: 10,
      itemTotal: 10,
      users: [],
      usersItem: {},
    };
  },
  methods: {
    getUserInfo() {
      this.axios
        .get(
          "http://localhost:8888/user/all",
          {
            params: {
              token: this.token,
              page: this.currentPage,
              limit: this.limit,
            },
          },
          { emulateJSON: true }
        )
        .then((resp) => {
          console.log(resp);
          if (resp.data.message === "ok") {
            this.itemTotal = resp.data.data.total;
            this.users = resp.data.data.records;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    handleSizeChange(limit) {
      this.limit = limit;
      this.currentPage = 1;
      this.getUserInfo(this.currentPage, this.limit);
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      this.getUserInfo(this.currentPage, this.limit);
    },
    handleDelete(index,row) {
      this.usersItem = row;
      this.$confirm("账号注销后不可恢复, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.axios.defaults.headers.post["Content-Type"] =
            "application/x-www-form-urlencoded";
          const params = new URLSearchParams();
          params.append("token", this.token);
          params.append("uId", this.usersItem.uid);
          this.axios
            .post("http://localhost:8888/user/delete", params)
            .then((resp) => {
              console.log(resp);
              this.$message({
                type: "success",
                message: resp.data.message,
              });
              this.getUserInfo();
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
    },
  },
  created() {
    this.getUserInfo();
  },
};
</script>

<style>
</style>