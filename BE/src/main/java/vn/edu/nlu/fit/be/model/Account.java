package vn.edu.nlu.fit.be.model;

import java.sql.Timestamp;

public class Account {

    private int userId;
    private int profileId;
    private String userEmail;
    private String userName;
    private String password;
    private AccountStatus status; // Active / UnActive
    private int role;
    private Timestamp createdAt;

    //Constructor

    public Account() {}

    public Account(int userId, int profileId, String userEmail, String userName, Timestamp createdAt, int role, AccountStatus status, String password) {
        this.userId = userId;
        this.profileId = profileId;
        this.userEmail = userEmail;
        this.userName = userName;
        this.createdAt = createdAt;
        this.role = role;
        this.status = status;
        this.password = password;
    }

    // Getters & Setters

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public AccountStatus getStatus() {
        return status;
    }

    public void setStatus(AccountStatus status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }
}
