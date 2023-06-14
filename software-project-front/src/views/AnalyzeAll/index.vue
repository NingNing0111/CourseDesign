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
    name: "AnalyzeAll",
    data() {
      return {
        token: localStorage.getItem("token"),
        profitData: [],
        orderGid: [],
        profitObj: {},
        drawObj: [],
      };
    },
    methods: {
      getOrderData() {
        this.axios
          .get(
            "http://localhost:8888/order/profitAll",
            {
              params: {
                token: this.token
              },
            },
            { emulateJSON: true }
          )
          .then((resp) => {
            if (resp.data.message === "ok") {
              // console.log(resp);
              this.profitData = resp.data.data.prts;
              this.orderGid = resp.data.data.gIds;
              console.log(JSON.stringify(this.profitData)+"利润",JSON.stringify(this.orderGid)+"订单ID");
              for(let i = 0; i < this.orderGid.length; i++){
                this.profitObj[this.orderGid[i]] = 0;
              }
              for(let i = 0; i < this.orderGid.length; i++){
                this.profitObj[this.orderGid[i]] += this.profitData[i];
              }

            //   console.log(this.profitObj);
              // 获取key
              let keys = Object.keys(this.profitObj);
              
              keys.forEach(item => {
                    this.drawObj.push({
                        name: "商品ID" + item,
                        value: this.profitObj[item]
                    })
              });
              console.log(this.drawObj);
             
              this.drowPie();
  
              this.drowLine();
            }
            // // console.log(resp.data);
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
            data: this.orderGid,
          },
          yAxis: {
            type: "value",
          },
          series: [
            {
              data: this.drawObj,
              type: "line",
            },
          ],
        });
      },
      drowPie() {
       
  
        var myChart = this.$echarts.init(document.getElementById("pie"));
        myChart.setOption({
          title: {
            text: "商品总销量占比",
          },
          series: [
            {
              type: "pie",
              data: this.drawObj,
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