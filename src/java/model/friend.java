package model;
public class friend {
    private String friendId;
    private String avatar;
    private String fullname;
    private int active;
    private String status;

    public friend(String friendId, String fullname, String avatar,int active,String status) {
        this.friendId = friendId;
        this.avatar = avatar;
        this.fullname = fullname;
        this.active = active;
        this.status = status;
    }

    public friend() {
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    public String getFriendId() {
        return friendId;
    }

    public void setFriendId(String friendId) {
        this.friendId = friendId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "friend{" + "friendId=" + friendId + ", avatar=" + avatar + ", fullname=" + fullname + ", active=" + active + ", status=" + status + '}';
    }
    
}
