package cn.yyn.VideoLibrary.service.impl;

import cn.yyn.VideoLibrary.bean.UserInfo;
import cn.yyn.VideoLibrary.dao.UserInfoDao;
import cn.yyn.VideoLibrary.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 杨以诺
 * by 2020-05-19 17:20
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserInfoDao userInfoDao;

    @Override
    public UserInfo findUserByUserName(String username) {
        return userInfoDao.findUserByUserName(username);
    }

    @Override
    public int addUserInfo(UserInfo userInfo) {
        return userInfoDao.addUserInfo(userInfo);
    }
}
