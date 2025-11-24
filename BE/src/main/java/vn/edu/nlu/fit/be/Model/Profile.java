package vn.edu.nlu.fit.be.Model;

import java.sql.Date;

public class Profile {
    String full_name;
    String phone;
    String address;
    String avatar_url;
    String gender;
    Date birth_date;
    Date updated_at;

    public Profile(String full_name, String phone, String address, String avatar_url, String gender, Date birth_date, Date updated_at) {
        this.full_name = full_name;
        this.phone = phone;
        this.address = address;
        this.avatar_url = avatar_url;
        this.gender = gender;
        this.birth_date = birth_date;
        this.updated_at = updated_at;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirth_date() {
        return birth_date;
    }

    public void setBirth_date(Date birth_date) {
        this.birth_date = birth_date;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }
}
