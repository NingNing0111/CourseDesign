package com.ning.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ning.entity.Order;
import com.ning.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ClassName: OrderService <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/7 0007
 * @since JDK 11
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class OrderService {
    private final OrderMapper orderMapper;

    public OrderService(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    /**
     * 查询所有订单
     * @return
     */
    public List<Order> queryAll(){
        return orderMapper.selectList(null);
    }

    /**
     * 依据商品ID查询商品信息
     * @param gId
     * @return
     */
    public List<Order> queryAllByGid(int gId){
        QueryWrapper<Order> wp = new QueryWrapper<>();
        wp.eq("gId",gId);
        return orderMapper.selectList(wp);
    }

    /**
     * 依据卖家ID 查询对应的订单
     * @param sId
     * @return
     */
    public List<Order> queryAllBySid(int sId){
        QueryWrapper<Order> wp = new QueryWrapper<>();
        wp.eq("sId",sId);
        return orderMapper.selectList(wp);
    }

    /**
     * 依据卖家ID查询对应的订单
     * @param bId
     * @return
     */
    public List<Order> queryAllByBid(int bId){
        QueryWrapper<Order> wp = new QueryWrapper<>();
        wp.eq("bId",bId);
        return orderMapper.selectList(wp);
    }

    public IPage<Order> search(Order order,int offset,int limit){
        Page<Order> orderPage = new Page<>(offset, limit);
        QueryWrapper<Order> wp = new QueryWrapper<>();
        wp.like("sId",order.getSId()==null?"":order.getSId());
        if(order.getDStatue() != null){
            wp.eq("dStatue",order.getDStatue());
        }
        wp.eq("bId",order.getBId());
        wp.like("dId",order.getDId() == null? "":order.getDId());
        return orderMapper.selectPage(orderPage,wp);
    }

    // 已支付的所有订单信息

    public List<Order> search(Order order){

        QueryWrapper<Order> wp = new QueryWrapper<>();
        wp.eq("dStatue",order.getDStatue());
        wp.eq("sId",order.getSId());
        return orderMapper.selectList(wp);
    }

    // 修改订单状态
    public int updatePay(Order order){
        UpdateWrapper<Order> wp = new UpdateWrapper<>();
        wp.eq("dId",order.getDId());
        return orderMapper.updateById(order);
    }

    // 依据订单ID查找订单
    public Order query(int dId){
        QueryWrapper<Order> wp = new QueryWrapper<>();
        wp.eq("dId",dId);
        return orderMapper.selectOne(wp);
    }

    public int add(Order order){
        return orderMapper.insert(order);
    }


}
