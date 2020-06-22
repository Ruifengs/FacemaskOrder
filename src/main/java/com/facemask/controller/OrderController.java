package com.facemask.controller;

import com.facemask.domain.Facemask;
import com.facemask.domain.Orders;
import com.facemask.dto.OrderExecution;
import com.facemask.service.FaceMaskService;
import com.facemask.service.OrdersService;
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
    OrderExecution orderExecution;

    //进入预约页面
    @RequestMapping("/main")
    public ModelAndView main() {
        ModelAndView mv = new ModelAndView();
        List<Facemask> facemasks = faceMaskService.findAll();
        System.out.println(facemasks);
        mv.setViewName("order/o_main");
        mv.addObject("facemasks",facemasks);
        return mv;
    }

    //对提交预约信息进行处理
    @RequestMapping("/orderSubmit")
    public ModelAndView orderSubmit(Orders orders, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        String personId = (String) session.getAttribute("personId");
        System.out.println(personId);
        orders.setpId(personId);
        orders.setOrderTime(new Date());
        orderExecution = ordersService.order(orders);
        mv.addObject("orderExecution",orderExecution);
        mv.setViewName("order/success");
        System.out.println(new Date());
        return mv;
    }

    @RequestMapping("/ordersManage")
    public ModelAndView ordersManage(){
        ModelAndView mv = new ModelAndView();
        List<Orders> orders= ordersService.findAllOrders();
        System.out.println(orders);
        mv.setViewName("order/o_manage");
        mv.addObject("orders",orders);
        return mv;
    }

}
