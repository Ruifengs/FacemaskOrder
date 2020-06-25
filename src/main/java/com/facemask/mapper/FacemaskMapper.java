package com.facemask.mapper;

import com.facemask.domain.Facemask;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
public interface FacemaskMapper {
    //添加口罩信息
    @Insert("insert into facemask(f_name,f_total,f_inventory,f_price) values (#{f_name},#{f_total},#{f_total},#{f_price}) ")
    int save_f(Facemask f);

    //更新口罩信息
    @Update("update facemask set f_name=#{f_name},f_total=#{f_total},f_inventory=#{f_inventory},f_received=#{f_received},f_price=#{f_price}  where f_ID=#{f_ID}")
    int update_f(Facemask f);

    //更新口罩状态
    @Update("update facemask set f_status=#{f_status} where f_ID=#{id}")
    int update_f_status(@Param("f_status") Integer sta, @Param("id") Integer id);

    //彻底删除口罩信息
    @Delete("delete from facemask where f_ID=#{id}")
    int delete_f(Integer id);

    //查询所有可用口罩信息
    @Select("select * from facemask ")
    List<Facemask> findAllStatus();

    //查询所有可预约的口罩的信息
    @Select("select * from facemask where f_status=1")
    List<Facemask> findAll();

    //根据ID查询口罩信息
    @Select("select * from facemask where f_id=#{id}")
    Facemask findByID(Integer id);

    //根据名称查找口罩
    @Select("select * from facemask where f_name=#{name}")
    Facemask findByName(String name);

    //查询口罩可预约库存
    @Select("select sum(f_inventory) from facemask where f_status=1")
    int findInventory();

    //根据id查某种口罩的库存
    @Select("select f_inventory from facemask where f_ID=#{id};")
    int findInventoryByFid(Integer id);

    //预约成功时减库存
    @Update("update facemask set f_inventory=f_inventory-10,f_received=f_received+10 where f_ID=#{f_ID}")
    int subtract_f(Integer f_ID);

    //根据口罩ID查看口罩类型名称
    @Select("select f_name from facemask where f_ID=#{f_ID}")
    String findF_Name(Integer f_ID);
}
