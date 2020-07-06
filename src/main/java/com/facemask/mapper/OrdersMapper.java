package com.facemask.mapper;

import com.facemask.domain.Facemask;
import com.facemask.domain.Orders;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author 许锐锋
 */

@Repository
public interface OrdersMapper {

    //添加订单
    @Insert("insert into Orders (pId,fmaskId,fmaskNum,fmaskPrice,orderTime,orderStatus,getFacemaskTime) values(#{pId},#{fmaskId},#{fmaskNum},#{fmaskPrice},#{orderTime},#{orderStatus},#{getFacemaskTime})")
    int insertOrders(Orders orders);

    //返回所有订单
    @Select("select * from Orders")
    List<Orders> findAllOrders();

    //返回所有未领取的订单
    @Select("select * from Orders where orderStatus = 0")
    List<Orders> findAll_unaccalimed();

    //根据订单号查询订单
    @Select("select * from Orders where orderId=#{orderId};")
    Orders quaryOrderByorderId(Integer orderId);

    //根据pId查询订单
    @Select("select * from Orders where pId=#{pId}")
    List<Orders> quaryOrderBypId(Integer pId);

    //删除订单，口罩领取后删除订单
    @Delete("delete from Orders where orderId=#{orderId}")
    int deleteOrders(int orderId);

    //修改订单
    @Update("update orders set pId=#{pId},fmaskId=#{fmaskId},fmaskNum=#{fmaskNum},fmaskPrice=#{fmaskPrice},orderTime=#{orderTime},orderStatus=#{orderStatus},getFacemaskTime=#{getFacemaskTime} where orderId=#{orderId}")
    int updateOrder(Orders orders);

    //联合查询订单表与口罩表
    @Select("select * from Orders o,facemask f where o.fmaskId=f.f_ID")
    List<Map<Orders, Facemask>> find_Details();

    //联合查询订单表与口罩表，状态为未领取
    @Select("select * from Orders o,facemask f where o.fmaskId=f.f_ID and orderStatus=0")
    List<Map<Orders, Facemask>> find_Details_un();

    //模糊查询 pId 口罩名称,状态为未领取
    @Select("select * from Orders o,facemask f where o.fmaskId=f.f_ID and orderStatus=0 and (f_name like '%${f_name}%' or pId=#{f_name})")
    List<Map<Orders, Facemask>> search_Details_un(String f_name);
}

