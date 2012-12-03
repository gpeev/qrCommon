package com.djstat.model;


import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;

@Entity
public class QrArtifact
{

	private String id;

	private String qrText;
	private String username;


	private QrType type;


	private String shortCode;

	//--------------------------------
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String address;



	// ------------------ QR Meta Date
	private String title;
	private String header;
	private String footer;
	private String border;
	private String badge;
	private String url;
	private String color;


	@Id
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getQrText()
	{
		return qrText;
	}

	public void setQrText(String qrText)
	{
		this.qrText = qrText;
	}


	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	@Enumerated(EnumType.STRING)
	public QrType getType()
	{

		return type != null ? type : QrType.DEFAULT;
	}

	public void setType(QrType type)
	{
		this.type = type;
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

	public String getShortCode()
	{
		return shortCode;
	}

	public void setShortCode(String shortCode)
	{
		this.shortCode = shortCode;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getHeader()
	{
		return header;
	}

	public void setHeader(String header)
	{
		this.header = header;
	}

	public String getFooter()
	{
		return footer;
	}

	public void setFooter(String footer)
	{
		this.footer = footer;
	}

	public String getBorder()
	{
		return border;
	}

	public void setBorder(String border)
	{
		this.border = border;
	}

	public String getBadge()
	{
		return badge;
	}

	public void setBadge(String badge)
	{
		this.badge = badge;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getColor()
	{
		return color;
	}

	public void setColor(String color)
	{
		this.color = color;
	}

	@Override
	public String toString()
	{
		return "QrArtifact{" +
				"id='" + id + '\'' +
				", qrText='" + qrText + '\'' +
				", username='" + username + '\'' +
				", type='" + type + '\'' +
				//			", createDateTime=" + createDateTime +
				//			", updateDateTime=" + updateDateTime +
				'}';
	}

	public enum QrType
	{
		CONTACTCARD, REALESTATE_SALE, REALESTATE_RENT, REALESTATE_LISTINGS, URL, EMAIL, TEXT, DEFAULT;

	}
}
