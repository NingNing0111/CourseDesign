package com.ning.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * ClassName: Message <br/>
 *
 * @author Ning <br/>
 * @date 2023/6/6 0006
 * @since JDK 11
 */
public class Message {

    public static Map<String,Object> getMessage(){
        HashMap<String, Object> map = new HashMap<>();
        map.put("message","ok");
        map.put("code",200);
        return map;
    }

    public static Map<String,Object> getMessage(int code){
        HashMap<String, Object> map = new HashMap<>();
        map.put("message","ok");
        map.put("code",code);
        return map;
    }
    public static Map<String,Object> getMessage(String message){
        HashMap<String, Object> map = new HashMap<>();
        map.put("message",message);
        map.put("code",200);
        return map;
    }
    public static <T> Map<String,Object> getMessage(T data){
        HashMap<String, Object> map = new HashMap<>();
        map.put("message","ok");
        map.put("code",200);
        map.put("data",data);
        return map;
    }
    public static <T> Map<String,Object> getMessage(String message,T data){
        HashMap<String, Object> map = new HashMap<>();
        map.put("message",message);
        map.put("code",200);
        map.put("data",data);
        return map;
    }

    public static <T> Map<String,Object> getMessage(String message,T data,int code){
        HashMap<String, Object> map = new HashMap<>();
        map.put("message",message);
        map.put("code",code);
        map.put("data",data);
        return map;
    }
    public static <T> Map<String,Object> getMessage(String message,T data,int code,int count){
        HashMap<String, Object> map = new HashMap<>();
        map.put("message",message);
        map.put("code",code);
        map.put("data",data);
        map.put("count",count);
        return map;
    }

    public static <T> Map<String,Object> queryMessage(T data,int count){
        if(count > 0){
            return Message.getMessage("查询成功",data,200,count);
        }else{
            return Message.getMessage("未查询到任何商品",null,200);
        }
    }

    public static <T> Map<String,Object> queryMessage(T page){
        return getMessage(page);
    }

}
