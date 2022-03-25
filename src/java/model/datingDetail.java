/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author PC
 */
public class datingDetail {

    private String userID, name, nickName, birthDate;
    private int age;
    private String location, sex, child, gender, education, job, hobbie, detail, avatar, image1, image2, image3, image4, image5, active;

    public datingDetail() {
    }

    public datingDetail(String userID, String name, String nickName, String birthDate, int age, String location, String sex, String child, String gender, String education, String job, String hobbie, String detail, String avatar, String image1, String image2, String image3, String image4, String image5, String active) {
        this.userID = userID;
        this.name = name;
        this.nickName = nickName;
        this.birthDate = birthDate;
        this.age = age;
        this.location = location;
        this.sex = sex;
        this.child = child;
        this.gender = gender;
        this.education = education;
        this.job = job;
        this.hobbie = hobbie;
        this.detail = detail;
        this.avatar = avatar;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.image5 = image5;
        this.active = active;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getImage5() {
        return image5;
    }

    public void setImage5(String image5) {
        this.image5 = image5;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
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

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
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

    public String getChild() {
        return child;
    }

    public void setChild(String child) {
        this.child = child;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getHobbie() {
        return hobbie;
    }

    public void setHobbie(String hobbie) {
        this.hobbie = hobbie;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "datingDetail{" + "userID=" + userID + ", name=" + name + ", nickName=" + nickName + ", birthDate=" + birthDate + ", age=" + age + ", location=" + location + ", sex=" + sex + ", child=" + child + ", gender=" + gender + ", education=" + education + ", job=" + job + ", hobbie=" + hobbie + ", detail=" + detail + ", avatar=" + avatar + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4 + ", image5=" + image5 + ", active=" + active + '}';
    }

}
