package model;

public class datingAccount {

    private String userID,nickName, name, sex;
    private int age;
    private String location, image;

    public datingAccount() {
    }

    public datingAccount(String userID, String nickName, String name, String sex, int age, String location, String image) {
        this.userID = userID;
        this.nickName = nickName;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.location = location;
        this.image = image;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }


    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "datingAccount{" + "userID=" + userID + ", nickName=" + nickName + ", name=" + name + ", sex=" + sex + ", age=" + age + ", location=" + location + ", image=" + image + '}';
    }

}