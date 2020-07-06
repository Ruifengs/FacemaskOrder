package com.facemask.interceptor;

import com.facemask.domain.Person;
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
        if (request.getRequestURI().indexOf("login") >= 0) {
            return true;
        }
        // 如果是登录验证，放行
        if (request.getRequestURI().indexOf("person/personLoginSubmit") >= 0) {
            return true;
        }
        // 如果是注册界面，放行
        if (request.getRequestURI().indexOf("person/registered") >= 0) {
            return true;
        }
        // 如果是注册验证，放行
        if (request.getRequestURI().indexOf("person/personRegistered") >= 0) {
            return true;
        }

        HttpSession session = request.getSession();
        Person person = (Person) session.getAttribute("person");
        //如果已经登录，也放行
        if (person != null) {
            //防止普通用户跳转到管理员界面
            if (person.getPermissions() == 1) {
                //口罩库存、用户管理、订单管理界面
                if (request.getRequestURI().indexOf("facemask") >= 0 || request.getRequestURI().indexOf("person/personManage") >= 0 || request.getRequestURI().indexOf("order/ordersManage") >= 0) {
                    request.getRequestDispatcher("/person/main").forward(request, response);
                    return false;
                }
                return true;
            }
            //防止管理员跳转到普通用户界面
            if (person.getPermissions() == 0) {
                //口罩预约界面和口罩预约细则界面
                if (request.getRequestURI().indexOf("order/main") >= 0 || request.getRequestURI().indexOf("order/rules") >= 0) {
                    request.getRequestDispatcher("/person/root_main").forward(request, response);
                    return false;
                }
                return true;
            }
        }

        request.getRequestDispatcher("/").forward(request, response);
        return false;
    }
}
