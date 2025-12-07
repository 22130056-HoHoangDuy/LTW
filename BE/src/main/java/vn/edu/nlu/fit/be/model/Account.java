package vn.edu.nlu.fit.be.model;

import java.sql.Timestamp;

public class Account {

    private int userId;
    private String userName;
    private String password;
    private String email;
    private Timestamp createdAt;
    private AccountStatus status; //accountStatus
    private int role;
    private int profileId;

    private Profile profile;

    //Constructor

    public Account() {}

    public Account(Profile profile, int profileId, int role, AccountStatus status, Timestamp createdAt, String email, String password, String userName, int userId) {
        this.profile = profile;
        this.profileId = profileId;
        this.role = role;
        this.status = status;
        this.createdAt = createdAt;
        this.email = email;
        this.password = password;
        this.userName = userName;
        this.userId = userId;
    }

    //Getting and Setting

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
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

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    /*
     * status ENUM('Active', 'Inactive')
     * - Active: tài khoản đang hoạt động
     * - Inactive: tài khoản bị khóa hoặc chưa kích hoạt
     */

    public enum AccountStatus {
        ACTIVE, INACTIVE;
    }
}
