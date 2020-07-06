package com.facemask.service.impl;

import com.facemask.domain.Orders;
import com.facemask.dto.OrderExecution;
import com.facemask.enums.OrderStateEnum;
import com.facemask.exception.NoNumberException;
import com.facemask.exception.OrderException;
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
    public List<Orders> quaryOrderBypId(Integer pId) {
        return ordersMapper.quaryOrderBypId(pId);
    }

    @Override
    public Orders quaryOrderByorderId(Integer orderId) {
        return ordersMapper.quaryOrderByorderId(orderId);
    }

    @Override
    public int deleteOrders(int orderId) {
        return ordersMapper.deleteOrders(orderId);
    }

    @Override
    public List<Orders> findAllOrders() {
        return ordersMapper.findAllOrders();
    }

    @Override
    public int updateOrder(Orders orders) {
        return ordersMapper.updateOrder(orders);
    }


    //判断预约条件是否满足，主要判断是否有库存和有没有重复预约
    @Override
    @Transactional
    public OrderExecution order(Orders orders) throws OrderException {
        //查看库存是否大于10
        System.out.println("OrderExecution："+orders);
        try {
            int inventory = facemaskMapper.findInventoryByFid(orders.getFmaskId());
            if (inventory < 10) {
                throw new NoNumberException("没有库存");
            } else {
                List<Orders> orders1 = ordersMapper.quaryOrderBypId(orders.getpId());
                int flag=1; //判断已有订单是否领取，都领取为1,则可以继续预约；没领取为0
                for(Orders orders2 : orders1){
                    if (orders2.getOrderStatus() == 0) {
                        flag = 0;
                        break;
                    }
                }
                if(orders1==null || flag==1){
                    int insert = ordersMapper.insertOrders(orders);
                    int subtract = facemaskMapper.subtract_f(orders.getFmaskId());
                    String facemaskName = facemaskMapper.findF_Name(orders.getFmaskId());
                    return new OrderExecution(facemaskName,OrderStateEnum.SUCCESS);
                }else {
                    throw new RepeatOrderException("重复预约");
                }

            }
        } catch (NoNumberException e1) {
            throw e1;
        } catch (RepeatOrderException e2) {
            throw e2;
        }catch (Exception e){
            throw new OrderException("appoint inner error:" + e.getMessage());
        }
    }

}
