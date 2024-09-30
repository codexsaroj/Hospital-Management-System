package com.entity;

public class Appointment {
    private int appointmentId;
    private int userId;
    private String fName;
    private int age;
    private String appointDate;
    private String email;
    private String phone;
    private String disease;
    private String doctorId;
    private String docName;
    private String address;
    private String gender;
    private String status;

    public Appointment() {
        super();
    }

    public Appointment(int userId, String fName, int age, String appointDate, String email, String phone, String disease, String doctorId, String gender, String address, String status) {
        this.userId = userId;
        this.fName = fName;
        this.age = age;
        this.appointDate = appointDate;
        this.email = email;
        this.phone = phone;
        this.disease = disease;
        this.doctorId = doctorId;
        this.gender = gender;
        this.address = address;
        this.status = status;
    }

    // constructor for updation of the status


    public Appointment(int appointmentId, int userId, String fName, int age, String appointDate, String email, String phone, String disease, String doctorId, String address, String gender, String status) {
        this.appointmentId = appointmentId;
        this.userId = userId;
        this.fName = fName;
        this.age = age;
        this.appointDate = appointDate;
        this.email = email;
        this.phone = phone;
        this.disease = disease;
        this.doctorId = doctorId;
        this.address = address;
        this.gender = gender;
        this.status = status;
    }


    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAppointDate() {
        return appointDate;
    }

    public void setAppointDate(String appointDate) {
        this.appointDate = appointDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDisease() {
        return disease;
    }

    public void setDisease(String disease) {
        this.disease = disease;
    }

    public String getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(String doctorId) {
        this.doctorId = doctorId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}