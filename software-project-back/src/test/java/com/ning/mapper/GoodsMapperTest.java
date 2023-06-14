package com.ning.mapper;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.test.autoconfigure.MybatisPlusTest;
import com.ning.entity.Goods;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/**
 * ClassName: GoodsMapperTest <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/5 0005
 * @since JDK 11
 */
@SpringBootTest
public class GoodsMapperTest {

    @Autowired
    GoodsMapper goodsMapper;

    @Test
    public void addGoods(){

        List<Goods> goods = goodsMapper.selectList(null);
        goods.forEach(System.out::println);
    }

    @Test
    public void pageGoodsTest(){
        int page = 2,limit = 10;
        Page<Goods> goodsPage = new Page<>(page, limit);
        QueryWrapper<Goods> wp = new QueryWrapper<>();
        Goods goods = new Goods();
        wp.like("gName",goods.getGName()==null?"":goods.getGName());
        Page<Goods> goodsPage1 = goodsMapper.selectPage(goodsPage, wp);
        System.out.println(goodsPage1.toString());
    }
}
