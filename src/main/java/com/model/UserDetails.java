package com.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "userDetails_table")
public class UserDetails {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "first_name")
	private String fName;

	@Column(name = "last_name")
	private String lName;

	@Column(name = "date_of_birth")
	private String dob;

	@Column(name = "gender")
	private String gender;

	@Column(name = "hobby")
	private String hobby;

	@Column(name = "state")
	private String state;

	@Column(name = "city")
	private String city;

	@Column(name = "mobile")
	private String mobile;

	@Column(name = "pannumber")
	private String pannumber;

	@Column(name = "creation_date")
	private String creationDate;

	@Column(name = "image_name")
	private String imageName;

	@Column(name = "updated_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatedDate;

	/*
	 * @Lob
	 * 
	 * @Column(name = "image") private byte[] file;
	 */

	public UserDetails() {
	}

	public UserDetails(Integer id, String fName, String lName, String dob, String gender, String hobby, String state,
			String city, String mobile, String pannumber, String creationDate, String imageName, Date updatedDate) {
		super();
		this.id = id;
		this.fName = fName;
		this.lName = lName;
		this.dob = dob;
		this.gender = gender;
		this.hobby = hobby;
		this.state = state;
		this.city = city;
		this.mobile = mobile;
		this.pannumber = pannumber;
		this.creationDate = creationDate;
		this.imageName = imageName;
		this.updatedDate = updatedDate;
		// this.file = file;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPannumber() {
		return pannumber;
	}

	public void setPannumber(String pannumber) {
		this.pannumber = pannumber;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
}
