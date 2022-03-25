/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Attachment {
    private String attachmentID;
    private String postID;
    private String attachmentURL;

    public Attachment() {
    }

    public Attachment(String attachmentID, String postID, String attachmentURL) {
        this.attachmentID = attachmentID;
        this.postID = postID;
        this.attachmentURL = attachmentURL;
    }

    public String getAttachmentID() {
        return attachmentID;
    }

    public String getPostID() {
        return postID;
    }

    public String getAttachmentURL() {
        return attachmentURL;
    }

    public void setAttachmentID(String attachmentID) {
        this.attachmentID = attachmentID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public void setAttachmentURL(String attachmentURL) {
        this.attachmentURL = attachmentURL;
    }
    
    
}
