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
public class datingProfile {

    private String userID, nickName, location, birthDate, sex, child, gender, education, job, hobbie, detail, image1, image2, image3, image4, image5, active;

    public datingProfile() {
    }

    public datingProfile(String userID, String nickName, String location, String birthDate, String sex, String child, String gender, String education, String job, String hobbie, String detail, String image1, String image2, String image3, String image4, String image5, String active) {
        this.userID = userID;
        this.nickName = nickName;
        this.location = location;
        this.birthDate = birthDate;
        this.sex = sex;
        this.child = child;
        this.gender = gender;
        this.education = education;
        this.job = job;
        this.hobbie = hobbie;
        this.detail = detail;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.image5 = image5;
        this.active = active;
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

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getChild() {
        return child;
    }

    public void setChild(String child) {
        this.child = child;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    @Override
    public String toString() {
        return "datingProfile{" + "userID=" + userID + ", nickName=" + nickName + ", location=" + location + ", birthDate=" + birthDate + ", sex=" + sex + ", child=" + child + ", gender=" + gender + ", education=" + education + ", job=" + job + ", hobbie=" + hobbie + ", detail=" + detail + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4 + ", image5=" + image5 + ", active=" + active + '}';
    }
}
