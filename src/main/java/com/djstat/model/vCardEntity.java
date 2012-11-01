package com.djstat.model;

import com.djstat.form.vCard;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class vCardEntity
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;

	String username;
	String name;
	String homePhone;
	String mobilePhone;
	String officePhone;
	String email;
	String facebookUrl;
	String website;
	String companyName;
	String companyPhone;
	//	String photo;
//	String companyPhoto;
	private long createDateTime;
	private long updateDateTime;


	public vCardEntity()
	{
	}

	public vCardEntity(String username, vCard v)
	{

		this.username = username;
		this.name = v.getName();
		this.homePhone = v.getHomePhone();
		this.mobilePhone = v.getMobilePhone();
		this.officePhone = v.getOfficePhone();
		this.email = v.getEmail();
		this.facebookUrl = v.getFacebookUrl();
		this.website = v.getWebsite();
		this.companyName = v.getCompanyName();
		this.companyPhone = v.getCompanyPhone();

//		this.photo = v.getPhoto();
//		this.companyPhoto = v.getCompanyPhoto();
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
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

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
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

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public long getCreateDateTime()
	{
		return createDateTime;
	}

	public void setCreateDateTime(long createDateTime)
	{
		this.createDateTime = createDateTime;
	}

	public long getUpdateDateTime()
	{
		return updateDateTime;
	}

	public void setUpdateDateTime(long updateDateTime)
	{
		this.updateDateTime = updateDateTime;
	}

	@Override
	public String toString()
	{
		return "vCardEntity{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", homePhone='" + homePhone + '\'' +
				", mobilePhone='" + mobilePhone + '\'' +
				", officePhone='" + officePhone + '\'' +
				", email='" + email + '\'' +
				", facebookUrl='" + facebookUrl + '\'' +
				", website='" + website + '\'' +
				", companyName='" + companyName + '\'' +
				", companyPhone='" + companyPhone + '\'' +
//				", photo='" + photo + '\'' +
//				", companyPhoto='" + companyPhoto + '\'' +
				'}';
	}
}
