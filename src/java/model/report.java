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
public class report {

    private String reportID, postID, accuser, accused, accuserName, accusedName, reason, message, link, status, date, avatar;

    public report() {
    }

    public report(String reportID, String postID, String accuser, String accused, String accuserName, String accusedName, String reason, String message, String link, String status, String date, String avatar) {
        this.reportID = reportID;
        this.postID = postID;
        this.accuser = accuser;
        this.accused = accused;
        this.accuserName = accuserName;
        this.accusedName = accusedName;
        this.reason = reason;
        this.message = message;
        this.link = link;
        this.status = status;
        this.date = date;
        this.avatar = avatar;
    }

    public String getAccuserName() {
        return accuserName;
    }

    public void setAccuserName(String accuserName) {
        this.accuserName = accuserName;
    }

    public String getAccusedName() {
        return accusedName;
    }

    public void setAccusedName(String accusedName) {
        this.accusedName = accusedName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getReportID() {
        return reportID;
    }

    public void setReportID(String reportID) {
        this.reportID = reportID;
    }

    public String getPostID() {
        return postID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public String getAccuser() {
        return accuser;
    }

    public void setAccuser(String accuser) {
        this.accuser = accuser;
    }

    public String getAccused() {
        return accused;
    }

    public void setAccused(String accused) {
        this.accused = accused;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "report{" + "reportID=" + reportID + ", postID=" + postID + ", accuser=" + accuser + ", accused=" + accused + ", accuserName=" + accuserName + ", accusedName=" + accusedName + ", reason=" + reason + ", message=" + message + ", link=" + link + ", status=" + status + ", date=" + date + ", avatar=" + avatar + '}';
    }

}
