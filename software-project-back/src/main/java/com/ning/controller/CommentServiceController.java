package com.ning.controller;

import com.ning.entity.Comment;
import com.ning.service.CommentService;
import com.ning.service.CurrentUserService;
import com.ning.utils.Message;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * ClassName: CommentServiceController <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/7 0007
 * @since JDK 11
 */
@RestController
@RequestMapping("/comment")
@Api(value = "评论管理",tags = "评论管理操作的相关接口")
public class CommentServiceController {

    private final CurrentUserService currentUserService;

    private final CommentService commentService;

    public CommentServiceController(CurrentUserService currentUserService, CommentService commentService) {
        this.currentUserService = currentUserService;
        this.commentService = commentService;
    }

    @PostMapping("/add")
    @CrossOrigin
    @ApiOperation(value = "添加评论",notes = "参数为评论对象属性")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "token",value = "用户Token值"),
            @ApiImplicitParam(name = "comment",value = "评论对象，对象的所有属性都需要传入")
    })
    public Map<String,Object> addComment(
            @ModelAttribute Comment comment,
            @RequestParam(value = "token",defaultValue = "null") String token
            ){
        try{
            // 先校验token
            if(currentUserService.verityToken(token)){
                commentService.addComment(comment);
                return Message.getMessage("评论成功");
            }else{
                return Message.getMessage("请重新登录");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @GetMapping("/all")
    @CrossOrigin
    @ApiOperation(value = "查询评论",notes = "查询所有评论")
    public Map<String,Object> queryAll(){
        try{
            List<Comment> comments = commentService.queryAll();
            return Message.queryMessage(comments,comments.size());
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @DeleteMapping("/delete")
    @CrossOrigin
    @ApiOperation(value = "删除评论",notes = "默认依据Id进行评论删除")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "token",value = "用户Token值"),
            @ApiImplicitParam(name = "comment",value = "comment对象，pId参数必须有")
    })
    public Map<String,Object> delete(
            @RequestParam(value = "token",defaultValue = "null") String token,
            @ModelAttribute Comment comment
    ){
        try{
            if(currentUserService.verityToken(token)){
                int i = commentService.deleteComment(comment);
                return Message.getMessage("成功删除"+i + "条评论");
            }else{
                return Message.getMessage("身份校验不通过");
            }
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

    @GetMapping("/all/{gId}")
    @CrossOrigin
    @ApiOperation(value = "查询评论",notes = "查询商品gId的所有评论")
    @ApiImplicitParam(name = "gId",value = "依据商品ID查询对应的评论")
    public Map<String,Object> queryAll(
            @PathVariable(value = "gId") int gId
    ){
        try{
            List<Comment> comments = commentService.queryAll(gId);
            return Message.queryMessage(comments,comments.size());
        }catch (Exception e){
            e.printStackTrace();
            return Message.getMessage("服务器处理异常");
        }
    }

}
