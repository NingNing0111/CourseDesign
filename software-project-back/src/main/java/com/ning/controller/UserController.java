package com.ning.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.ning.entity.CurrentUser;
import com.ning.entity.User;
import com.ning.service.CurrentUserService;
import com.ning.service.UserService;
import com.ning.utils.EncoderUtil;
import com.ning.utils.JWTUtil;
import com.ning.utils.Message;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName: UserController <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
@RestController
@RequestMapping("/user")
@Api(value = "用户管理",tags = "用户管理操作的接口")
@CrossOrigin
public class UserController {


    JWTUtil jwtUtil;
    UserService userService;
    CurrentUserService currentUserService;

    public UserController(UserService userService, JWTUtil jwtUtil, CurrentUserService currentUserService) {
        this.userService = userService;
        this.jwtUtil = jwtUtil;
        this.currentUserService = currentUserService;
    }

    @ApiOperation(value = "登录",notes = "通过传入邮箱和密码进行登录")
    @PostMapping(value = "/login")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "email",value = "用户登录时需要输入的邮箱"),
            @ApiImplicitParam(name = "password",value = "用户登录时需要输入的密码")
    })
    @CrossOrigin
    public Map<String,Object> login(
            @RequestParam("email") String email,
            @RequestParam("password") String password)
    {
        try{
            System.out.println(email);
            User user = userService.queryUser(email);
            if(user == null){
                return Message.getMessage("邮箱不存在");
            }else{
                // 取出密码（加密）
                String encodedPassword = user.getUPassword();
                if(!EncoderUtil.verifyPassword(password,encodedPassword)){
                    return Message.getMessage("密码错误");
                }else{
                    // 登录成功 生成token
                    String token = jwtUtil.generateToken(user.getUEmail());
                    CurrentUser currentUser = new CurrentUser(user.getUId(), token);
                    System.out.println(currentUser);
                    currentUserService.addInfo(currentUser);
                    HashMap<String, String> mp = new HashMap<>();
                    // 插入数据
                    mp.put("token",token);
                    return Message.getMessage("登录成功",mp);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器异常");
        }
    }

    @PostMapping(value = "/register")
    @ApiOperation(value = "注册",notes = "传入相关的用户信息进行注册")
    @ApiImplicitParam(name = "user",value = "一个用户对象，大部分属性都需要传入")
    @CrossOrigin
    public Map<String,Object> register(
            @ModelAttribute("user") User user)
    {
        // 前端传递过来的数据：uNickName、uPhone、uEmail、uPassword、uAddress
        // uId 自增、uIsVerify默认为false、uLevel默认为0
        try{
            // 取邮箱
            String email = user.getUEmail();
            User user1 = userService.queryUser(email);
            if(user1 != null){
                return Message.getMessage("邮箱已被注册");
            }else{
                // 取密码
                String password = user.getUPassword();
                // 加密
                user.setUPassword(EncoderUtil.getPasswordEncoder(password));
                int i = userService.addUser(user);
                if(i > 0){
                    return Message.getMessage("注册成功");
                }else{
                    return Message.getMessage("注册失败");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @ApiImplicitParam(name = "token",value = "用户登录后的唯一身份标识")
    @ApiOperation(value = "退出登录",notes = "依据token值退出")
    @PostMapping(value = "/loginout")
    @CrossOrigin
    public Map<String,Object> loginout(
            @RequestParam("token") String token)
    {
        System.out.println(token+"<<<<<<<<<<");
        try{
            int i = currentUserService.deleteToken(token);
            if(i == 1){
                return Message.getMessage("退出成功");
            }else{
                return Message.getMessage("退出失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @GetMapping(value = "/all")
    @CrossOrigin
    @ApiOperation(value = "查询所有用户信息", notes = "依据token值进行查询")
    @ApiImplicitParam(name = "token",value = "用户token")
    public Map<String,Object> queryAll(
            @RequestParam(defaultValue = "null") String token,
            @RequestParam(value = "page",defaultValue = "1") Integer page,
            @RequestParam(value="limit",defaultValue = "10") Integer limit
    ){
        try{
            if(currentUserService.verityToken(token) && "admin".equals(currentUserService.getUserByToken(token).getUNickname())){
                IPage<User> userIPage = userService.queryAll(page, limit);
                return Message.queryMessage(userIPage);
            }else {
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }

    }

    @GetMapping(value = "/tokenInfo")
    @CrossOrigin
    public Map<String,Object> queryUserInfo(
            @RequestParam(defaultValue = "null") String token
    ){
        try{
            if(currentUserService.verityToken(token)){
                User user = currentUserService.getUserByToken(token);
                if(user==null){
                    return Message.getMessage("token校验错误");
                }else{
                    return Message.getMessage(user);
                }
            }else{
                return Message.getMessage("身份校验错误");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @PostMapping("/delete")
    @CrossOrigin
    public Map<String,Object> delete(
            @RequestParam(defaultValue = "null") String token,
            @ModelAttribute User user
    ){
        try{
            if(currentUserService.verityToken(token) && "admin".equals(currentUserService.getUserByToken(token).getUNickname())){
                int delete = userService.delete(user);
                return Message.getMessage("注销成功");
            }else{
                return Message.getMessage("身份校验失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }
}
