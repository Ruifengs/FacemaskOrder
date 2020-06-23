package com.facemask.controller;

import com.facemask.domain.Person;
import com.facemask.domain.Root;
import com.facemask.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 管理员与用户的控制器
 */
@Controller
@RequestMapping("/person")
public class PersonController {
    @Autowired
    PersonService personService;

    //登录页面
    @RequestMapping("/")
    public String index() {
        return "login";
    }

    //注册界面
    @RequestMapping("/registered")
    public String registered() {
        return "/person/p_registered";
    }

    //用户注册
    @RequestMapping("/personRegistered")
    public String personRegisteredSubmit(Person person) {
        person.setPermissions(1);
        int res = personService.insert(person);
        return "success";
    }


    //普通用户登录验证判断
    @PostMapping("/personLoginSubmit")
    public String personLoginSubmit(Person person, HttpSession session, Model model) {
        Person person1 = personService.quaryPerson(person);
        System.out.println(person1);
        if (person1 != null) {
            session.setAttribute("person", person1);
            //判断用户权限  1--普通用户   0--管理员
            if (person1.getPermissions() == 0)
                return "manage/manage";
            else
                return "person/p_main";
        } else {
            model.addAttribute("msg", "账号或密码错误，请重新输入！");
            return "redirect:/";
        }
    }

    //root管理员登录验证
    @PostMapping("/rootLoginSubmit")
    public String rootLoginSubmit(Root root, HttpSession session, Model model) {
        Root root1 = personService.quaryRoot(root);
        if (root1 != null) {
            session.setAttribute("rootId", root.getRootId());
            System.out.println(root1);
            return "manage/manage";
        }
        model.addAttribute("msg", "账号或密码错误，请重新输入！");
        return "/WEB-INF/login";
    }

    //用户管理
    @RequestMapping("/personManage")
    public ModelAndView personManage() {
        ModelAndView mv = new ModelAndView();
        List<Person> persons = personService.findAllperson();
        System.out.println(persons);
        mv.setViewName("person/p_manage");
        mv.addObject("persons", persons);
        return mv;
    }

    // 退出系统
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session=request.getSession(false);   //防止创建Session
        session.removeAttribute("person");
        return "redirect:/";
    }
}
