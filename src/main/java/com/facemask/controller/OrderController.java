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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
    public String rules() {
        return "order/o_rules";
    }

    //进入预约页面
    @RequestMapping("/main")
    public ModelAndView main(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        Person person = (Person) session.getAttribute("person");
        List<Facemask> facemasks = faceMaskService.findAll();
        System.out.println(person);
        System.out.println(facemasks);
        mv.setViewName("order/o_main");
        mv.addObject("person", person);
        mv.addObject("facemasks", facemasks);
        return mv;
    }

    //对提交预约信息进行处理
    @RequestMapping(value = "/orderSubmit")
    public ModelAndView orderSubmit(Orders orders, HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        Person person = (Person) session.getAttribute("person");
        ModelAndView mv = new ModelAndView();
        orders.setpId(person.getpId());
        orders.setOrderTime(new Date());
        orders.setOrderStatus(0);
        orders.setGetFacemaskTime(null);
        Facemask facemask = faceMaskService.findByID(orders.getFmaskId());
        Result<OrderExecution> result;
        OrderExecution orderExecution = null;
        mv.setViewName("/order/o_result");
        orderExecution = ordersService.order(orders);
        result = new Result<OrderExecution>(true, orderExecution);
        System.out.println("result"+result);
        mv.addObject("resutl",result);
        return mv;
//        } catch (NoNumberException e1) {
//            orderExecution = new OrderExecution(facemask.getF_name(), OrderStateEnum.NO_NUMBER);
//            result = new Result<OrderExecution>(false, orderExecution);
//            mv.addObject("resutl",result);
//            return mv;
//        } catch (RepeatOrderException e2) {
//            orderExecution = new OrderExecution(facemask.getF_name(), OrderStateEnum.REPEAT_APPOINT);
//            result = new Result<OrderExecution>(false, orderExecution);
//            mv.addObject("resutl",result);
//            return mv;
//        } catch (Exception e) {
//            orderExecution = new OrderExecution(facemask.getF_name(), OrderStateEnum.INNER_ERROR);
//            result = new Result<OrderExecution>(false, orderExecution);
//            mv.addObject("resutl",result);
//            return mv;
//        }

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
    public ModelAndView findBypId(@PathVariable("pId") Integer pId) {
        ModelAndView mv = new ModelAndView();
        List<Orders> orders = ordersService.quaryOrderBypId(pId);
        if (orders != null) {
            List<String> facemaskName = new ArrayList<>();
            for (Orders order : orders) {
                String fName = faceMaskService.findF_Name(order.getFmaskId());
                facemaskName.add(fName);
            }
            mv.addObject("orders", orders);
            mv.addObject("faceType", facemaskName);
            System.out.println("bvvvv：" + facemaskName);
        } else {
            String message = "您还没预约！";
            mv.addObject("message", message);
        }
        mv.setViewName("person/p_order");
        System.out.println("aaaa：" + orders);
        return mv;
    }

    //删除订单
    @RequestMapping("/{orderId}/orderDelete")
    public String orderDelete(@PathVariable Integer orderId) {
        int delete = ordersService.deleteOrders(orderId);
        return "/person/p_success";
    }

    //跳转到修改订单页面
    @RequestMapping(value = "/{orderId}/orderModify")
    public ModelAndView orderModify(@PathVariable Integer orderId) {
        ModelAndView mv = new ModelAndView();
        Orders order = ordersService.quaryOrderByorderId(orderId);
        String fmaskType = faceMaskService.findF_Name(order.getFmaskId());
        System.out.println("测试修改订单: " + order + "type: " + fmaskType);
        List<Facemask> facemasks = faceMaskService.findAll();
        mv.setViewName("order/o_modify");
        mv.addObject("order", order);
        mv.addObject("fmaskType", fmaskType);
        mv.addObject("facemasks", facemasks);
        return mv;
    }

    //订单修改提交
    @RequestMapping("/orderModifySubmit")
    public String orderModifySubmit(Orders order) {
        int insert = ordersService.updateOrder(order);
        return "/order/o_mo_success";
    }

    //查看领取口罩
    @RequestMapping("/getFacemask")
    public ModelAndView getFaskmaskPage() {
        List<Map<Orders,Facemask>> maps = ordersService.find_Details_un();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("orders", maps);
        modelAndView.setViewName("facemask/f_get");
        return modelAndView;
    }

    //搜索领取口罩
    @RequestMapping("search")
    public ModelAndView getFaskmaskPage_search(String search){
        List<Map<Orders,Facemask>> maps = ordersService.search_Details_un(search);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("orders", maps);
        modelAndView.setViewName("facemask/f_get");
        return modelAndView;
    }

    //领取口罩或取消订单
    @RequestMapping("rec_f")
    public String receive_Facemask(Integer orderId, Integer method) {
        Orders orders = ordersService.quaryOrderByorderId(orderId);
        if (method == 1)
            orders.setOrderStatus(1);
        else
            orders.setOrderStatus(-1);
        orders.setGetFacemaskTime(new Date());
        int modify = ordersService.updateOrder(orders);
        if (modify == 1)
            return "facemask/f_success";
        else
            return "facemask/f_fail";
    }


    //领取口罩后保存信息
    @RequestMapping("/{orderId}/getFaskmaskSubmit")
    public String getFaskmaskSubmit(@PathVariable Integer orderId) {
        Orders orders = ordersService.quaryOrderByorderId(orderId);
        orders.setOrderStatus(1);
        orders.setGetFacemaskTime(new Date());
        System.out.println("oooo：" + orders);
        int modify = ordersService.updateOrder(orders);
        return "success";
    }

    @RequestMapping("/mmm")
    public String mmm()
    {
        return "/order/o_manage";
    }
}
