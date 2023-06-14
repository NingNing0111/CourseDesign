package com.ning.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ning.entity.Goods;
import com.ning.mapper.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Wrapper;
import java.util.List;

/**
 * ClassName: GoodsService <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class GoodsService {
    private final GoodsMapper goodsMapper;

    public GoodsService(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    /**
     * 查询所有商品
     * @return 查询到的商品集合
     */
    public List<Goods> queryGoods(){
        return goodsMapper.selectList(null);
    }

    /**
     * 添加商品
     * @param goods
     * @return 添加商品的数量
     */
    public int addGoods(Goods goods){
        return goodsMapper.insert(goods);
    }

    /**
     * 依据商品ID修改商品
     * @param goods
     * @return 商品修改的记录数
     */
    public int update(Goods goods){
        return goodsMapper.updateById(goods);
    }

    /**
     * 依据prompt查询商品
     */
    public List<Goods> search(String prompt){
        QueryWrapper<Goods> goodsQueryWrapper = new QueryWrapper<>();
        goodsQueryWrapper.like("gName",prompt);
        return goodsMapper.selectList(goodsQueryWrapper);
    }

    /**
     * 依据Goods对象进行模糊搜索和分页搜索
     * @param goods 需要进行模糊搜索的Goods对象
     * @param offset 当前条数
     * @param limit 每页限制数
     * @return Page对象
     */
    public IPage<Goods> search(Goods goods, int offset, int limit){
        Page<Goods> goodsPage = new Page<>(offset, limit);
        QueryWrapper<Goods> wp = new QueryWrapper<>();
        wp.like("gName",goods.getGName()==null?"":goods.getGName());
        wp.like("gPrice",goods.getGPrice()==null?"":goods.getGPrice());
        wp.like("gContent",goods.getGContent()==null?"":goods.getGContent());
        if(goods.getUId() != null) {
            wp.eq("uId", goods.getUId());
        }


        return goodsMapper.selectPage(goodsPage, wp);
    }

    /**
     * 依据商品对象进行模糊搜索
     * @param goods
     * @return 匹配对象的商品集
     */

    public List<Goods> search(Goods goods){
        QueryWrapper<Goods> wp = new QueryWrapper<>();
        wp.like("gName",goods.getGName()==null?"":goods.getGName());
        return goodsMapper.selectList(wp);
    }

    /**
     * 删除商品
     * @param goods
     * @return
     */

    public int delete(Goods goods){
        UpdateWrapper<Goods> wp = new UpdateWrapper<>();
        wp.eq("gId",goods.getGId());
        return goodsMapper.delete(wp);
    }

    public int delete(List<Integer> ids){
        return goodsMapper.deleteBatchIds(ids);
    }

    public Goods query(Integer gId){
        QueryWrapper<Goods> wp = new QueryWrapper<>();
        wp.eq("gId",gId);
        return goodsMapper.selectOne(wp);
    }
}
