package com.ning;

import com.ning.entity.Goods;
import com.ning.mapper.GoodsMapper;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
//@MapperScan("com.ning.mapper")
class SoftwareProjectApplicationTests {

    @Autowired
    GoodsMapper goodsMapper;


    @Test
    void contextLoads() {
        List<Goods> goods = goodsMapper.selectList(null);
        goods.forEach(System.out::println);
    }

 }
