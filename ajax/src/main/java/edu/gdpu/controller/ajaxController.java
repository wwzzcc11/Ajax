package edu.gdpu.controller;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.gdpu.pojo.Person;
import edu.gdpu.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ajaxController {
    @RequestMapping("/a1")
    @ResponseBody
    public String a1(String msg, HttpServletRequest request) {
        System.out.println(request.getParameter("msg"));
        return msg;
    }

    @RequestMapping("/a2")
    @ResponseBody
    public User a2(User user) {
        System.out.println(user);
        return user;
    }

    @RequestMapping("/a3")
    @ResponseBody
    public String a3(User user) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        String s = mapper.writeValueAsString(user);
        System.out.println(user);
        System.out.println(s);
        return s;
    }

    @RequestMapping("/a4")
    @ResponseBody
    public String a4(User user) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        String s = mapper.writeValueAsString(user);
        System.out.println(user);
        return user.toString();
    }

    @RequestMapping("/a5")
    @ResponseBody
    public List<User> a5() {
        List<User> users = new ArrayList<>();
        users.add(new User("wu", "男", 34, "13029287283"));
        users.add(new User("chen", "男", 20, "13132328276"));
        users.add(new User("huang", "女", 43, "13929287276"));
        users.add(new User("liu", "女", 11, "13833339876"));
        users.add(new User("he", "男", 25, "18272882732"));
        return users;

    }
    @RequestMapping("/login")
    @ResponseBody
    public JSONObject login(Person person)  {
        System.out.println(person);
        JSONObject resultJsonObject = new JSONObject();
        int code = 0;
        String msg = null;
        if(person.getAccount().equals("wzcwzc")&&person.getPassword().equals("123456")){
            code = 1;
            msg = "login success";
        }
        else{
            code = 0 ;
            msg = "login fail";
        }
       resultJsonObject.put("code",code);
        resultJsonObject.put("msg",msg);
        return resultJsonObject;
    }
}