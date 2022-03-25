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
public class datingMatch {

    private String datingID, userID, targetID, isLike;

    public datingMatch() {
    }

    public datingMatch(String datingID, String userID, String targetID, String isLike) {
        this.datingID = datingID;
        this.userID = userID;
        this.targetID = targetID;
        this.isLike = isLike;
    }

    public String getDatingID() {
        return datingID;
    }

    public void setDatingID(String datingID) {
        this.datingID = datingID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getTargetID() {
        return targetID;
    }

    public void setTargetID(String targetID) {
        this.targetID = targetID;
    }

    public String getIsLike() {
        return isLike;
    }

    public void setIsLike(String isLike) {
        this.isLike = isLike;
    }

    @Override
    public String toString() {
        return "datingMatch{" + "datingID=" + datingID + ", userID=" + userID + ", targetID=" + targetID + ", isLike=" + isLike + '}';
    }

}
