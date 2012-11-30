package com.djstat.util;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.simpledb.AmazonSimpleDB;
import com.amazonaws.services.simpledb.AmazonSimpleDBClient;
import com.amazonaws.services.simpledb.model.*;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;


public class SDBUtil
{
	private AmazonSimpleDB sdb;

	public SDBUtil()
	{
		AWSCredentials credentials = null;

		try
		{
			InputStream resourceAsStream = SDBUtil.class.getResourceAsStream("/AwsCredentials.properties");
			System.out.println("Resource:" + resourceAsStream);
			credentials = new PropertiesCredentials(resourceAsStream);
		}
		catch (IOException e1)
		{
			System.out.println("Credentials were not properly entered into AwsCredentials.properties.");
			System.out.println(e1.getMessage());
			System.exit(-1);
		}

		this.sdb = new AmazonSimpleDBClient(credentials);
	}

	public static void main(String[] args)
	{
		SDBUtil util = new SDBUtil();

		util.delete("djstat-UserAccount");


		List<String> doamins = util.listDomains();
		for (int i = 0; i < doamins.size(); i++)
		{
			String domain = doamins.get(i);
			util.getDomainObjectCount(domain);
		}



	}


	public void delete(String domainName)
	{
		DeleteDomainRequest ddr = new DeleteDomainRequest(domainName);
		sdb.deleteDomain(ddr);

	}

	public List<String> listDomains()
	{
		ListDomainsResult rs = sdb.listDomains();
		List<String> domains = rs.getDomainNames();
		System.out.println("Domains:");
		System.out.println("--------");
		for (int i = 0; i < domains.size(); i++)
		{
			String domain = domains.get(i);
			System.out.println((i + 1) + ") " + domain);
		}
		return domains;
	}


	public void getDomainObjectCount(String domainName)
	{
		SelectRequest sr = new SelectRequest();
		sr.setSelectExpression("select u from `"+domainName+"`");
		//SelectResult rs = sdb.select(sr);
		//List<Item> items = rs.getItems();
		System.out.println("");
		System.out.println("Items for " + domainName + ":");
		System.out.println("--------------------------------");
		for (Item item : sdb.select(sr).getItems())
		{


			List<Attribute> attributes = item.getAttributes();
			System.out.println("\t" + item.getName()+"["+attributes.size()+"]: ");
			for (Attribute attribute : attributes)
			{
				System.out.println("      Attribute");
				System.out.println("        Name:  " + attribute.getName());
				System.out.println("        Value: " + attribute.getValue());
			}


		}
	}


}
