package com.ning;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
@MapperScan("com.ning.mapper")
public class SoftwareProjectApplication {

    public static void main(String[] args) {
        SpringApplication.run(SoftwareProjectApplication.class, args);
    }

}
