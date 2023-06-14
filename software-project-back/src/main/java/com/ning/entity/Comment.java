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
 * ClassName: Comment <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/7 0007
 * @since JDK 11
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("comment")
public class Comment {
    @TableId(value = "pId",type = IdType.AUTO)
    private int pId;
    @TableField(value = "pContent")
    private String pContent;
    @TableField(value = "pDate")
    private Timestamp pDate;
    @TableField(value = "pSellerOfLevel")
    private int pSellerOfLevel;
    @TableField(value = "pGoodsOfLevel")
    private int pGoodsOfLevel;
    @TableField(value = "bId")
    private int bId;
    @TableField(value = "gId")
    private int gId;
}
