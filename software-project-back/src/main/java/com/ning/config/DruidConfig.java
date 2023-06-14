package com.ning.config;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.HashMap;

/**
 * ClassName: DruidConfig <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/5 0005
 * @since JDK 11
 */

@Configuration
@ConfigurationProperties(value = "application.yml")
public class DruidConfig {


    @Value("${loginAccount.username}")
    private String username;

    @Value("${loginAccount.password}")
    private String password;

    @ConfigurationProperties(prefix = "spring.datasource")
    @Bean
    public DataSource druidDataSource(){
        return new DruidDataSource();
    }

    @Bean
    public ServletRegistrationBean druidBack(){
        ServletRegistrationBean<StatViewServlet> statViewServletServletRegistrationBean = new ServletRegistrationBean<>(new StatViewServlet(), "/druid/*");

        HashMap<String, String> initParameters = new HashMap<>();
        initParameters.put("loginUsername",username);
        initParameters.put("loginPassword",password);
        initParameters.put("allow","");

        statViewServletServletRegistrationBean.setInitParameters(initParameters);

        return statViewServletServletRegistrationBean;
    }

    @Override
    public String toString() {
        return "DruidConfig{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}




