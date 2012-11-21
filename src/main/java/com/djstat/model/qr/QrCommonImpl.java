package com.djstat.model.qr;


import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class QrCommonImpl implements QrCommon
{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	String id;
	String shortCode;


	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}




}
