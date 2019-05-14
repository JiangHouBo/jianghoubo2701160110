package com.denglv.pojo;

/**
 * Created by 江厚波 on 2019/5/2.
 */
public class User {
    private int uid;
    private String name;
    private String uname;
    private String upwd;
    private String usex;
    private int uage;
    private String ubirth;
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public int getUage() {
        return uage;
    }

    public void setUage(int uage) {
        this.uage = uage;
    }

    public String getUbirth() {
        return ubirth;
    }

    public void setUbirth(String ubirth) {
        this.ubirth = ubirth;
    }
    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", name='" + name + '\'' +
                ", uname='" + uname + '\'' +
                ", upwd='" + upwd + '\'' +
                ", usex='" + usex + '\'' +
                ", uage=" + uage +
                ", ubirth='" + ubirth + '\'' +
                '}';
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (uid != user.uid) return false;
        if (uage != user.uage) return false;
        if (name != null ? !name.equals(user.name) : user.name != null) return false;
        if (uname != null ? !uname.equals(user.uname) : user.uname != null) return false;
        if (upwd != null ? !upwd.equals(user.upwd) : user.upwd != null) return false;
        if (usex != null ? !usex.equals(user.usex) : user.usex != null) return false;
        return ubirth != null ? ubirth.equals(user.ubirth) : user.ubirth == null;
    }

    @Override
    public int hashCode() {
        int result = uid;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (uname != null ? uname.hashCode() : 0);
        result = 31 * result + (upwd != null ? upwd.hashCode() : 0);
        result = 31 * result + (usex != null ? usex.hashCode() : 0);
        result = 31 * result + uage;
        result = 31 * result + (ubirth != null ? ubirth.hashCode() : 0);
        return result;
    }

    public User() {
        super();
    }

    public User(int uid, String name, String uname, String upwd, String usex, int uage, String ubirth) {
        super();
        this.uid = uid;
        this.name = name;
        this.uname = uname;
        this.upwd = upwd;
        this.usex = usex;
        this.uage = uage;
        this.ubirth = ubirth;
    }
}
