package com.djstat.model.auth;

import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.Collection;

/**
 * The persistent user entity class.
 */
@SuppressWarnings("serial")
@Repository
@Entity
public class PersistentUser
{

	private String id;
	/**
	 * The username.
	 */
	private String username;

	/**
	 * The persistent logins.
	 */
	@OneToMany(mappedBy = "persistentUser", cascade = CascadeType.ALL)
	private Collection<PersistentLogin> persistentLogins;

	/**
	 * The user account.
	 */
	@OneToOne(mappedBy = "persistentUser", fetch = FetchType.LAZY)
	private UserAccount userAccount;

	/**
	 * Create a persistent user with a unique username.
	 *
	 * @param id      the parent key
	 * @param username the username
	 */
	public PersistentUser(final String id, final String username)
	{
		this.id = id;
		this.username = username;
	}

	public PersistentUser()
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
	 * Returns the persistent logins.
	 *
	 * @return the persistent logins
	 */
	public final Collection<PersistentLogin> getPersistentLogins()
	{
		return persistentLogins;
	}

	/**
	 * Sets the persistent logins.
	 *
	 * @param persistentLogins the persistent logins
	 */
	public final void setPersistentLogins(final Collection<PersistentLogin> persistentLogins)
	{
		this.persistentLogins = persistentLogins;
	}

	/**
	 * Gets the user account.
	 *
	 * @return the user account
	 */
	public final UserAccount getUserAccount()
	{
		return userAccount;
	}

	/**
	 * Sets the user account.
	 *
	 * @param userAccount the user account
	 */
	public final void setUserAccount(final UserAccount userAccount)
	{
		this.userAccount = userAccount;
	}

}
