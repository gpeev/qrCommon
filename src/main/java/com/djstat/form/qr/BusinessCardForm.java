package com.djstat.form.qr;


import javax.validation.constraints.Pattern;
import java.io.Serializable;

public class BusinessCardForm implements Serializable
{
	@Pattern(regexp = ".+")
private String firstName;

	@Pattern(regexp = ".+")
	private String lastName;

	@Pattern(regexp = ".+@.+\\.[a-z]+")
	private String email;

	@Pattern(regexp = ".+")
	private String phone;

	@Pattern(regexp = ".+")
	private String address;


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
}
