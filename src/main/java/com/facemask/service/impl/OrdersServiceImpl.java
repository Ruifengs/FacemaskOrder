package com.facemask.service.impl;

import com.facemask.domain.Orders;
import com.facemask.dto.OrderExecution;
import com.facemask.enums.OrderStateEnum;
import com.facemask.exception.NoNumberException;
import com.facemask.exception.RepeatOrderException;
import com.facemask.mapper.FacemaskMapper;
import com.facemask.mapper.OrdersMapper;
import com.facemask.service.OrdersService;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class OrdersServiceImpl implements OrdersService {
    private final Logger logger= LoggerFactory.getLogger(this.getClass());
    @Autowired
    OrdersMapper ordersMapper;
    @Autowired
    FacemaskMapper facemaskMapper;

    @Override
    public int insertOrders(Orders orders) {
        return ordersMapper.insertOrders(orders);
    }

    @Override
    public Orders quaryOrderBypId(String pId) {
        return ordersMapper.quaryOrderBypId(pId);
    }

    @Override
    public Orders quaryOrderByidNum(String idNum) {
        return ordersMapper.quaryOrderByidNum(idNum);
    }

    @Override
    public int deleteOrders(int orderId) {
        return ordersMapper.deleteOrders(orderId);
    }

    @Override
    public List<Orders> findAllOrders() {
        return ordersMapper.findAllOrders();
    }

    //判断预约条件是否满足，主要判断是否有库存和有没有重复预约
    @Override
    @Transactional
    public OrderExecution order(Orders orders) throws Exception{
        OrderExecution orderExecution = null;
        //查看库存是否大于10
        try {
            int inventory = facemaskMapper.findInventoryByFid(orders.getFmaskId());
            System.out.println(inventory);
            if (inventory < 10) {
//            orderExecution = new OrderExecution(orders.getFmaskId(), OrderStateEnum.NO_NUMBER.getState(), OrderStateEnum.NO_NUMBER.getStateInfo());
                throw new NoNumberException("没有库存");
            } else {
                int insert = ordersMapper.insertOrders(orders);
                if (insert <= 0) {
                    //重复预约
//                orderExecution = new OrderExecution(orders.getFmaskId(), OrderStateEnum.REPEAT_APPOINT.getState(), Ord erStateEnum.REPEAT_APPOINT.getStateInfo());
                    throw new RepeatOrderException("重复预约");
                } else {
                    orderExecution = new OrderExecution(orders.getFmaskId(), OrderStateEnum.SUCCESS.getState(), OrderStateEnum.SUCCESS.getStateInfo());
                }

            }
        } catch (NoNumberException e1) {
            e1.printStackTrace();
        } catch (RepeatOrderException e2) {
            e2.printStackTrace();
        }

        return orderExecution;
    }

}
