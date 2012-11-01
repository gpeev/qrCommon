package com.djstat.model.auth;

import org.springframework.security.crypto.codec.Hex;

import javax.persistence.*;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

/**
 * The user account entity class.
 */
//@SuppressWarnings("serial")
//@Repository
@Entity
public class UserAccount
{
	@Id
	//@GeneratedValue(strategy = GenerationType.AUTO)
	private String id;

	/**
	 * The username.
	 */
	private String username;

	/**
	 * The e-mail address.
	 */
	private String email;

	/**
	 * The display name.
	 */
	private String displayName;

	/**
	 * The password.
	 */
	private String password;

	/**
	 * The salt.
	 */
	private String salt;

	/**
	 * The role.
	 */
	private String role;

	/**
	 * The activation key.
	 */
	private String activationKey;

	/**
	 * The activation e-mail status.
	 */
	private String activationEmailSent;

	/**
	 * The enabled status.
	 */
	private String enabled;

	/**
	 * The account non-expired status.
	 */
	private String accountNonExpired;

	/**
	 * The account non-locked status.
	 */
	private String accountNonLocked;

	/**
	 * The credentials non-expired status.
	 */
	private String credentialsNonExpired;

	/**
	 * The persistent user.
	 */
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private PersistentUser persistentUser;

	/**
	 * Create a user account with a unique username.
	 *
	 * @param username the username
	 */
	public UserAccount(final String username)
	{
		System.out.println("$$$$$$$$ Creating UserAccount with username constructor!!!!!!!!!!!!!!!!!!!!");
		MessageDigest sDigest = null;
		MessageDigest aDigest = null;

		this.id = username;
		this.username = username;
		this.enabled = "false";
		this.accountNonExpired = "true";
		this.accountNonLocked = "true";
		this.credentialsNonExpired = "true";
		this.role = "ROLE_USER";

		try
		{
			sDigest = MessageDigest.getInstance("SHA-256");
			aDigest = MessageDigest.getInstance("SHA-256");
			sDigest.update(UUID.randomUUID().toString().getBytes("UTF-8"));
			aDigest.update(UUID.randomUUID().toString().getBytes("UTF-8"));
		}
		catch (NoSuchAlgorithmException e)
		{
			throw new IllegalArgumentException(e);
		}
		catch (UnsupportedEncodingException e)
		{
			throw new IllegalArgumentException(e);
		}

		this.salt = String.valueOf(Hex.encode(sDigest.digest()));
		this.activationKey = String.valueOf(Hex.encode(aDigest.digest()));
		this.activationEmailSent = "false";
	}

	public UserAccount()
	{
	}


	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
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
	 * Returns the email.
	 *
	 * @return the email
	 */
	public final String getEmail()
	{
		return email;
	}

	/**
	 * Sets the email.
	 *
	 * @param email the email
	 */
	public final void setEmail(final String email)
	{
		this.email = email;
	}

	/**
	 * Gets the display name.
	 *
	 * @return the display name
	 */
	public final String getDisplayName()
	{
		return displayName;
	}

	/**
	 * Sets the display name.
	 *
	 * @param displayName the display name
	 */
	public final void setDisplayName(final String displayName)
	{
		this.displayName = displayName;
	}

	/**
	 * Returns the password.
	 *
	 * @return the password
	 */
	public final String getPassword()
	{
		return password;
	}

	/**
	 * Sets the password.
	 *
	 * @param password the password
	 */
	public final void setPassword(final String password)
	{
		this.password = password;
	}

	/**
	 * Returns the salt.
	 *
	 * @return the salt
	 */
	public final String getSalt()
	{
		return salt;
	}

	/**
	 * Sets the salt.
	 *
	 * @param salt the salt
	 */
	public final void setSalt(final String salt)
	{
		this.salt = salt;
	}

	/**
	 * Returns the role.
	 *
	 * @return the role
	 */
	public final String getRole()
	{
		return role;
	}

	/**
	 * Sets the role.
	 *
	 * @param role the role
	 */
	public final void setRole(final String role)
	{
		this.role = role;
	}

	/**
	 * Gets the activation key.
	 *
	 * @return the activation key
	 */
	public final String getActivationKey()
	{
		return activationKey;
	}

