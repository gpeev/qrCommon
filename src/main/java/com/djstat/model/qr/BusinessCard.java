package com.djstat.model.qr;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BusinessCard extends QrCommonImpl
{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	String id;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String address;
	private String username;

	public BusinessCard(String fName, String lName, String email, String phone, String address)
	{
		this.firstName = fName;
		this.lastName = lName;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public BusinessCard()
	{
		//To change body of created methods use File | Settings | File Templates.
	}

	public String getFirstName()
	{
		return firstName;
	}

	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}

	public String getLastName()
	{
		return lastName;
	}

	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getShortCode()
	{
		return shortCode;
	}

	public void setShortCode(String shortCode)
	{
		this.shortCode = shortCode;
	}
}
