package com.facemask.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * 自定义全局异常处理器
 * @author 许锐锋
 */
public class GlobalExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
                                         Exception exception) {
        // 判断异常的种类
        String msg = null;
        if (exception instanceof NoNumberException) {
            // 如果是自定义异常，就从异常里面取出错误消息
            NoNumberException noNumExp = (NoNumberException) exception;
            msg = noNumExp.getMessage();
        } else if (exception instanceof RepeatOrderException){
                RepeatOrderException repeatOrderException = (RepeatOrderException) exception;
                msg = repeatOrderException.getMessage();
        }else{
            // 如果是运行时异常，则取错误的堆栈信息
            exception.printStackTrace(); // 向控制台上打印堆栈信息

            StringWriter s = new StringWriter();
            PrintWriter printWriter = new PrintWriter(s);
            exception.printStackTrace(printWriter);
            msg = s.toString();
        }


        // 返回一个友好的错误页面，并显示错误消息
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("msg", msg);
        modelAndView.setViewName("error");
        return modelAndView;
    }

}