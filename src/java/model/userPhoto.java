package model;
public class userPhoto {
    private String userID;
    private String currentAvt;
    private String currentBgr;
    private String listBgr;
    private String listAvt;
    private String listPhotoId;

    public userPhoto(String userID, String currentAvt, String currentBgr, String listBgr, String listAvt, String listPhotoId) {
        this.userID = userID;
        this.currentAvt = currentAvt;
        this.currentBgr = currentBgr;
        this.listBgr = listBgr;
        this.listAvt = listAvt;
        this.listPhotoId = listPhotoId;
    }

    public String getCurrentBgr() {
        return currentBgr;
    }

    public void setCurrentBgr(String currentBgr) {
        this.currentBgr = currentBgr;
    }

    public String getListBgr() {
        return listBgr;
    }

    public void setListBgr(String listBgr) {
        this.listBgr = listBgr;
    }



    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCurrentAvt() {
        return currentAvt;
    }

    public void setCurrentAvt(String currentAvt) {
        this.currentAvt = currentAvt;
    }

    public String getListAvt() {
        return listAvt;
    }

    public void setListAvt(String listAvt) {
        this.listAvt = listAvt;
    }

    public String getListPhotoId() {
        return listPhotoId;
    }

    public void setListPhotoId(String listPhotoId) {
        this.listPhotoId = listPhotoId;
    }
    
    
}
