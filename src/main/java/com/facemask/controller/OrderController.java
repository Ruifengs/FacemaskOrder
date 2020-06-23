package com.facemask.controller;

import com.facemask.domain.Facemask;
import com.facemask.domain.Orders;
import com.facemask.domain.Person;
import com.facemask.dto.OrderExecution;
import com.facemask.service.FaceMaskService;
import com.facemask.service.OrdersService;
import com.facemask.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    OrdersService ordersService;
    @Autowired
    FaceMaskService faceMaskService;
    @Autowired
    PersonService personService;
    @Autowired
    OrderExecution orderExecution;

    //预约细则
    @RequestMapping("/rules")
    public String rules(){
        return "order/o_rules";
    }

    //进入预约页面
    @RequestMapping("/main")
    public ModelAndView main(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        Person person= (Person) session.getAttribute("person");
        List<Facemask> facemasks = faceMaskService.findAll();
        System.out.println(person);
        System.out.println(facemasks);
        mv.setViewName("order/o_main");
        mv.addObject("person",person);
        mv.addObject("facemasks", facemasks);
        return mv;
    }

    //对提交预约信息进行处理
    @RequestMapping("/orderSubmit")
    public ModelAndView orderSubmit(Orders orders, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        Person person= (Person) session.getAttribute("person");
        System.out.println(person.getpId());
        orders.setpId(person.getpId());
        orders.setOrderTime(new Date());
        System.out.println(orders);
        orderExecution = ordersService.order(orders);
        mv.addObject("orderExecution", orderExecution);
        mv.setViewName("order/success");
        return mv;
    }

    @RequestMapping("/ordersManage")
    public ModelAndView ordersManage() {
        ModelAndView mv = new ModelAndView();
        List<Orders> orders = ordersService.findAllOrders();
        System.out.println(orders);
        mv.setViewName("order/o_manage");
        mv.addObject("orders", orders);
        return mv;
    }

}
