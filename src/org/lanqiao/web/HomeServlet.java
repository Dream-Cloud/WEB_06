package org.lanqiao.web;

import org.lanqiao.pojo.School;
import org.lanqiao.pojo.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet("/home.do")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("username","admin");
        req.getSession().setAttribute("password","123456");
        List<String> list = new ArrayList<>();
        list.add("A");
        list.add("BB");
        list.add("CCC");
        req.setAttribute("list",list);

        Student stu = new Student("张三",20,new School("中北大学","山西太原"));
        req.setAttribute("stu",stu);

        Map<String,String> map = new HashMap<>();
        map.put("A","aaa");
        map.put("B","bbb");
        map.put("C","ccc");
        req.setAttribute("map",map);

        req.setAttribute("a",10);
        req.setAttribute("b",20);


        req.setAttribute("para",null);
        req.setCharacterEncoding("utf-8");

        Cookie cookie = new Cookie("lanqiao","lanqiao");
        resp.addCookie(cookie);

        req.setAttribute("date",new Date());

//        req.getRequestDispatcher("/WEB-INF/home.jsp?name=张三").forward(req,resp);
        req.getRequestDispatcher("/WEB-INF/success.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
