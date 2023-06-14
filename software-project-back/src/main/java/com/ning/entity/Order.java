package com.ning.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;


/**
 * ClassName: Order <br/>
 *
 * @author Ning <br/>
 * @date 2023/5/29 0029
 * @since JDK 11
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("`order`")
public class Order {
    @TableId(value = "dId",type = IdType.AUTO)
    private Integer dId;
    @TableField("dStatue")
    private Boolean dStatue;
    @TableField("dDate")
    private Timestamp dDate;
    @TableField("dAmount")
    private Double dAmount;
    @TableField("sId")
    private Integer sId;
    @TableField("gId")
    private Integer gId;
    @TableField("bId")
    private Integer bId;
    @TableField("dCount")
    private Integer dCount;
}
