package com.denglv.servlet;

import com.denglv.pojo.User;
import com.denglv.service.UserService;
import com.denglv.service.com.denglv.service.impl.UserServiceImpl;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by 江厚波 on 2019/5/2.
 */
@WebServlet(name = "UserServlet")
public class UserServlet extends HttpServlet {
    //声明日志对象
    Logger logger=Logger.getLogger(UserServlet.class);
    //获取services层对象
    UserService us=new UserServiceImpl();
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String oper=req.getParameter("oper");
        if("login".equals(oper)){
            //调用登录处理方法
            checkUserLogin(req,resp);
        }else if("uout".equals(oper)){
             //调用退出功能
            userUout(req,resp);
        }else if("pwd".equals(oper)) {
            //密码修改
            usePwd(req,resp);
        }else if("show".equals(oper)) {
            //用户所有信息查询
            userShow(req,resp);
        }else if("regist".equals(oper)) {
            //调用注册
            userRegist(req,resp);
        }else {
            logger.debug("找不到:"+oper);
        }
    }
  //用户注册
    private void userRegist(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取请求信息
        int uid=req.getParameter("uid")!=""?Integer.parseInt(req.getParameter("uid")):0;
        String name=req.getParameter("name");
        String uname=req.getParameter("uname");
        String upwd=req.getParameter("upwd");
        String usex=req.getParameter("usex");
        int uage=req.getParameter("uage")!=""?Integer.parseInt(req.getParameter("uage")):0;
        String ubirth=req.getParameter("ubirth");
        System.out.println(uid+":"+name+":"+uname+":"+upwd+":"+usex+":"+uage+":"+ubirth);
        //封装
        User u=new User(uid,name,uname,upwd,usex,uage,ubirth);
        //处理请求信息
           //调用业务层处理用户信息
        int cd=us.userRegistService(u);
        System.out.println(cd);
        //响应处理结果
        if(cd>0){
            //获取session
            HttpSession hs=req.getSession();
            hs.setAttribute("reg","true");
            //重定向
            resp.sendRedirect("login.jsp");
        }
    }
    //显示所有用户信息
    private void userShow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //调用service
        List<User> l=us.userShowService();
        //判断
        if(l!=null){
            //将获得的数据存储到request对象中
            req.setAttribute("l",l);
            //请求转发
            req.getRequestDispatcher("/cmd/yonghu.jsp").forward(req,resp);
        }
    }

    //用户修改密码
    private void usePwd(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取新密码数据
           String newpwd=req.getParameter("newupwd");
           //从session中获取用户信息
           User u=(User)req.getSession().getAttribute("user");
           int uid=u.getUid();
        //处理请求
              //调用service层处理信息
            int cd=us.usePwdService(newpwd,uid);
            if(cd>0){
                //获取session对象
                HttpSession h=req.getSession();
                h.setAttribute("flagpwd","true");
                //重定向到登录页面
                resp.sendRedirect("/login.jsp");
            }
    }
    //用户退出
    private void userUout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //获取session对象
        HttpSession h=req.getSession();
        //强制销毁session
        h.invalidate();
        //重定向到登录页面
        resp.sendRedirect("/login.jsp");
    }
    private void checkUserLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        String uname=req.getParameter("uname");
        String upwd=req.getParameter("upwd");

        //校验
        User u=us.checkUserLoginService(uname, upwd);
      /* try {
           resp.getOutputStream().println(uname+" "+upwd);
       }catch (IOException e){

       }*/
      if(u!=null){
          //获取session对象
          HttpSession h=req.getSession();
          //将用户数据存储到session中
          h.setAttribute("user",u);
          //重定向
          resp.sendRedirect("/main/main.jsp");
          return;
      }else{
          //添加标识符到request中
          req.setAttribute("flag","false");
          //请求转发
          req.getRequestDispatcher("login.jsp").forward(req,resp);
          return;
      }
    }
}

