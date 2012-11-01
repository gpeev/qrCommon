package com.djstat.form;


import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;


@SuppressWarnings("serial")
public class vCard implements Serializable
{

	//@NotBlank
	//@Pattern(regexp = ".+")
	String name;
	String homePhone;
	String mobilePhone;
	String officePhone;
	String email;
	String facebookUrl;

	String website;
	String companyName;
	String companyPhone;

	String photo;
	String companyPhoto;

	String submitButton;



	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getHomePhone()
	{
		return homePhone;
	}

	public void setHomePhone(String homePhone)
	{
		this.homePhone = homePhone;
	}

	public String getMobilePhone()
	{
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone)
	{
		this.mobilePhone = mobilePhone;
	}

	public String getOfficePhone()
	{
		return officePhone;
	}

	public void setOfficePhone(String officePhone)
	{
		this.officePhone = officePhone;
	}

	public String getFacebookUrl()
	{
		return facebookUrl;
	}

	public void setFacebookUrl(String facebookUrl)
	{
		this.facebookUrl = facebookUrl;
	}

	public String getWebsite()
	{
		return website;
	}

	public void setWebsite(String website)
	{
		this.website = website;
	}

	public String getCompanyName()
	{
		return companyName;
	}

	public void setCompanyName(String companyName)
	{
		this.companyName = companyName;
	}

	public String getCompanyPhone()
	{
		return companyPhone;
	}

	public void setCompanyPhone(String companyPhone)
	{
		this.companyPhone = companyPhone;
	}

	/*
	public String getPhoto()
	{
		return photo;
	}

	public void setPhoto(String photo)
	{
		this.photo = photo;
	}

	public String getCompanyPhoto()
	{
		return companyPhoto;
	}

	public void setCompanyPhoto(String companyPhoto)
	{
		this.companyPhoto = companyPhoto;
	}
	*/

	public String getSubmitButton()
	{
		return submitButton;
	}

	public void setSubmitButton(String submitButton)
	{
		this.submitButton = submitButton;
	}


	@Override
	public String toString()
	{
		return "vCard{" +
				"name='" + name + '\'' +
				", homePhone='" + homePhone + '\'' +
				", mobilePhone='" + mobilePhone + '\'' +
				", officePhone='" + officePhone + '\'' +
				", email='" + email + '\'' +
				", facebookUrl='" + facebookUrl + '\'' +
				", website='" + website + '\'' +
				", companyName='" + companyName + '\'' +
				", companyPhone='" + companyPhone + '\'' +
				", photo='" + photo + '\'' +
				", companyPhoto='" + companyPhoto + '\'' +
				", submitButton='" + submitButton + '\'' +
				'}';
	}
}
