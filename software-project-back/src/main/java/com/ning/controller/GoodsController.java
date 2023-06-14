package com.ning.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ning.entity.CurrentUser;
import com.ning.entity.Goods;
import com.ning.service.CurrentUserService;
import com.ning.service.GoodsService;
import com.ning.utils.Message;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.logging.log4j.spi.ObjectThreadContextMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import javax.management.ObjectName;
import java.util.List;
import java.util.Map;

/**
 * ClassName: GoodsController <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@RestController
@RequestMapping(value = "/goods",produces = "application/json")
@Api(value = "商品管理",tags = "商品管理接口")
public class GoodsController {

    private final GoodsService goodsService;

    private final CurrentUserService currentUserService;

    public GoodsController(GoodsService goodsService, CurrentUserService currentUserService) {
        this.goodsService = goodsService;
        this.currentUserService = currentUserService;
    }


    @ApiOperation(value = "查询所有商品",notes = "查询所有商品信息")
    @GetMapping("/all")
    @CrossOrigin
    public Map<String,Object> queryAll()
    {
        try{
            List<Goods> goods = goodsService.queryGoods();
            return Message.queryMessage(goods,goods.size());
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @ApiOperation(value = "商品查询",notes = "依据prompt对商品进行商品名的模糊查询")
    @GetMapping("/search/{prompt}")
    @ApiImplicitParam(name = "prompt",value = "依据商品名进行模糊搜索的关键字")
    @CrossOrigin
    public Map<String,Object> queryAll(
            @PathVariable String prompt)
    {
        try{
            List<Goods> search = goodsService.search(prompt);
            return Message.queryMessage(search,search.size());
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @ApiOperation(value = "搜索商品",notes = "带分页进行商品模糊搜索")
    @CrossOrigin
    @ApiImplicitParams({
            @ApiImplicitParam(name = "goods",value = "依据goods里的属性进行商品的模糊查询",dataType = "Goods(Object)"),
            @ApiImplicitParam(name = "page",value = "分页查询中要查看第几页",defaultValue = "1"),
            @ApiImplicitParam(name = "limit",value = "分页查询中每页显示的数量",defaultValue = "10" )
    })
    @GetMapping("/search")
    public Map<String,Object> queryAll(
            @ModelAttribute Goods goods,
            @RequestParam(value = "page",defaultValue = "1") int page,
            @RequestParam(value = "limit",defaultValue = "10") int limit)
    {
        try{
            IPage<Goods> search = goodsService.search(goods, page, limit);
            return Message.queryMessage(search);
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @CrossOrigin
    @ApiOperation(value = "修改商品",notes = "修改商品信息")
    @ApiImplicitParam(name = "goods",value = "商品的实例对象，由前端传入对象的对应属性")
    @PostMapping("/update")
    public Map<String, Object> updateGoods(
            @RequestParam(value = "token",defaultValue = "null") String token,
            @ModelAttribute Goods goods)
    {
        System.out.println(token);
        try {
            if(currentUserService.verityToken(token)){
                int i = goodsService.update(goods);
                if(i > 0){
                    return Message.getMessage("修改成功");
                }else {
                    return Message.getMessage("修改失败");
                }
            }else {
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @ApiOperation(value = "添加商品",notes = "添加一条商品记录")
    @PostMapping("/add")
    @CrossOrigin
    @ApiImplicitParam(name = "goods",value = "商品的实例对象，由前端传入对象的对应属性")
    public Map<String,Object> addGoods(
            @RequestParam String token,
            @ModelAttribute Goods goods)
    {
        try {
            if(currentUserService.verityToken(token)){
                int i = goodsService.addGoods(goods);
                if(i > 0){
                    return Message.getMessage("添加成功");
                }else {
                    return Message.getMessage("添加失败");
                }
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @ApiOperation(value = "删除商品",notes = "删除一条商品记录")
    @PostMapping("/delete")
    @CrossOrigin
    public Map<String, Object> deleteGoods(
            @RequestParam(value = "token",defaultValue = "null") String token,
            @ModelAttribute Goods goods)
    {
        try {
            if(currentUserService.verityToken(token)){
                if(goodsService.delete(goods) > 0){
                    return Message.getMessage("删除成功");
                }else{
                    return Message.getMessage("删除失败");
                }
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @PostMapping("/deleteById")
    @CrossOrigin
    public Map<String,Object> deleteGoods(
            @RequestParam(defaultValue = "null") String token,
            @RequestParam(value = "listId") List<Integer> ids
    ){
        try{
            if(currentUserService.verityToken(token)){
                int delete = goodsService.delete(ids);
                return Message.getMessage("成功删除"+delete+"条商品");
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

}
