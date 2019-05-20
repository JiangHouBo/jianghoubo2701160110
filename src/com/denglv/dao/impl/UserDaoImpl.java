package com.denglv.dao.impl;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.denglv.dao.UserDao;
import com.denglv.pojo.User;
import static java.lang.Class.forName;

/**
 * Created by 江厚波 on 2019/5/2.
 */
public class UserDaoImpl implements UserDao {
    public User checkUserLoginDao(String uname,String upwd) {
        Connection con=null;
        PreparedStatement p=null;
        ResultSet rs=null;
        User u=null;
        String driverName = "com.mysql.jdbc.Driver";
        //数据库用户名
        String userName = "root";
        //密码
        String userPasswd = "root";
        //数据库名
        String dbName = "jhb";
        //表名
        String tableName = "uuser";
        //联结字符串
        String url = "jdbc:mysql://localhost:3306/jhb";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,userName, userPasswd);
            String sql="select *from uuser where uname=? and upwd=?";
            p=con.prepareStatement(sql);
            p.setString(1, uname);
            p.setString(2,upwd);
            rs=p.executeQuery();
            while(rs.next()) {
                u=new User();
                u.setUid(rs.getInt("uid"));
                u.setName(rs.getString("name"));
                u.setUname(rs.getString("uname"));
                u.setUpwd(rs.getString("upwd"));
                u.setUsex(rs.getString("usex"));
                u.setUage(rs.getInt("uage"));
                u.setUbirth(rs.getString("ubirth"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException e) {

                e.printStackTrace();
            }
            try {
                p.close();
            } catch (SQLException e) {

                e.printStackTrace();
            }
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //返回结果
        return u;
    }
//根据用户ID修改用户密码
    @Override
    public int usePwdService(String newpwd, int uid) {
        //声明jdbc对象
        Connection conn=null;
        PreparedStatement ps=null;
        //创建变量
        int cd=-1;
        try {
            //加载驱动
            Class.forName("com.mysql.jdbc.Driver");
            //获取连接
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jhb","root","root");
            //创建sql语句
            String sql="update uuser set upwd=? where uid=? ";
            //创建sql命令对象
            ps=conn.prepareStatement(sql);
            //给占位符赋值
            ps.setString(1,newpwd);
            ps.setInt(2,uid);
            //执行
            cd=ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        //关闭资源
        finally{
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //返回结果
        return cd;
    }
//获取所有的用户信息
    @Override
    public List<User> userShowDao() {
        Connection con=null;
        PreparedStatement p=null;
        ResultSet rs=null;
        List<User> l=null;
        String driverName = "com.mysql.jdbc.Driver";
        //数据库用户名
        String userName = "root";
        //密码
        String userPasswd = "root";
        //数据库名
        String dbName = "jhb";
        //表名
        String tableName = "uuser";
        //联结字符串
        String url = "jdbc:mysql://localhost:3306/jhb";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,userName, userPasswd);
            String sql="select * from uuser";
            p=con.prepareStatement(sql);
            rs=p.executeQuery();
            //给集合赋值
            l=new ArrayList<User>();
            while(rs.next()) {
               User u=new User();
                u.setUid(rs.getInt("uid"));
                u.setName(rs.getString("name"));
                u.setUname(rs.getString("uname"));
                u.setUpwd(rs.getString("upwd"));
                u.setUsex(rs.getString("usex"));
                u.setUage(rs.getInt("uage"));
                u.setUbirth(rs.getString("ubirth"));
                //将对象存储到集合中
                l.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                rs.close();
            } catch (SQLException e) {

                e.printStackTrace();
            }
            try {
                p.close();
            } catch (SQLException e) {

                e.printStackTrace();
            }
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //返回结果
        return l;
    }
    //用户注册
    @Override
    public int usercheckRegistDao(User u) {
        //声明jdbc对象
        Connection conn=null;
        PreparedStatement ps=null;
        //声明变量
        int cd=-1;
        try{
            //加载驱动
            Class.forName("com.mysql.jdbc.Driver");
            //获取连接
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jhb","root","root");
            //创建SQL命令
            String sql="insert into uuser values(?,?,?,?,?,?,?)";
            //创建SQL命令对象
            ps=conn.prepareStatement(sql);
            //给占位符赋值
            ps.setInt(1,u.getUid());
            ps.setString(2,u.getName());
            ps.setString(3,u.getUname());
            ps.setString(4,u.getUpwd());
            ps.setString(5,u.getUsex());
            ps.setInt(6,u.getUage());
            ps.setString(7,u.getUbirth());
            //执行
            cd=ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }//关闭资源
        finally{
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //返回结果
        return cd;
    }
}

