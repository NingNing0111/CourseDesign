package com.ning.utils;

import com.ning.entity.User;
import com.ning.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * ClassName: JWTUtilTest <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@SpringBootTest
public class JWTUtilTest {
    @Autowired
    JWTUtil jwtUtil;
    @Autowired
    UserService userService;

    /**
     * token生成测试
     */
    @Test
    public void generateTokenTest(){
        String email = "EUzm68ki@example.com";
        String password = "9fgB2GeK";
//        User user = userService.queryUser(email,password);
        String token = jwtUtil.generateToken(email);
        System.out.println(token);
    }

    /**
     * token解析测试
     */
    @Test
    public void getUsernameFromToken(){
        String token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJFVXptNjhraUBleGFtcGxlLmNvbSIsImV4cCI6MTY4NjkwMDQwNTQ3NywiaWF0IjoxNjg2MDM2NDA1NDc3fQ.yBS-D5AppidN6fjQzmcKxn3aFCgawBdsF0sqdFUaCj0";
        String usernameFromToken = jwtUtil.getPromptFromToken(token);
        System.out.println(usernameFromToken);
    }
}
