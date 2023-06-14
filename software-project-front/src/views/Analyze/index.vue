<template>
  <div class="Analyze">
    <div class="chart-container">
      <div id="main" style="width: 800px; height: 800px"></div>
      <div id="pie" style="width: 800px; height: 800px"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Analyze",
  data() {
    return {
      token: localStorage.getItem("token"),
      currUser: JSON.parse(localStorage.getItem("currUser")),
      orderData: [],
      orderDate: [],
      orderAmount: [],
      orderGid: [],
      orderAllCount: null,
      gidObj: {},
    };
  },
  methods: {
    getOrderData() {
      this.axios
        .get(
          "http://localhost:8888/order/queryData",
          {
            params: {
              token: this.token,
              dStatue: true,
              sId: 1,
            },
          },
          { emulateJSON: true }
        )
        .then((resp) => {
          if (resp.data.message === "查询成功") {
            // console.log(resp);
            this.orderData = resp.data.data;

            this.orderData.sort(function (a, b) {
              return Date.parse(a.ddate) - Date.parse(b.ddate);
            });
            // console.log(this.orderData);
            this.orderAllCount = resp.count;
            this.orderData.forEach((item) => {
              this.orderDate.push(item.ddate);
              this.orderAmount.push(item.damount);
              this.orderGid.push(item.gid);
            });
            // console.log(this.orderDate);
            // console.log(this.orderAmount);
            // console.log(this.orderGid);
            this.gidObj = this.orderGid.reduce(function (acc, cur) {
              if (acc[cur]) {
                acc[cur]++; // 已存在的数值，数量加1
              } else {
                acc[cur] = 1; // 不存在的数值，初始化为1
              }
              return acc;
            }, {});
            console.log(this.gidObj);
            this.drowPie();

            this.drowLine();
          }
          // console.log(resp.data);
        })
        .catch((error) => {
          console.log(error);
        });
    },
    drowLine() {
      var myChart = this.$echarts.init(document.getElementById("main"));

      myChart.setOption({
        title: {
          text: "销售额",
        },
        xAxis: {
          type: "category",
          data: this.orderDate,
          axisLabel: {
            formatter: function (value) {
              return new Date(value).toLocaleDateString();
            },
          },
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            data: this.orderAmount,
            type: "line",
          },
        ],
      });
    },
    drowPie() {
      let keys = Object.keys(this.gidObj);
      var data = [];
      keys.forEach((item) => {
        console.log(item, this.gidObj[item]);
        data.push({
          value: this.gidObj[item],
          name: "商品ID:" + item,
        });
      });
      console.log(data,"<<<<< Pie图");

      var myChart = this.$echarts.init(document.getElementById("pie"));
      myChart.setOption({
        title: {
          text: "商品销量占比",
        },
        series: [
          {
            type: "pie",
            data: data,
            encode: {
              itemName: "name", // 指定数据源中的哪个字段作为饼图的名称
              value: "value", // 指定数据源中的哪个字段作为饼图的值
            },
          },
        ],
      });
    },
  },
  mounted() {
    this.getOrderData();
  },
};
</script>

<style>
.chart-container {
  display: flex;
  flex-wrap: nowrap;
}

.chart {
  flex: 1;
}
</style>