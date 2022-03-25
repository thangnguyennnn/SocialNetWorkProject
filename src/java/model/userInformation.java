package model;

import DAO.dao;
import java.util.Date;

public class userInformation {
    private String userId;
    private String avatar;
    private String background;
    private String firstName;
    private String middleName;
    private String lastName;
    private String birthdate;
    private String sex;
    private String phone;
    private String email;
    private String address;
    private String education;
    private String job;
    private String hobbie;
    private String orther;
    private String imgfile;
    private String fbLink;
    private String igLink;
    private String emailLink;
    private String tweetLink;
    private String creatAt;

    public userInformation(String userId, String avatar, String background, String lastName, String middleName, String firstName, String birthdate, String sex, String phone, String email, String address, String education, String job, String hobbie, String orther, String imgfile, String fbLink, String igLink, String emailLink, String tweetLink, String creatAt) {
        this.userId = userId;
        this.avatar = avatar;
        this.background = background;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.birthdate = birthdate;
        this.sex = sex;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.education = education;
        this.job = job;
        this.hobbie = hobbie;
        this.orther = orther;
        this.imgfile = imgfile;
        this.fbLink = fbLink;
        this.igLink = igLink;
        this.emailLink = emailLink;
        this.tweetLink = tweetLink;
        this.creatAt = creatAt;
    }

    public String getCreatAt() {
        return creatAt;
    }

    public void setCreatAt(String creatAt) {
        this.creatAt = creatAt;
    }

    

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public String getOrther() {
        return orther;
    }

    public void setOrther(String orther) {
        this.orther = orther;
    }

    public String getImgfile() {
        return imgfile;
    }

    public void setImgfile(String imgfile) {
        this.imgfile = imgfile;
    }

    public String getFbLink() {
        return fbLink;
    }

    public void setFbLink(String fbLink) {
        this.fbLink = fbLink;
    }

    public String getIgLink() {
        return igLink;
    }

    public void setIgLink(String igLink) {
        this.igLink = igLink;
    }

    public String getEmailLink() {
        return emailLink;
    }

    public void setEmailLink(String emailLink) {
        this.emailLink = emailLink;
    }

    public String getTweetLink() {
        return tweetLink;
    }

    public void setTweetLink(String tweetLink) {
        this.tweetLink = tweetLink;
    }

    @Override
    public String toString() {
        return "userInformation{" + "userId=" + userId + ", avatar=" + avatar + ", background=" + background + ", firstName=" + firstName + ", middleName=" + middleName + ", lastName=" + lastName + ", birthdate=" + birthdate + ", sex=" + sex + ", phone=" + phone + ", email=" + email + ", address=" + address + ", education=" + education + ", job=" + job + ", hobbie=" + hobbie + ", orther=" + orther + ", imgfile=" + imgfile + ", fbLink=" + fbLink + ", igLink=" + igLink + ", emailLink=" + emailLink + ", tweetLink=" + tweetLink + ", creatAt=" + creatAt.trim() + '}';
    }
    
    public String getFullName(){
        return new dao().getFullNameByID(getUserId());
    }
    
    public String dateBirth(){
        return getBirthdate().split("-")[2];
    }
    
    public String monthBirth(){
        return getBirthdate().split("-")[1];
    }
    
    public String getAge(){
        Date d = new Date();
        int year = d.getYear() + 1900;
        int yearO = Integer.parseInt(getBirthdate().split("-")[0]);
        return year - yearO + "" ;
    }
    
}
