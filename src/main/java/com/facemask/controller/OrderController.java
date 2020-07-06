package com.facemask.controller;

import com.facemask.domain.Facemask;
import com.facemask.domain.Orders;
import com.facemask.domain.Person;
import com.facemask.dto.OrderExecution;
import com.facemask.dto.Result;
import com.facemask.enums.OrderStateEnum;
import com.facemask.exception.NoNumberException;
import com.facemask.exception.RepeatOrderException;
import com.facemask.service.FaceMaskService;
import com.facemask.service.OrdersService;
import com.facemask.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
    @RequestMapping(value = "/orderSubmit",produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public Result<OrderExecution> orderSubmit(Orders orders, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Person person= (Person) session.getAttribute("person");
        orders.setpId(person.getpId());
        orders.setOrderTime(new Date());
        orders.setOrderStatus(0);
        orders.setGetFacemaskTime(null);
        Facemask facemask = faceMaskService.findByID(orders.getFmaskId());
        Result<OrderExecution> result;
        OrderExecution orderExecution = null;
        try{
            orderExecution = ordersService.order(orders);
            result = new Result<OrderExecution>(true,orderExecution);
            return result;
        }catch (NoNumberException e1){
            orderExecution = new OrderExecution(facemask.getF_name(), OrderStateEnum.NO_NUMBER);
            result = new Result<OrderExecution>(false,orderExecution);
            return result;
        }catch (RepeatOrderException e2){
            orderExecution = new OrderExecution(facemask.getF_name(), OrderStateEnum.REPEAT_APPOINT);
            result = new Result<OrderExecution>(false,orderExecution);
            return result;
        }catch (Exception e){
            orderExecution = new OrderExecution(facemask.getF_name(), OrderStateEnum.INNER_ERROR);
            result = new Result<OrderExecution>(false,orderExecution);
            return result;
        }

    }

    //订单管理
    @RequestMapping("/ordersManage")
    public ModelAndView ordersManage() {
        ModelAndView mv = new ModelAndView();
        List<Orders> orders = ordersService.findAllOrders();
        mv.setViewName("order/o_manage");
        mv.addObject("orders", orders);
        return mv;
    }

    //查看订单功能（根据用户名显示订单）
    @GetMapping("/{pId}/findBypId")
    public ModelAndView findBypId(@PathVariable("pId") Integer pId){
        ModelAndView mv = new ModelAndView();
        Orders order = ordersService.quaryOrderBypId(pId);
        Facemask facemask = faceMaskService.findByID(order.getFmaskId());
        mv.addObject("order",order);
        mv.addObject("faceType",facemask.getF_name());
        mv.setViewName("person/p_order");
        return mv;
    }

    //删除订单
    @RequestMapping("/{orderId}/orderDelete")
    public String orderDelete(@PathVariable Integer orderId){
        int delete = ordersService.deleteOrders(orderId);
        return "success";
    }

    //跳转到修改订单页面
    @RequestMapping(value = "/{orderId}/orderModify")
    public ModelAndView orderModify(@PathVariable Integer orderId){
        ModelAndView mv = new ModelAndView();
        Orders order = ordersService.quaryOrderByorderId(orderId);
        String fmaskType = faceMaskService.findF_Name(order.getFmaskId());
        System.out.println("测试修改订单: "+order+"type: "+fmaskType);
        List<Facemask> facemasks = faceMaskService.findAll();
        mv.setViewName("order/o_modify");
        mv.addObject("order",order);
        mv.addObject("fmaskType",fmaskType);
        mv.addObject("facemasks",facemasks);
        return mv;
    }

    //订单修改提交
    @RequestMapping("/orderModifySubmit")
    public String orderModifySubmit(Orders order){
        int insert = ordersService.updateOrder(order);
        return "success";
    }

    //领取口罩
    @RequestMapping("/{pId}/getFaskmask")
    public ModelAndView getFaskmask(@PathVariable Integer pId){
        Orders orders = ordersService.quaryOrderBypId(pId);
        Facemask facemask = faceMaskService.findByID(orders.getFmaskId());
        System.out.println("orders："+orders);
        ModelAndView modelAndView = new ModelAndView();
        String message = "";
        if(orders.getOrderId()!=null){
            if(orders.getOrderStatus()==0){
                modelAndView.addObject("orders",orders);
                modelAndView.addObject("facemask",facemask);
            }else {
                message = "您已经领取过口罩";
                modelAndView.addObject("message",message);
            }
        }else {
            message = "您还未预定口罩";
        }
        modelAndView.setViewName("person/p_getFacemask");
        return modelAndView;
    }

    //领取口罩后保存信息
    @RequestMapping("/{orderId}/getFaskmaskSubmit")
    public String getFaskmaskSubmit(@PathVariable Integer orderId){
        Orders orders = ordersService.quaryOrderByorderId(orderId);
        orders.setOrderStatus(1);
        orders.setGetFacemaskTime(new Date());
        System.out.println("oooo："+orders);
        int modify = ordersService.updateOrder(orders);
        return "success";
    }

}
