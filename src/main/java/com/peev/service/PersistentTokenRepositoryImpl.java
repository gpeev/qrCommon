package com.peev.service;

import org.springframework.security.web.authentication.rememberme.PersistentRememberMeToken;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import java.util.Date;


public class PersistentTokenRepositoryImpl   implements PersistentTokenRepository
{

	@Override
	public void createNewToken(PersistentRememberMeToken persistentRememberMeToken)
	{
		//To change body of implemented methods use File | Settings | File Templates.
	}

	@Override
	public void updateToken(String s, String s1, Date date)
	{
		//To change body of implemented methods use File | Settings | File Templates.
	}

	@Override
	public PersistentRememberMeToken getTokenForSeries(String s)
	{
		return null;  //To change body of implemented methods use File | Settings | File Templates.
	}

	@Override
	public void removeUserTokens(String s)
	{
		//To change body of implemented methods use File | Settings | File Templates.
	}
}
