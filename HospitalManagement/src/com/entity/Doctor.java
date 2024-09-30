package com.entity;

public class Doctor {
    private String id;
    private String docname;
    private String dob;
    private String qualification;
    private String specialization;
    private String email;
    private String password;
    private String phone;
    private String gender;

    public Doctor() {
        super();
    }

    public Doctor(String id, String docname, String dob, String qualification, String specialization, String email, String password, String phone, String gender) {
        this.id = id;
        this.docname = docname;
        this.dob = dob;
        this.qualification = qualification;
        this.specialization = specialization;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.gender = gender;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDocname() {
        return docname;
    }

    public void setDocname(String docname) {
        this.docname = docname;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
