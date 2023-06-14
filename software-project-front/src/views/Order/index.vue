<template>
  <div>
    <div style="padding-bottom: 20px">
      <el-input
        placeholder="订单状态"
        v-model="dStatue"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-input
        placeholder="搜索卖家ID"
        v-model="sId"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-input
        placeholder="搜索订单号"
        v-model="dId"
        clearable
        style="width: 150px"
      >
      </el-input>
      <el-button type="primary" @click="search">搜索</el-button>
    </div>

    <el-table
      ref="multipleTable"
      :data="order"
      tooltip-effect="dark"
      style="width: 100%"
    >
      <el-table-column
        prop="did"
        label="订单ID"
        width="120"
        sortable
      ></el-table-column>
      <el-table-column prop="dstatue" label="支付状态" width="120">
        <template slot-scope="scope">
          {{ scope.row.dstatue ? "已支付" : "未支付" }}
        </template>
      </el-table-column>
      <el-table-column
        prop="damount"
        label="订单金额"
        width="120"
        sortable
      ></el-table-column>
      <el-table-column
        prop="ddate"
        label="创建日期"
        show-overflow-tooltip
      ></el-table-column>
      <el-table-column prop="sid" label="卖家ID" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="gid" label="商品ID" width="120" sortable>
      </el-table-column>

      <el-table-column label="操作">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleShow(scope.$index, scope.row)"
            >查看</el-button
          >
          <el-button
            size="mini"
            type="primary"
            @click="toPay(scope.$index, scope.row)"
            >支付</el-button
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
      ref="drawerRef"
      :visible.sync="drawerInfo"
      direction="rtl"
      :before-close="handleClose"
    >
      <div style="margin: 10px">
        <el-descriptions title="订单信息">
          <el-descriptions-item label="订单ID">{{
            this.orderItem.did
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="订单状态">{{
            this.orderItem.dstatue ? "已支付" : "未支付"
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="订单金额">{{
            this.orderItem.damount
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="卖家ID">{{
            this.orderItem.sid
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="商品ID">{{
            this.orderItem.gid
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="日期">{{
            new Date(this.orderItem.ddate).toLocaleDateString()
          }}</el-descriptions-item
          ><br />
        </el-descriptions>
      </div>
    </el-drawer>

    <el-drawer
      :visible.sync="drawerPay"
      direction="rtl"
      :before-close="handleClose"
    >
      <div style="margin: 10px">
        <el-descriptions title="订单信息">
          <el-descriptions-item label="订单ID">{{
            this.orderItem.did
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="订单状态">{{
            this.orderItem.dstatue ? "已支付" : "未支付"
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="订单金额">{{
            this.orderItem.damount
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="卖家ID">{{
            this.orderItem.sid
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="商品ID">{{
            this.orderItem.gid
          }}</el-descriptions-item
          ><br />
          <el-descriptions-item label="日期">{{
            new Date(this.orderItem.ddate).toLocaleDateString()
          }}</el-descriptions-item
          ><br />
        </el-descriptions>

        <el-button type="primary" v-show="!this.orderItem.dstatue" @click="pay"
          >支付</el-button
        >
        <el-button type="primary" v-show="this.orderItem.dstatue" disabled
          >已支付</el-button
        >
      </div>
    </el-drawer>
  </div>
</template>

<script>
export default {
  name: "Order",
  data() {
    return {
      currUser: JSON.parse(localStorage.getItem("currUser")),
      drawerEdit: false,
      drawerAdd: false,
      token: localStorage.getItem("token"),
      dStatue: null,
      dId: null,
      sId: null,
      currentPage: 1,
      pageLimits: [10, 20, 30, 40],
      limit: 10,
      itemTotal: 10,
      order: [],
      orderItem: {},
      drawerInfo: false,
      drawerPay: false,
    };
  },
  methods: {
    handleClose(done) {
      done();
      this.orderItem = {};
    },
    getOrder() {
      console.log(this.token);
      this.axios
        .get(
          "http://localhost:8888/order/all",
          {
            params: {
              token: this.token,
              dStatue: this.dStatue,
              dId: this.dId,
              sId: this.sId,
              page: this.currentPage,
              limit: this.limit,
              bId: this.currUser.uid,
            },
          },
          { emulateJSON: true }
        )
        .then((resp) => {
          console.log(resp.data.data.records);
          if (resp.data.message === "ok") {
            this.itemTotal = resp.data.data.total;
            this.order = resp.data.data.records;
            this.order.forEach((item) => {
              console.log(item.bid);
            });
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    handleSizeChange(limit) {
      this.limit = limit;
      this.currentPage = 1;
      this.getOrder(this.currentPage, this.limit);
    },
    handleCurrentChange(val) {
      this.currentPage = val;
      this.getOrder(this.currentPage, this.limit);
    },
    search() {
      this.getOrder();
    },
    handleShow(index, row) {
      this.orderItem = row;
      console.log(this.orderItem);
      this.drawerInfo = true;
    },
    toPay(index, row) {
      this.orderItem = row;
      console.log(this.orderItem);
      this.drawerPay = true;
    },
    pay() {
      this.axios.defaults.headers.post["Content-Type"] =
        "application/x-www-form-urlencoded";
      const params = new URLSearchParams();
      params.append("token", this.token);
      params.append("dId", this.orderItem.did);
      this.axios
        .post("http://localhost:8888/order/updatePay", params)
        .then((resp) => {
          console.log(resp);
          if (resp.data.message === "支付成功！") {
            this.$message({
              message: resp.data.message,
              type: "success",
            });
            this.drawerPay = false;
            this.getOrder();
          }
        })
        .catch((error) => {
          console.log(error);
        });

        // 计算平台利润
        this.axios
        .post("http://localhost:8888/order/profit", params)
        .then((resp) => {
          console.log(resp,"<<<<利润");
          if (resp.data.message === "支付成功！") {
            this.$message({
              message: resp.data.message,
              type: "success",
            });
            this.drawerPay = false;
            this.getOrder();
          }
        })
        .catch((error) => {
          console.log(error);
        });
      
      this.orderItem = {};
    }
  },
  created() {
    this.getOrder();
  },
};
</script>

<style>
</style>