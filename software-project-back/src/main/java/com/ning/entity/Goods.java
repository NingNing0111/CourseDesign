package com.ning.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ClassName: Goods <br/>
 *
 * @author Ning <br/>
 * @date 2023/5/29 0029
 * @since JDK 11
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "goods")
public class Goods {

    @TableId(value = "gId",type = IdType.AUTO)
    private Integer gId;
    @TableField(value = "gName")
    private String gName;
    @TableField(value = "gCount")
    private Integer gCount;
    @TableField(value = "gContent")
    private String gContent;
    @TableField(value = "gPrice")
    private Double gPrice;
    @TableField(value = "uId")
    private Integer uId;
    @TableField(value = "gImage")
    private String gImage;
    @TableField(value = "gLevel")
    private Integer gLevel;
}
