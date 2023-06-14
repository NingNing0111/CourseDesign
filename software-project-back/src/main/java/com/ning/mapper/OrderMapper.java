package com.ning.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ning.entity.Order;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: OrderMapper <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@Mapper
public interface OrderMapper extends BaseMapper<Order> {
}