	/**
	 * Sets the activation key.
	 *
	 * @param activationKey the activation key
	 */
	public final void setActivationKey(final String activationKey)
	{
		this.activationKey = activationKey;
	}

	/**
	 * Indicates if the activation e-mail has been sent.
	 *
	 * @return true if sent; false otherwise
	 */
	public final String getActivationEmailSent()
	{
		return notNullBool(activationEmailSent);
	}

	private String notNullBool(String s)
	{

		if(s != null && !s.equals("") && s.equalsIgnoreCase("true"))
		{
			return "true";
		}
		else if(s != null && !s.equals("") && s.equalsIgnoreCase("true"))
		{

			return "false";
		}
		else
		{
			return "false";
		}
	}

	/**
	 * Sets the activation e-mail sent status.
	 *
	 * @param activationEmailSent true if sent; false otherwise
	 */
	public final void setActivationEmailSent(final String activationEmailSent)
	{
		this.activationEmailSent = activationEmailSent;
	}

	/**
	 * Indicates if the account is enabled.
	 *
	 * @return true if enabled; false otherwise
	 */
	public final String getEnabled()
	{
		return notNullBool(enabled);
	}


	/**
	 * Sets the enabled status.
	 *
	 * @param enabled true if enabled; false otherwise
	 */
	public final void setEnabled(final String enabled)
	{
		this.enabled = enabled;
	}

	/**
	 * Indicates if the account is non-expired.
	 *
	 * @return true if non-expired; false otherwise
	 */
	public final String getAccountNonExpired()
	{
		return notNullBool(accountNonExpired);
	}

	/**
	 * Sets the account non-expired status.
	 *
	 * @param accountNonExpired true if non-expired; false otherwise
	 */
	public final void setAccountNonExpired(final String accountNonExpired)
	{
		this.accountNonExpired = accountNonExpired;
	}

	/**
	 * Indicates if the account is non-locked.
	 *
	 * @return true if non-locked; false otherwise
	 */
	public final String getAccountNonLocked()
	{
		return notNullBool(accountNonLocked);
	}

	/**
	 * Sets the account non-locked status.
	 *
	 * @param accountNonLocked true if non-locked; false otherwise
	 */
	public final void setAccountNonLocked(final String accountNonLocked)
	{
		this.accountNonLocked = accountNonLocked;
	}

	/**
	 * Indicates if the account credentials are non-expired.
	 *
	 * @return true if non-expired; false otherwise
	 */
	public final String getCredentialsNonExpired()
	{
		return notNullBool(credentialsNonExpired);
	}

	/**
	 * Sets the account credentials non-expired status.
	 *
	 * @param credentialsNonExpired true if non-expired; false otherwise
	 */
	public final void setCredentialsNonExpired(final String credentialsNonExpired)
	{
		this.credentialsNonExpired = credentialsNonExpired;
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

	public final boolean isEnabled()
	{
		return Boolean.getBoolean(getEnabled());
	}





	@Override
	public String toString()
	{
		return "UserAccount{" +
				"id='" + id + '\'' +
				", username='" + username + '\'' +
				", email='" + email + '\'' +
				", displayName='" + displayName + '\'' +
				", password='" + password + '\'' +
				", salt='" + salt + '\'' +
				", role='" + role + '\'' +
				", activationKey='" + activationKey + '\'' +
				", activationEmailSent=" + activationEmailSent +
				", enabled=" + enabled +
				", accountNonExpired=" + accountNonExpired +
				", accountNonLocked=" + accountNonLocked +
				", credentialsNonExpired=" + credentialsNonExpired +
				", persistentUser=" + persistentUser +
				'}';
	}

	public boolean isCredentialsNonExpired()
	{
		return Boolean.getBoolean(getCredentialsNonExpired());
	}

	public boolean isAccountNonLocked()
	{
		return Boolean.getBoolean(getAccountNonLocked());
	}

	public boolean isAccountNonExpired()
	{
		return Boolean.getBoolean(getAccountNonExpired());
	}


	public boolean isActivationEmailSent()
	{
		return Boolean.getBoolean(getActivationEmailSent());
	}
}
