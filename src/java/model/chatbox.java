package model;

public class chatbox {
    private String chatbox_id;
    private String user_1_id;
    private String user_2_id;
    private String mediaFile;
    private String sttU1;
    private String sttU2;

    public chatbox(String chatbox_id, String user_1_id, String user_2_id, String mediaFile, String sttU1, String sttU2) {
        this.chatbox_id = chatbox_id;
        this.user_1_id = user_1_id;
        this.user_2_id = user_2_id;
        this.mediaFile = mediaFile;
        this.sttU1 = sttU1;
        this.sttU2 = sttU2;
    }

    
    public String getMediaFile() {
        return mediaFile;
    }

    public void setMediaFile(String mediaFile) {
        this.mediaFile = mediaFile;
    }

    public String getSttU1() {
        return sttU1;
    }

    public void setSttU1(String sttU1) {
        this.sttU1 = sttU1;
    }

    public String getSttU2() {
        return sttU2;
    }

    public void setSttU2(String sttU2) {
        this.sttU2 = sttU2;
    }

  

    public String getChatbox_id() {
        return chatbox_id;
    }

    public void setChatbox_id(String chatbox_id) {
        this.chatbox_id = chatbox_id;
    }

    public String getUser_1_id() {
        return user_1_id;
    }

    public void setUser_1_id(String user_1_id) {
        this.user_1_id = user_1_id;
    }

    public String getUser_2_id() {
        return user_2_id;
    }

    public void setUser_2_id(String user_2_id) {
        this.user_2_id = user_2_id;
    }

    @Override
    public String toString() {
        return "chatbox{" + "chatbox_id=" + chatbox_id + ", user_1_id=" + user_1_id + ", user_2_id=" + user_2_id + '}';
    }
    
    
}
