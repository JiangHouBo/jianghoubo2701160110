package com.denglv.service.com.denglv.service.impl;

import com.denglv.dao.UserDao;
import com.denglv.dao.impl.UserDaoImpl;
import com.denglv.pojo.User;
import com.denglv.service.UserService;
import org.apache.log4j.Logger;

import java.util.List;

/**
 * Created by 江厚波 on 2019/5/2.
 */
public class UserServiceImpl implements UserService {
    //声明日志对象
    Logger logger=Logger.getLogger(UserServiceImpl.class);
    //声明Dao层对象
    UserDao ud=new UserDaoImpl();
    @Override
    public User checkUserLoginService(String uname, String upwd) {
        //打印日志
        logger.debug(uname+"发起登录请求");
        User u=ud.checkUserLoginDao(uname, upwd);
        //判断
        if (u!=null){
            logger.debug(uname+"登录成功");
        }else {
            logger.debug(uname+"登录失败");
        }
        return u;
    }
//修改用户密码
    @Override
    public int usePwdService(String newpwd, int uid) {
        logger.debug(uid+":发起修改密码请求");
        int cd= ud.usePwdService(newpwd,uid);
        if (cd>0){
            logger.debug(uid+":修改密码成功");
        }else{
            logger.debug(uid+":修改密码失败");
        }
        return cd;
    }
//获取所有的用户信息
    @Override
    public List<User> userShowService() {
        List<User> l=ud.userShowDao();
        logger.debug("显示所有用户信息"+l);
        return l ;
    }
//用户注册
    @Override
    public int usercheckRegistService(User u) {
        return ud.usercheckRegistDao(u);
    }
}
