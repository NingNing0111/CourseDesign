package com.ning.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ning.entity.Goods;
import com.ning.entity.Order;
import com.ning.entity.Profit;
import com.ning.entity.User;
import com.ning.service.CurrentUserService;
import com.ning.service.GoodsService;
import com.ning.service.OrderService;
import com.ning.service.ProfitService;
import com.ning.utils.Message;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.*;

/**
 * ClassName: OrderController <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/7 0007
 * @since JDK 11
 */
@RestController
@RequestMapping("/order")
@Api(value = "订单管理",tags = "订单管理操作的相关接口")
public class OrderController {

    private final OrderService orderService;

    private final CurrentUserService currentUserService;

    private final GoodsService goodsService;

    private final ProfitService profitService;

    public OrderController(OrderService orderService, CurrentUserService currentUserService, GoodsService goodsService, ProfitService profitService) {
        this.orderService = orderService;
        this.currentUserService = currentUserService;
        this.goodsService = goodsService;
        this.profitService = profitService;
    }

    @GetMapping("/all")
    @ApiOperation(value = "订单查询接口")
    @CrossOrigin
    @ApiImplicitParam(name = "token",value = "用户Token值")
    public Map<String,Object> queryAll(
            @RequestParam(value = "token",defaultValue = "null") String token,
            @ModelAttribute Order order,
            @RequestParam(value="page" , defaultValue="1") int page,
            @RequestParam(value = "limit", defaultValue = "10") int limit
    ){
        try{
            if(currentUserService.verityToken(token)){
                IPage<Order> search = orderService.search(order, page, limit);
                return Message.queryMessage(search);
            }else{
                return Message.getMessage("身份校验未通过");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @GetMapping("/allByGoods")
    @ApiOperation(value = "查询商品订单")
    @CrossOrigin
    @ApiImplicitParams({
        @ApiImplicitParam(name = "token",value = "用户Token值"),
        @ApiImplicitParam(name = "goods",value = "商品对象，可以只传gId")
    })
    public Map<String,Object> queryAll(
            @RequestParam(value = "token",defaultValue = "null") String token,
            @ModelAttribute Goods goods
            ){
        try {
            if(currentUserService.verityToken(token)){
                List<Order> data = orderService.queryAllByGid(goods.getGId());
                return Message.queryMessage(data,data.size());
            }else{
                return Message.getMessage("身份校验未通过");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @GetMapping("/allByUser")
    @ApiOperation(value = "查询用户对应的订单")
    @CrossOrigin
    @ApiImplicitParams({
            @ApiImplicitParam(name = "token",value = "用户Token值"),
            @ApiImplicitParam(name = "user", value = "用户对象，可以只传uId")
    })
    public Map<String,Object> queryAll(
            @RequestParam(value = "token",defaultValue = "null") String token,
            @ModelAttribute User user
            ){
        try{
            if(currentUserService.verityToken(token)){
                List<Order> ordersByBuyer = orderService.queryAllByBid(user.getUId());
                List<Order> ordersBySeller = orderService.queryAllBySid(user.getUId());
                HashMap<String,Object> mp = new HashMap<>();
                mp.put("buyer",ordersByBuyer);
                mp.put("buyerSize",ordersByBuyer.size());
                mp.put("seller",ordersBySeller);
                mp.put("sellerSize",ordersBySeller.size());
                return Message.getMessage(mp);
            }else{
                return Message.getMessage("身份校验未通过");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @GetMapping("/queryData")
    @CrossOrigin
    public Map<String,Object> queryData(
            @RequestParam(value = "token",defaultValue = "null") String token,
            @ModelAttribute Order order
    ){
        try{
            if(currentUserService.verityToken(token)){
                List<Order> search = orderService.search(order);
                return Message.queryMessage(search,search.size());
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @PostMapping("/updatePay")
    @CrossOrigin
    public Map<String,Object> updatePay(
            @RequestParam String token,
            @RequestParam(value = "dId") int dId
    ){
        try{
            if (currentUserService.verityToken(token)){
                Order query = orderService.query(dId);
                query.setDStatue(true);
                int i = orderService.updatePay(query);
                return Message.getMessage("支付成功！");
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @PostMapping("/add")
    @CrossOrigin
    public Map<String,Object> addOrder(
            @RequestParam String token,
            @ModelAttribute Order order
    ){
        try{
            if(currentUserService.verityToken(token)){
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                order.setDDate(timestamp);
                orderService.add(order);
                Integer gId = order.getGId();
                Goods query = goodsService.query(gId);
                query.setGCount(query.getGCount() - order.getDCount());
                goodsService.update(query);
                return Message.getMessage("订单生成成功");
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @PostMapping("/profit")
    @CrossOrigin
    public Map<String,Object> profit(
            @RequestParam(defaultValue = "token") String token,
            @RequestParam(value="dId") Integer dId
    ){
        try{
            if(currentUserService.verityToken(token) && "admin".equals(currentUserService.queryToken(token).getUNickname())){
                // 获取订单收益
                Order order = orderService.query(dId);
                Double dAmount = order.getDAmount();
                // 创建
                Profit profit = new Profit();
                profit.setDId(dId);
                profit.setProfit(dAmount*0.02);
                int i = profitService.addProfit(profit);
                return Message.getMessage("成功获取收益");

            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常！");
        }
    }

    @GetMapping("/profitAll")
    @CrossOrigin
    public Map<String,Object> profit(
            @RequestParam(defaultValue = "token") String token
    ){
        try{
            if(currentUserService.verityToken(token) && "admin".equals(currentUserService.queryToken(token).getUNickname())){
                List<Profit> profits = profitService.queryAll();
                List<Integer> gId = new ArrayList<>();
                List<Double> prts = new ArrayList<>();
                for(Profit profit: profits){
                    Integer dId = profit.getDId();
                    Integer gId1 = orderService.query(dId).getGId();
                    gId.add(gId1);
                    prts.add(profit.getProfit());
                }
                HashMap<String, Object> mp = new HashMap<>();
                mp.put("gIds",gId);
                mp.put("prts",prts);
                return Message.getMessage(mp);
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常！");
        }
    }

}
