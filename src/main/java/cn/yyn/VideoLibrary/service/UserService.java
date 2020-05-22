package cn.yyn.VideoLibrary.service;

import cn.yyn.VideoLibrary.bean.UserInfo;


/**
 * @author 杨以诺
 * by 2020-05-19 17:19
 */
public interface UserService {

    UserInfo findUserByUserName(String username);

    void addUserInfo(UserInfo userInfo);

}
