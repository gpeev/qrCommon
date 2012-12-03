package com.djstat.form;


import com.djstat.model.QrArtifact;

import java.io.Serializable;

public class PreviewUpdate implements Serializable
{

	private String title;
	private String header;
	private String footer;
	private String border;
	private String badge;
	private String url;
	private String color;
	private String shortCode;


	public PreviewUpdate(QrArtifact qr)
	{
		this.title=qr.getTitle();
		this.header=qr.getHeader();
		this.footer=qr.getFooter();
		this.border=qr.getBorder();
		this.badge=qr.getBadge();
		this.url=qr.getUrl();
		this.color=qr.getColor();
		this.shortCode=qr.getShortCode();
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

	public String getShortCode()
	{
		return shortCode;
	}

	public void setShortCode(String shortCode)
	{
		this.shortCode = shortCode;
	}
}
