package com.facemask.service;

import com.facemask.domain.Orders;
import com.facemask.dto.OrderExecution;

import java.util.List;

public interface OrdersService {

    //添加订单（预定口罩）
    public int insertOrders(Orders orders);
    //根据预约人ID查询订单,每次只有一个订单，返回Orders
    public Orders quaryOrderBypId(String pId);
    //根据身份证号查询订单
    public Orders quaryOrderByidNum(String idNum);
    //删除订单，口罩领取后删除订单
    public int deleteOrders(int orderId);
    //返回预约情况
    OrderExecution order(Orders orders) throws Exception;
    //返回所有订单
    List<Orders> findAllOrders();
}
