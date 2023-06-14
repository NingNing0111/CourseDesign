package com.ning.service;

import com.ning.entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

/**
 * ClassName: UserServiceTest <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@SpringBootTest
public class UserServiceTest {
    @Autowired
    UserService userService;

    /**
     * 添加用户测试
     */
    @Test
    public void addUserTest(){
        User user = new User();
//        (50, '94701382650', '8eOMVAIu', '8eOMVAIu@example.com', 'zQtKme0s', True, '科技大J20栋435', 2);
        user.setUEmail("8eOMVAIu@example.com");
        user.setUPhone("94701382650");
        user.setUNickname("8eOMVAIu");
        user.setUIsVerify(true);
        user.setUPassword("zQtKme0s");
        user.setUAddress("科技大J20栋435");
        user.setULevel(2);
        userService.addUser(user);
    }

    /**
     * 删除用户测试
     */
    @Test
    public void deleteUserTest(){
        int delete = userService.delete(41);
        System.out.println(delete + "<<<<<<<<<<------------");
    }

    /**
     * 依据邮箱查询用户
     */
    @Test
    public void queryUserEmailTest(){
        String email = "231";
        User user = userService.queryUser(email);
        System.out.println(user);
    }

    /**
     * 校验
     */
    @Test
    public void queryUserEmailAndPasswordTest(){
        String email = "EUzm68ki@example.com";
        String password = "9fgB2GeK";
        User user = userService.queryUser(email, password);
        System.out.println(user + "<<<<<<<<<<<<");
    }

}
