package com.ning.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ning.entity.CurrentUser;
import com.ning.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * ClassName: CurrentUserMapper <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@Mapper
public interface CurrentUserMapper extends BaseMapper<CurrentUser> {

    @Select(value="{CALL get_user_by_token(#{token})}")
    User getUserByToken(@Param("token") String token);

}
