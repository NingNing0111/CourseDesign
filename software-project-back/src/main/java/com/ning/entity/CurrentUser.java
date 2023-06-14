package com.ning.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * ClassName: CurrentUser <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("currentuser")
public class CurrentUser {

    @TableField("uId")
    private int uId;
    @TableField("token")
    private String token;

}
