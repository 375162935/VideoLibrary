package cn.yyn.VideoLibrary.bean;

/**
 * @author 杨以诺
 * by 2020-05-19 17:16
 */
public class UserInfo {
    private int id;
    private String username;
    private String password;
    private String name;
    private int sex;
    private String trueName;

    public UserInfo() {
    }

    public UserInfo(int id, String username, String password, String name, int sex, String trueName) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.trueName = trueName;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", trueName='" + trueName + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }
}
