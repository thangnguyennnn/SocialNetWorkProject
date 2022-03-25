package model;
public class information {
    private userInformation u;
    private String isFriend;

    public information(userInformation u, String isFriend) {
        this.u = u;
        this.isFriend = isFriend;
    }

    public userInformation getU() {
        return u;
    }

    public void setU(userInformation u) {
        this.u = u;
    }

    public String getIsFriend() {
        return isFriend;
    }

    public void setIsFriend(String isFriend) {
        this.isFriend = isFriend;
    }
    
    
}
