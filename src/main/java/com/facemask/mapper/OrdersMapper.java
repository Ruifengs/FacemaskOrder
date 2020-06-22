package com.facemask.mapper;

import com.facemask.domain.Orders;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 许锐锋
 */

@Repository
public interface OrdersMapper {

    //添加订单
    @Insert("insert into Orders (pId,pName,idNum,phoneNum,fmaskId,fmaskNum,fmaskPrice,orderTime) values(#{pId},#{pName},#{idNum},#{phoneNum},#{fmaskId},#{fmaskNum},#{fmaskPrice},#{orderTime})")
    int insertOrders(Orders orders);

    //返回所有订单
    @Select("select * from Orders")
    List<Orders> findAllOrders();

    //根据预约人ID查询订单,每次只有一个订单，返回Orders
    @Select("select * from Orders where pId=#{pId};")
    Orders quaryOrderBypId(String pId);

    //根据身份证号查询订单
    @Select("select * from Orders where idNum=#{idNum};")
    Orders quaryOrderByidNum(String idNum);

    //删除订单，口罩领取后删除订单
    @Delete("delete from Orders where orderId=#{orderId}")
    int deleteOrders(int orderId);

}

