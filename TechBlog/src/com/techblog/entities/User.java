package com.techblog.entities;

import java.sql.Timestamp;

public class User 
{
	private int id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private Timestamp reg_date;
	private String profile;
	
	
	
	//default Constructor
	public User() 
	{
	}
	// excluding id fields
	public User(String name, String email, String password,String gender ) 
	{
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender=gender;
	}
	// including all fields
	public User(int id, String name, String email, String password,String gender) 
	{
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender=gender;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	// getters and setters
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
}
