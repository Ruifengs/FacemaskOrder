package com.facemask.controller;

import com.facemask.domain.Person;
import com.facemask.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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

    //普通用户首页
    @RequestMapping("/main")
    public String personMainPages(){
        return "person/p_main";
    }

    //管理员首页
    @RequestMapping("/root_main")
    public String rootMainPages(){
        return "manage/manage";
    }


    //普通用户登录验证判断
    @PostMapping("/personLoginSubmit")
    public String personLoginSubmit(Person person, HttpSession session, Model model) {
        Person person1 = personService.quaryPerson(person);
        System.out.println(person1);
        if (person1 != null) {
            session.setAttribute("person", person1);
            //判断用户权限  1--普通用户   0--管理员
            if (person1.getPermissions() == 0) {
                return "manage/manage";
            } else {
                return "person/p_main";
            }
        } else {
            model.addAttribute("msg", "账号或密码错误，请重新输入！");
            return "redirect:/";
        }
    }

    //用户管理
    @RequestMapping("/personManage")
    public ModelAndView personManage() {
        ModelAndView mv = new ModelAndView();
        List<Person> persons = personService.findAllperson();
        System.out.println("personManage"+persons);
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

    //用户信息修改
    @RequestMapping("/{pId}/personModify")
    public ModelAndView personModify(@PathVariable("pId") Integer pId){
        ModelAndView mv = new ModelAndView();
        Person person = personService.findByID(pId);
        mv.addObject("person",person);
        mv.setViewName("person/p_modify");
        return mv;
    }

    //用户信息修改提交
    @RequestMapping("/{pId}/personModifySubmit")
    public String personModifySubmit(Person person,@PathVariable Integer pId){
        System.out.println("person:"+person+"  pId:"+pId);
        person.setpId(pId);
        int update = personService.updatePerson(person);
        return "success";
    }

    //删除用户信息
    @GetMapping("/{pId}/personDelete")
    public String personDelete(@PathVariable Integer pId){
        int delete = personService.delectPerson(pId);
        System.out.println("deleteOK:"+delete);
        return "success";
    }

}
