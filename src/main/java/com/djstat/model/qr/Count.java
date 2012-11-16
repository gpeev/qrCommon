package com.djstat.model.qr;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Count
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private String id;
	long cnt;

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public long getCnt()
	{
		return cnt;
	}

	public void setCnt(long cnt)
	{
		this.cnt = cnt;
	}

	@Override
	public String toString()
	{
		return "Count{" +
				"id='" + id + '\'' +
				", cnt=" + cnt +
				'}';
	}
}
