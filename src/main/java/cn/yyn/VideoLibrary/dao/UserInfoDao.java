package cn.yyn.VideoLibrary.dao;

import cn.yyn.VideoLibrary.bean.UserInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 杨以诺
 * by 2020-05-19 17:17
 */
@Repository
public interface UserInfoDao {
    UserInfo findUserByUserName(String username);

    void addUserInfo(UserInfo userInfo);
}
