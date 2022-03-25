package model;
public class containerChat {
    private userInformation u;
    private Conversation c;

    public containerChat(userInformation u, Conversation c) {
        this.u = u;
        this.c = c;
    }

    public userInformation getU() {
        return u;
    }

    public void setU(userInformation u) {
        this.u = u;
    }

    public Conversation getC() {
        return c;
    }

    public void setC(Conversation c) {
        this.c = c;
    }

    @Override
    public String toString() {
        return "containerChat{" + "u=" + u + ", c=" + c + '}';
    }
    
    
}
