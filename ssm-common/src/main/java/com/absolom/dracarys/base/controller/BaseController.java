package com.absolom.dracarys.base.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.ParameterizedType;

/**
 * @ClassName: BaseController.java
 * @Description: 基础控制器
 * @author: zhepan@outlook.com
 * @date: 2017/9/2 16:37
 */
public class BaseController<T> {

    private Class<T> cls;

    private HttpServletRequest request;

    private HttpServletResponse response;

    private HttpSession session;

    private int page = 1;

    private int rows = 10;

    private String currentUser;

    protected Logger logger;

    @SuppressWarnings("unchecked")
    public BaseController() {
        ParameterizedType type = (ParameterizedType)getClass().getGenericSuperclass();
        cls = (Class<T>)type.getActualTypeArguments()[0];
        logger = LoggerFactory.getLogger(cls);
    }

    @ModelAttribute
    public void setRequestAndResponse(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        this.session = request.getSession();
        String rows = request.getParameter("rows");
        String page = request.getParameter("page");
        String currentUser = request.getParameter("currentuser");
        if(null != rows && null != page){
            this.rows = Integer.valueOf(rows);
            this.page = Integer.valueOf(page);
        }else{
            this.rows = 10;
            this.page = 1;
        }
        if(null != currentUser){
            this.currentUser = currentUser;
        }
    }

    protected String getRealPath() {
        return getSession().getServletContext().getRealPath("");
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public HttpServletResponse getResponse() {
        return response;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    public HttpSession getSession() {
        return session;
    }

    public void setSession(HttpSession session) {
        this.session = session;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public String getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(String currentUser) {
        this.currentUser = currentUser;
    }
}
