/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import DAO.dao;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Post {
    private String postID;
    private String userID;
    private String detail;
    private String imageFile;
    private String videoLink;
    private String status;
    private String posted_time;
    private String postType;

    @Override
    public String toString() {
        return "Post{" + "postID=" + postID + ", userID=" + userID + ", detail=" + detail + ", imageFile=" + imageFile + ", videoLink=" + videoLink + ", status=" + status + ", posted_time=" + posted_time + ", postType=" + postType + ", dao=" + dao + '}';
    }
    private dao dao;

    public Post() {
    }

    public Post(String postID, String userID, String detail, String imageFile, String videoLink, String status, String posted_time) {
        this.postID = postID;
        this.userID = userID;
        this.detail = detail;
        this.imageFile = imageFile;
        this.videoLink = videoLink;
        this.status = status;
        this.posted_time = posted_time;
        setPostType();
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

    public String getImageFile() {
        return imageFile;
    }

    public String getVideoLink() {
        return videoLink;
    }

    public String getStatus() {
        return status;
    }

    public String getPosted_time() {
        return posted_time;
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

    public void setImageFile(String imageFile) {
        this.imageFile = imageFile;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setPosted_time(String posted_time) {
        this.posted_time = posted_time;
    }
    
    public String getFullName(){
        dao dao = new dao();
        return dao.getFullNameByID(getUserID());
    }
    
    public String getUserAvatar(){
        dao dao = new dao();
        return dao.getUserAvatar( getUserID() );
    }
    
    public int getLikeTotal(){
        dao dao = new dao();
        return dao.getLikeTotal( getPostID() );
    }
    
    public int getCommentTotal(){
        dao dao = new dao();
        return dao.getCommentTotal( getPostID() );
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType() {
        dao dao = new dao();
        this.postType = dao.getPostType( postID );
    }
    
    public List<Attachment> getAllImageAttachment(){
        dao dao = new dao();
        return dao.getAllImageAttachment(postID);
    }
    
    public int sizeAlbum(){
        dao dao = new dao();
        return getAllImageAttachment().size();
    }
    
    public List<Comment> getAllCommentInpost(){
        dao dao = new dao();
        return dao.getAllCommentsByPost(postID);
    }
    
    public String getUserBackground(){
        dao dao = new dao();
        return dao.getUserBgr( getUserID() );
    }
    public static void main(String[] args) {
        dao dao = new dao();
        Post p = new Post();
        p.setUserID("332200003");
        System.out.println( p.getFullName() );
    }
    
    public boolean isLike(String uID){
        dao dao = new dao();
        return dao.getIsLikePost(uID,postID);
    }

    public dao getDao() {
        return dao;
    }
    
    public calTime getUnitTime(){
        dao dao = new dao();
        return dao.getUnitTime(getPosted_time());
    }

    public void setDao(dao dao) {
        this.dao = dao;
    }
    
    public List<String> listCare(){
        return new dao().getListCarePost(getPostID(),getUserID());
    }
}
