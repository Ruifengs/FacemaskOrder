package com.facemask.mapper;

import com.facemask.domain.Orders;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 许锐锋
 */

@Repository
public interface OrdersMapper {

    //添加订单
    @Insert("insert into Orders (pId,fmaskId,fmaskNum,fmaskPrice,orderTime) values(#{pId},#{fmaskId},#{fmaskNum},#{fmaskPrice},#{orderTime})")
    int insertOrders(Orders orders);

    //返回所有订单
    @Select("select * from Orders")
    List<Orders> findAllOrders();

    //根据订单号查询订单
    @Select("select * from Orders where orderId=#{orderId};")
    Orders quaryOrderByorderId(Integer orderId);

    //根据pId查询订单
    @Select("select pId from Orders where pId=#{pId}")
    Orders quaryOrderBypId(Integer pId);

    //删除订单，口罩领取后删除订单
    @Delete("delete from Orders where orderId=#{orderId}")
    int deleteOrders(int orderId);

    //修改订单
    @Update("update orders set pId=#{pId},fmaskId=#{fmaskId},fmaskNum=#{fmaskNum},fmaskPrice=#{fmaskPrice},orderTime=#{orderTime} where orderId=#{orderId}")
    int updateOrder(Orders orders);
}

