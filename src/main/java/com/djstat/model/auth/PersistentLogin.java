package com.djstat.model.auth;


import org.springframework.stereotype.Repository;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import java.util.Date;

/**
 * The persistent login entity class.
 */
@SuppressWarnings("serial")
@Repository
@Entity
public class PersistentLogin
{

	/**
	 * The key.
	 */
	@Id
	private String id;

	/**
	 * The username.
	 */
	private String username;

	/**
	 * The series.
	 */
	private String series;

	/**
	 * The token.
	 */
	private String token;

	/**
	 * The last used date.
	 */
	private Date lastUsed;

	/**
	 * The persistent user.
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	private PersistentUser persistentUser;

	/**
	 * Create persistent login with a unique username.
	 *
	 * @param id      the parent key
	 * @param username the username
	 */
	public PersistentLogin(final String id, final String username)
	{
		this.id = id;
		//this.key = KeyFactory.createKey(key, getClass().getSimpleName(), username);
		this.username = username;
	}

	public PersistentLogin()
	{

	}


	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	/**
	 * Returns the username.
	 *
	 * @return the username
	 */
	public final String getUsername()
	{
		return username;
	}

	/**
	 * Sets the username.
	 *
	 * @param username the username
	 */
	public final void setUsername(final String username)
	{
		this.username = username;
	}

	/**
	 * Returns the series.
	 *
	 * @return the series.
	 */
	public final String getSeries()
	{
		return series;
	}

	/**
	 * Sets the series.
	 *
	 * @param series the series
	 */
	public final void setSeries(final String series)
	{
		this.series = series;
	}

	/**
	 * Returns the token.
	 *
	 * @return the token
	 */
	public final String getToken()
	{
		return token;
	}

	/**
	 * Sets the token.
	 *
	 * @param token the token
	 */
	public final void setToken(final String token)
	{
		this.token = token;
	}

	/**
	 * Returns the last used date.
	 *
	 * @return the last used date
	 */
	public final Date getLastUsed()
	{
		return lastUsed;
	}

	/**
	 * Sets the last used date.
	 *
	 * @param lastUsed the last used date
	 */
	public final void setLastUsed(final Date lastUsed)
	{
		this.lastUsed = lastUsed;
	}

	/**
	 * Gets the persistent user.
	 *
	 * @return the persistent user
	 */
	public final PersistentUser getPersistentUser()
	{
		return persistentUser;
	}

	/**
	 * Sets the persistent user.
	 *
	 * @param persistentUser the persistent user
	 */
	public final void setPersistentUser(final PersistentUser persistentUser)
	{
		this.persistentUser = persistentUser;
	}

}
