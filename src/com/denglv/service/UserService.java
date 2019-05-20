package com.denglv.service;

import com.denglv.pojo.User;

import java.util.List;


/**
 * Created by 江厚波 on 2019/5/2.
 */
public interface UserService {
    //校验用户登录
    User checkUserLoginService(String uname,String upwd);
//修改用户密码
    int usePwdService(String newpwd, int uid);
//获取所有的用户信息
    List<User> userShowService();
//用户注册
    int userRegistService(User u);
}
