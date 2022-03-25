package model;
public class Conversation {
    private String converID;
    private String senderName;
    private String senderID;
    private String newMessage;
    private String readed;
    private String lastTime;
    private String type;
    private String isActive;
    private calTime countTime;

    public Conversation(String converID, String senderName, String senderID, String newMessage, String readed, String lastTime, String type, String isActive,calTime countTime) {
        this.converID = converID;
        this.senderName = senderName;
        this.senderID = senderID;
        this.newMessage = newMessage;
        this.readed = readed;
        this.lastTime = lastTime;
        this.type = type;
        this.isActive = isActive;
        this.countTime = countTime;
    }

    public calTime getCountTime() {
        return countTime;
    }

    public void setCountTime(calTime countTime) {
        this.countTime = countTime;
    }
    

    public String getConverID() {
        return converID;
    }

    public void setConverID(String converID) {
        this.converID = converID;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
    }

    public String getSenderID() {
        return senderID;
    }

    public void setSenderID(String senderID) {
        this.senderID = senderID;
    }

    public String getNewMessage() {
        return newMessage;
    }

    public void setNewMessage(String newMessage) {
        this.newMessage = newMessage;
    }

    public String getReaded() {
        return readed;
    }

    public void setReaded(String readed) {
        this.readed = readed;
    }

    public String getLastTime() {
        return lastTime;
    }

    public void setLastTime(String lastTime) {
        this.lastTime = lastTime;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIsActive() {
        return isActive;
    }

    public void setIsActive(String isActive) {
        this.isActive = isActive;
    }

    @Override
    public String toString() {
        return "Conversation{" + "converID=" + converID + ", senderName=" + senderName + ", senderID=" + senderID + ", newMessage=" + newMessage + ", readed=" + readed + ", lastTime=" + lastTime + ", type=" + type + ", isActive=" + isActive + ", countTime=" + countTime + '}';
    }

  

   
    
}
