package com.facemask.mapper;

import com.facemask.domain.Facemask;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FacemaskMapper {
    //添加口罩信息
    @Insert("insert into facemask(f_name,f_total,f_inventory,f_price) values (#{f_name},#{f_total},#{f_total},#{f_price}) ")
    int save_f(Facemask f);
    //更新口罩信息
    @Update("update facemask set f_name=#{f_name},f_total=#{f_total},f_inventory=#{f_inventory},f_received=#{f_received},f_price=#{f_price}  where f_ID=#{f_ID}")
    int update_f(Facemask f);
    //删除口罩信息
    @Delete("delete from facemask where f_ID=#{id}")
    int delete_f(Integer id);
    //查询所有口罩信息
    @Select("select * from facemask")
    List<Facemask> findAll();
    //根据ID查询口罩信息
    @Select("select * from facemask where f_id=#{id}")
    Facemask findByID(Integer id);
    //根据名称查找口罩
    @Select("select * from facemask where f_name=#{name}")
    Facemask findByName(String name);
    //查询口罩总库存
    @Select("select sum(f_inventory) from facemask")
    int findInventory();
}
