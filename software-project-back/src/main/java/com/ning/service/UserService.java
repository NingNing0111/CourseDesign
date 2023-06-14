package com.ning.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ning.entity.User;
import com.ning.mapper.UserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ClassName: UserService <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserService {

    final
    UserMapper userMapper;

    public UserService(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    /**
     * 插入一个用户
     * @param user
     * @return 插入的记录数
     */
    public int addUser(User user){
        return userMapper.insert(user);
    }

    /**
     * 修改用户
     * @param user
     * @return 成功修改的记录个数
     */
    public int updateUser(User user){
        return userMapper.updateById(user);
    }

    /**
     * 依据用户uId删除对应的用户
     * @param uId
     * @return
     */
    public int delete(int uId){
        QueryWrapper<User> wp = new QueryWrapper<>();
        wp.eq("uId",uId);
        return userMapper.delete(wp);
    }

    /**
     * 依据用户邮箱查询用户
     *
     * @return
     */
    public User queryUser(String email){
        QueryWrapper<User> wp = new QueryWrapper<>();
        wp.eq("uEmail",email);
        return userMapper.selectOne(wp);
    }

    /**
     * 依据邮箱和密码查询记录
     * @param email
     * @param password
     * @return 用户
     */
    public User queryUser(String email,String password){
        QueryWrapper<User> wp = new QueryWrapper<>();
        wp.eq("uEmail",email);
        wp.eq("uPassword",password);
        return userMapper.selectOne(wp);
    }

    /**
     * 依据uId查询用户
     * @param uId
     * @return
     */
    public User queryUser(int uId){
        QueryWrapper<User> wp = new QueryWrapper<>();
        wp.eq("uId",uId);
        return userMapper.selectOne(wp);
    }

    /**
     * 查询所有用户
     * @return
     */
    public IPage<User> queryAll(Integer page, Integer limit){
        Page<User> userPage = new Page<>(page,limit);
        return userMapper.selectPage(userPage,null);
    }

    public int delete(User user){
        return userMapper.deleteById(user);
    }



}
