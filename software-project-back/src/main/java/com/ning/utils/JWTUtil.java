package com.ning.utils;

import com.ning.entity.User;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName: JWTUtil <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@Repository
@PropertySource(value = "classpath:application.yml")
public class JWTUtil {
    @Value("${token.SECRET_KEY}")
    private String SECRET_KEY;
    @Value("${token.EXPIRATION_TIME}")
    private long EXPIRATION_TIME;

    /**
     * 生成token
     * @param prompt
     * @return
     */
    public String generateToken(String prompt) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("sub", prompt);
        claims.put("iat", new Date());
        claims.put("exp", new Date(System.currentTimeMillis() + EXPIRATION_TIME));

        return Jwts.builder()
                .setClaims(claims)
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
                .compact();
    }

    /**
     * 解析token
     * @param token
     * @return
     */
    public String getPromptFromToken(String token) {
        return Jwts.parser()
                .setSigningKey(SECRET_KEY)
                .parseClaimsJws(token)
                .getBody()
                .getSubject();
    }

}
