package com.peek;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.simpledb.AmazonSimpleDB;
import com.amazonaws.services.simpledb.AmazonSimpleDBClient;
import com.amazonaws.services.simpledb.model.CreateDomainRequest;
import com.amazonaws.services.simpledb.model.PutAttributesRequest;
import com.amazonaws.services.simpledb.model.ReplaceableAttribute;

import java.io.File;
import java.io.IOException;

public class AgentManager
{
	public static final String SimpleDB_Domain_Players = "tutorial-players";
	public static final String S3_Bucket_PlayerFiles = "tutorial-playerfiles-java123";
	public static final String S3_FolderKey_PlayerPhotos = "photos/";

	private AmazonS3 s3;
	private AmazonSimpleDB sdb;

	public AgentManager()
	{
		AWSCredentials credentials = null;

		try
		{
			credentials = new PropertiesCredentials(AgentManager.class.getResourceAsStream("AwsCredentials.properties"));
		}
		catch (IOException e1)
		{
			System.out.println("Credentials were not properly entered into AwsCredentials.properties.");
			System.out.println(e1.getMessage());
			System.exit(-1);
		}

		this.s3 = new AmazonS3Client(credentials);
		this.sdb = new AmazonSimpleDBClient(credentials);
	}

	public void setupStorage()
	{
		CreateDomainRequest createPlayersDomainReq;

		// Create Players domain in SimpleDB.
		createPlayersDomainReq = (new CreateDomainRequest()).withDomainName(SimpleDB_Domain_Players);

		// Create Players domain in SimpleDB.
		this.sdb.createDomain(createPlayersDomainReq);

		// Create the Amazon S3 bucket for player photos
		// bucket names must be unique across all of Amazon S3
		this.s3.createBucket(S3_Bucket_PlayerFiles);
	}


	public void registerAgent(String email, String agentName, String pictureFile)
	{
		PutAttributesRequest agentAttributesReq;

		// Build an Amazon S3 key for the player photo
		// from the photos folder name and player's email
		String pictureS3Key = S3_FolderKey_PlayerPhotos + email.replaceAll("\\.", "_dot_").replaceAll("@", "_at_") + ".png";

		// Store the picture in Amazon S3
		this.s3.putObject(S3_Bucket_PlayerFiles, pictureS3Key, new File(pictureFile));

		// Send the player information to Amazon SimpleDB
		// use the email for the item name
		agentAttributesReq = new PutAttributesRequest().withDomainName(SimpleDB_Domain_Players).withItemName(email);

		// Add the player name as an attribute
		agentAttributesReq.getAttributes().add(new ReplaceableAttribute().withName("AgentName").withValue(agentName).withReplace(true));

		agentAttributesReq.getAttributes().add(new ReplaceableAttribute().withName("PictureS3Key").withValue(pictureS3Key).withReplace(true));

		// Send the put attributes request
		this.sdb.putAttributes(agentAttributesReq);
	}


}