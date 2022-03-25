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
public class notification {

    private String notiID, receiverID, delivererID, message, link, icon, status, date, name, avatar;

    public notification() {
    }

    public notification(String notiID, String receiverID, String delivererID, String message, String link, String icon, String status, String date, String name, String avatar) {
        this.notiID = notiID;
        this.receiverID = receiverID;
        this.delivererID = delivererID;
        this.message = message;
        this.link = link;
        this.icon = icon;
        this.status = status;
        this.date = date;
        this.name = name;
        this.avatar = avatar;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getReceiverID() {
        return receiverID;
    }

    public void setReceiverID(String receiverID) {
        this.receiverID = receiverID;
    }

    public String getDelivererID() {
        return delivererID;
    }

    public void setDelivererID(String delivererID) {
        this.delivererID = delivererID;
    }

    public String getNotiID() {
        return notiID;
    }

    public void setNotiID(String notiID) {
        this.notiID = notiID;
    }

    public String getdelivererID() {
        return delivererID;
    }

    public void setdelivererID(String delivererID) {
        this.delivererID = delivererID;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "notification{" + "notiID=" + notiID + ", receiverID=" + receiverID + ", delivererID=" + delivererID + ", message=" + message + ", link=" + link + ", icon=" + icon + ", status=" + status + ", date=" + date + ", name=" + name + ", avatar=" + avatar + '}';
    }

}
