package com.ning.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ning.entity.Goods;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: GoodsMapper <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/5 0005
 * @since JDK 11
 */
@Mapper
public interface GoodsMapper extends BaseMapper<Goods> {
}
