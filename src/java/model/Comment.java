/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import DAO.dao;
import connectDB.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author ADMIN
 */
public class Comment {
    private String commentID;
    private String postID;
    private String userID;
    private String detail;
    private String time;
    private int status;
    private String existed_time;

    public Comment() {
    }

    public Comment(String commentID, String postID, String userID, String detail, String time, int status, String existed_time) {
        this.commentID = commentID;
        this.postID = postID;
        this.userID = userID;
        this.detail = detail;
        this.time = time;
        this.status = status;
        this.existed_time = existed_time;
    }
    
    public String getCommentID() {
        return commentID;
    }

    public String getPostID() {
        return postID;
    }

    public String getUserID() {
        return userID;
    }

    public String getDetail() {
        return detail;
    }

    public String getTime() {
        return time;
    }

    public int getStatus() {
        return status;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public String getUserAvatar(){
        dao dao = new dao();
        return dao.getUserAvatar( getUserID() );
    }

    public String getExisted_time() {
        return existed_time;
    }

    public void setExisted_time(String existed_time) {
        this.existed_time = existed_time;
    }  
    
    
    public String getFullName(){
        dao dao = new dao();
        return dao.getFullNameByID( getUserID() );
    }
    
    public static void main(String[] args) {
        dao dao = new dao();

        //System.out.println( dao.getLastestComment().getExisted_time() );
    }
    
    public calTime getUnitTime(){
        dao d = new dao();
        return d.getUnitTime(getTime());
    }
}
