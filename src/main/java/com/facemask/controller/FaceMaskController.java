package com.facemask.controller;

import com.facemask.domain.Facemask;
import com.facemask.service.FaceMaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/facemask")
public class FaceMaskController {

    //跳转到口罩入库界面
    @RequestMapping("/save")
    public ModelAndView save() {
        ModelAndView mv=new ModelAndView();
        List<Facemask> list = faceMaskService.findAll();
        mv.addObject("list", list);
        mv.setViewName("facemask/f_save");
        return mv;
    }

    //跳转到口罩信息修改页面
    @RequestMapping("/update")
    public ModelAndView update(Integer id){
        ModelAndView mv=new ModelAndView();
        Facemask facemask=faceMaskService.findByID(id);
        mv.addObject("obj",facemask);
        mv.setViewName("facemask/f_update");
        return mv;
    }

    //判断操作执行是否成功
    public String jumpTOPage(Integer res){
        //如果res==1(执行成功)，跳转到成功提示界面，重定向到首页
        //否则跳转到失败提示界面
        if (res == 1) {
            return "facemask/f_success";
        } else
            return "facemask/f_fail";
    }

    @Autowired
    public FaceMaskService faceMaskService;

    //口罩库存管理主界面
    @RequestMapping("/main")
    public ModelAndView f_main() {
        ModelAndView mv = new ModelAndView();
        List<Facemask> list = faceMaskService.findAll();
        int inventory = faceMaskService.findInventory();
        mv.setViewName("facemask/f_main");
        mv.addObject("list", list);
        mv.addObject("inventory", inventory);
        return mv;
    }

    //口罩入库操作
    @RequestMapping("/f_save")
    public String saveFaceMask(Facemask facemask){
        System.out.println(facemask);
        int res = faceMaskService.save_f(facemask);
        return jumpTOPage(res);
    }

    //更新口罩库存操作
    @RequestMapping("/f_inventory_update")
    public String updateFaceMask_Inventory(Integer id,Integer num){
        Facemask facemask=faceMaskService.findByID(id);
        facemask.setF_total(facemask.getF_total()+num);
        facemask.setF_inventory(facemask.getF_inventory()+num);
        System.out.println(facemask);
        int res=faceMaskService.update_f(facemask);
        return jumpTOPage(res);
    }

    //更新口罩信息操作
    @RequestMapping("/f_update")
    public String updateFacmask_Info(Facemask facemask){
        System.out.println(facemask);
        int res=faceMaskService.update_f(facemask);
        return jumpTOPage(res);
    }

    //删除口罩信息操作
    @RequestMapping("/f_delete")
    public String deleteFacemask(Integer id){
        System.out.println(id);
        int res = faceMaskService.delete_f(id);
        return jumpTOPage(res);
    }

}
