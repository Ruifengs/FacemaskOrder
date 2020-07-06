package com.facemask.service;

import com.facemask.domain.Facemask;
import com.facemask.domain.Orders;
import com.facemask.dto.OrderExecution;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Map;

public interface OrdersService {

    //添加订单（预定口罩）
    public int insertOrders(Orders orders);

    //根据身份证号查询订单
    public Orders quaryOrderByorderId(Integer orderId);

    //删除订单，口罩领取后删除订单
    public int deleteOrders(int orderId);

    //返回预约情况
    OrderExecution order(Orders orders) throws Exception;

    //返回所有订单
    List<Orders> findAllOrders();

    //返回所有未领取的订单
    List<Orders> findAll_unaccalimed();

    //修改订单
    int updateOrder(Orders orders);

    //根据pId查询订单
    List<Orders> quaryOrderBypId(Integer pId);

    //联合查询订单表与口罩表
    List<Map<Orders, Facemask>> find_Details();

    //联合查询订单表与口罩表，状态为未领取
    List<Map<Orders, Facemask>> find_Details_un();

    //模糊查询 pId 口罩名称,状态为未领取
    List<Map<Orders, Facemask>> search_Details_un(String f_name);
}
