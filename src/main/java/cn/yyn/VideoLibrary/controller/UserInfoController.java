package cn.yyn.VideoLibrary.controller;

import cn.yyn.VideoLibrary.bean.UserInfo;
import cn.yyn.VideoLibrary.service.UserService;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author 杨以诺
 * by 2020-05-19 17:18
 */
@Controller
@RequestMapping("/user")
public class UserInfoController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping("/login.do")
    public String Login(@Param("username") String username,
                        @Param("password") String password,
                        HttpSession session) {
        System.out.println("进入controller");
        JSONObject jsonObject = new JSONObject();
        UserInfo userInfo = userService.findUserByUserName(username);
        if (userInfo == null) {
            System.out.println("账号不存在");
            jsonObject.put("result", "0");
        } else if (!password.equals(userInfo.getPassword())) {
            System.out.println("密码错误");
            jsonObject.put("result", "1");
        } else {
            System.out.println("登陆成功");
            jsonObject.put("result", username);
            session.setAttribute("user", userInfo);
        }
        String json = jsonObject.toString();
        System.out.println(json);
        return jsonObject.toString();
    }

    @ResponseBody
    @RequestMapping("/register.do")
    public String register(@Param("username") String username,
                           @Param("password") String password,
                           @Param("name") String name,
                           @Param("sex") int sex,
                           @Param("trueName") String trueName) {
        JSONObject jsonObject = new JSONObject();
        UserInfo userInfo = userService.findUserByUserName(username);
        if (userInfo == null) {
            userInfo=new UserInfo();
            userInfo.setUsername(username);
            userInfo.setPassword(password);
            userInfo.setName(name);
            userInfo.setSex(sex);
            userInfo.setTrueName(trueName);
            System.out.println(userInfo);
            this.userService.addUserInfo(userInfo);
            System.out.println("添加成功");
            jsonObject.put("result", username);
        } else {
            System.out.println("账号已存在");
            jsonObject.put("result", "0");
        }
        return jsonObject.toString();
    }


    @RequestMapping("/exit.do")
    public String exit(HttpSession session) {
        try {
            session.removeAttribute("user");
        } catch (Exception e) {

        }
        return "redirect:/";
    }
}
