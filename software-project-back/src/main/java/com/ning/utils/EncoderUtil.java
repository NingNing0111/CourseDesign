package com.ning.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

/**
 * ClassName: EncoderUtil <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */

public class EncoderUtil {

    private static final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    /**
     * 密码加密 不可逆
     * @param password
     * @return
     */
    public static String getPasswordEncoder(String password){
        return passwordEncoder.encode(password);
    }

    /**
     * 校验密码是否正确
     * @param rowPassword
     * @param encodedPassword
     * @return
     */
    public static boolean verifyPassword(String rowPassword,String encodedPassword){
        return passwordEncoder.matches(rowPassword,encodedPassword);
    }

}
