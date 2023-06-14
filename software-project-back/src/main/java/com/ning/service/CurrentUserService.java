package com.ning.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.ning.entity.CurrentUser;
import com.ning.entity.User;
import com.ning.mapper.CurrentUserMapper;
import com.ning.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ClassName: CurrentUserService <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class CurrentUserService {
    final
    CurrentUserMapper currentUserMapper;

    final
    UserMapper userMapper;

    public CurrentUserService(CurrentUserMapper currentUserMapper, UserMapper userMapper) {
        this.currentUserMapper = currentUserMapper;
        this.userMapper = userMapper;
    }

    /**
     * 插入一条登录记录
     * @param currentUser
     */
    public int addInfo(CurrentUser currentUser){
       return currentUserMapper.insert(currentUser);
    }

    /**
     * 删除token
     * @param token
     * @return
     */
    public int deleteToken(String token){
        UpdateWrapper<CurrentUser> wp = new UpdateWrapper<>();
        wp.eq("token",token);
        return currentUserMapper.delete(wp);
    }


    /**
     * 依据token查询信息
     * @param token
     * @return
     */
    public User queryToken(String token){
        QueryWrapper<CurrentUser> wp = new QueryWrapper<>();
        wp.eq("token",token);
        CurrentUser currentUser = currentUserMapper.selectOne(wp);
        if(currentUser == null){
            return null;
        }
        QueryWrapper<User> uwp = new QueryWrapper<>();
        uwp.eq("uId",currentUser.getUId());
        return userMapper.selectOne(uwp);
    }

    /**
     * 校验token
     * @param token
     * @return
     */

    public boolean verityToken(String token){
        QueryWrapper<CurrentUser> wp = new QueryWrapper<>();
        wp.eq("token",token);
        List<CurrentUser> currentUsers = currentUserMapper.selectList(wp);
        if(currentUsers.size() == 1){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 依据token值返回用户信息
     * @param token
     * @return
     */
    public User getUserByToken(String token){
       return currentUserMapper.getUserByToken(token);
    }
}

