package model;
public class messages {
    private String conversationID;
    private String senderID;
    private String content;
    private String time;
    private int sttMess;
    private int type;
    private int readed1; 
    private int readed2; 

    public messages(String conversationID, String senderID, String content, String time, int sttMess, int type, int readed1, int readed2) {
        this.conversationID = conversationID;
        this.senderID = senderID;
        this.content = content;
        this.time = time;
        this.sttMess = sttMess;
        this.type = type;
        this.readed1 = readed1;
        this.readed2 = readed2;
    }

    @Override
    public String toString() {
        return "messages{" + "conversationID=" + conversationID + ", senderID=" + senderID + ", content=" + content + ", time=" + time + ", sttMess=" + sttMess + ", type=" + type + ", readed1=" + readed1 + ", readed2=" + readed2 + '}';
    }

    
    public String getConversationID() {
        return conversationID;
    }

    public void setConversationID(String conversationID) {
        this.conversationID = conversationID;
    }

    public String getSenderID() {
        return senderID;
    }

    public void setSenderID(String senderID) {
        this.senderID = senderID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getSttMess() {
        return sttMess;
    }

    public void setSttMess(int sttMess) {
        this.sttMess = sttMess;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getReaded1() {
        return readed1;
    }

    public void setReaded1(int readed1) {
        this.readed1 = readed1;
    }

    public int getReaded2() {
        return readed2;
    }

    public void setReaded2(int readed2) {
        this.readed2 = readed2;
    }

    
    
    
    
}
