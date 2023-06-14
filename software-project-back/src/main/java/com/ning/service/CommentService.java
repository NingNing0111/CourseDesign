package com.ning.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ning.entity.Comment;
import com.ning.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ClassName: CommentService <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/7 0007
 * @since JDK 11
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class CommentService {
    final
    CommentMapper commentMapper;

    public CommentService(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    /**
     * 添加一条评论
     * @param comment
     * @return
     */
    public int addComment(Comment comment){
        return commentMapper.insert(comment);
    }

    /**
     * 删除评论
     * @param comment
     * @return
     */
    public int deleteComment(Comment comment){
        return commentMapper.deleteById(comment);
    }

    /**
     * 查询所有评论
     * @return
     */
    public List<Comment> queryAll(){
        return commentMapper.selectList(null);
    }

    /**
     * 依据商品ID查询评论
     * @param gId
     * @return
     */
    public List<Comment> queryAll(int gId){
        QueryWrapper<Comment> wp = new QueryWrapper<>();
        wp.eq("gId",gId);
        return commentMapper.selectList(wp);
    }


}
