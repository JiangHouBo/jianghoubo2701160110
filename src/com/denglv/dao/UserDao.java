package com.denglv.dao;

import com.denglv.pojo.User;

import java.util.List;

/**
 * Created by 江厚波 on 2019/5/2.
 */
public interface UserDao {
    User checkUserLoginDao(String uname, String upwd);
//根据用户ID修改用户密码的功能
    int usePwdService(String newpwd, int uid);
//获取所有的用户信息
    List<User> userShowDao();

//用户注册
    int usercheckRegistDao(User u);

}
