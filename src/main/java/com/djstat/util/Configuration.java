package com.djstat.util;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Configuration
{

	private static Configuration configuration = new Configuration();

	private Properties props = new Properties();

	// We leverage the properties file already required for simple jpa
	private static final String PROPERTY_PATH = "/simplejpa.properties";

	private Logger logger = Logger.getLogger(Configuration.class.getName());

	private Configuration()
	{
		try
		{
			props.load(this.getClass().getResourceAsStream(PROPERTY_PATH));
			props.load(this.getClass().getResourceAsStream("/AwsCredentials.properties"));
		}
		catch (Exception e)
		{
			logger.log(Level.SEVERE, "Unable to load configuration: " + e.getMessage(), e);
		}
	}

	public static final Configuration getInstance()
	{
		return configuration;
	}

	public String getProperty(String propertyName)
	{
		return props.getProperty(propertyName);
	}
}
