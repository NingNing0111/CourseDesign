package com.ning.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ClassName: Profit <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/11 0011
 * @since JDK 11
 */
@Data
@TableName("profit")
@AllArgsConstructor
@NoArgsConstructor
public class Profit {
    @TableField("dId")
    Integer dId;
    @TableField("profit")
    Double profit;
}
