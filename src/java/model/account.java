package model;
public class account {
    private String userId, email, password, role;
    private int status;

    public account(String userId, String email, String password,int status ,String role) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.status = status;
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "account{" + "userId=" + userId + ", email=" + email + ", password=" + password + ", status=" + status + ", role=" + role + '}';
    }

    
    
}
