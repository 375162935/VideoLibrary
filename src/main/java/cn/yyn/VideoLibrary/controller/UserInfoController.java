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
            jsonObject.put("result", "2");
            session.setAttribute("user",userInfo);
        }
        System.out.println(jsonObject.toString());
        return jsonObject.toString();
    }

    @RequestMapping("/register.do")
    public ModelAndView register(UserInfo userInfo) {
        ModelAndView mv = new ModelAndView();
        UserInfo user = userService.findUserByUserName(userInfo.getUsername());
        if (user != null) {
            int i = userService.addUserInfo(userInfo);
            if (i > 0) {
                System.out.println("添加成功");
                mv.addObject("userInfo", userInfo);
                mv.setViewName("login");
            } else {
                System.out.println("添加失败");
                mv.addObject("error", "添加失败");
                mv.setViewName("register");
            }
        } else {
            mv.addObject("errors", "账号已注册");
            mv.setViewName("register");
        }
        return mv;
    }

    @RequestMapping("/exit.do")
    public String exit(HttpSession session) {
        try {
            session.removeAttribute("userInfo");
        } catch (Exception e) {

        }
        return "redirect:../index";
    }
}
