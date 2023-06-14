package com.ning.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ning.entity.Comment;
import org.apache.ibatis.annotations.Mapper;

/**
 * ClassName: CommentMapper <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/7 0007
 * @since JDK 11
 */
@Mapper
public interface CommentMapper extends BaseMapper<Comment> {
}
