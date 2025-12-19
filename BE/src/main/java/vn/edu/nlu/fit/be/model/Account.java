package vn.edu.nlu.fit.be.model;

import java.sql.Timestamp;

public class Account {

    private int accountId;
    private int profileId;
    private String email;
    private String username;
    private String password;
    private AccountStatus status; // Active / UnActive
    private int role;
    private Timestamp createdAt;

    //Constructor

    public Account() {}

    public Account(int accountId, int profileId, String email, String username, Timestamp createdAt, int role, AccountStatus status, String password) {
        this.accountId = accountId;
        this.profileId = profileId;
        this.email = email;
        this.username = username;
        this.createdAt = createdAt;
        this.role = role;
        this.status = status;
        this.password = password;
    }

    // Getters & Setters

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String userName) {
        this.username = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String userEmail) {
        this.email = email;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }
}
