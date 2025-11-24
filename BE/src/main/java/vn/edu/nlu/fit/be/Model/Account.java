package vn.edu.nlu.fit.be.Model;

public class Account {
    String user_name;
    String password;
    String email;
    int role;

    public Account(String user_name, String password, String email, int role) {
        this.user_name = user_name;
        this.password = password;
        this.email = email;
        this.role = role;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
