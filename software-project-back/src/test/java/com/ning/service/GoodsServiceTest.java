package com.ning.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ning.entity.Goods;
import com.ning.mapper.GoodsMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * ClassName: GoodsServiceTest <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/10 0010
 * @since JDK 11
 */
@SpringBootTest
public class GoodsServiceTest {
    @Autowired
    GoodsService goodsService;

    @Autowired
    GoodsMapper goodsMapper;

    @Test
    public void pageTest(){
        Goods goods = new Goods();
        goods.setGName("");
        int page = 2;
        int limit = 10;
        IPage<Goods> search = goodsService.search(goods, page, limit);
        System.out.println(search.toString());
    }

    @Test
    public void goodsPageTest(){

    }

}
