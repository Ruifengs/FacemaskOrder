package com.facemask.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器：拦截用户请求，判断用户是否登录,登录则放行，否则拦截，跳转到登录界面
 */
public class LoginHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 如果是登录页面，就放行
        if(request.getRequestURI().indexOf("login")>=0){
            return true;
        }
        if (request.getRequestURI().indexOf("person")>=0){
            return true;
        }
        HttpSession session = request.getSession();
        //如果已经登录，也放行
        if(session.getAttribute("person")!=null){
            return true;
        }
        request.getRequestDispatcher("login.jsp").forward(request,response);
        return false;
    }
}
