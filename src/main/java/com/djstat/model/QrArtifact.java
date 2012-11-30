package com.djstat.model;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class QrArtifact
{
	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;

	private String qrText;
	String username;
	String type; // vcard, listing, email, url, phone, text





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

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
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
}
