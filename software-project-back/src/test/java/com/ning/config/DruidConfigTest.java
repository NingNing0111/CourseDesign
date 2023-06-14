package com.ning.config;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * ClassName: DruidConfigTest <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/5 0005
 * @since JDK 11
 */
@SpringBootTest
public class DruidConfigTest {

    @Autowired
    DruidConfig druidConfig;

    @Test
    public void paramTest() throws SQLException {
        System.out.println(druidConfig.toString());

        Connection connection = druidConfig.druidDataSource().getConnection();
        System.out.println(connection);
    }

}
