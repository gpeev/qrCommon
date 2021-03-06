package com.djstat.service.mail;

import com.djstat.model.auth.UserAccount;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Locale;
import java.util.Properties;

/**
 * The mail service.
 */
@Service
public class MailService
{

	/**
	 * The from address.
	 */
	private String fromAddress;
	/**
	 * The hostname.
	 */
	private String hostname;
	/**
	 * The message source.
	 */
	private MessageSource messageSource;

	/**
	 * Gets the from address.
	 *
	 * @return the from address
	 */
	public final String getFromAddress()
	{
		return fromAddress;
	}

	/**
	 * Sets the from address.
	 *
	 * @param fromAddress the from address
	 */
	public final void setFromAddress(final String fromAddress)
	{
		this.fromAddress = fromAddress;
	}

	/**
	 * Gets the hostname.
	 *
	 * @return the hostname
	 */
	public final String getHostname()
	{
		return hostname;
	}

	/**
	 * Sets the hostname.
	 *
	 * @param hostname the hostname
	 */
	public final void setHostname(final String hostname)
	{
		this.hostname = hostname;
	}

	/**
	 * Gets the message source.
	 *
	 * @return the message source
	 */
	public final MessageSource getMessageSource()
	{
		return messageSource;
	}

	/**
	 * Sets the message source.
	 *
	 * @param messageSource the message source
	 */
	public final void setMessageSource(final MessageSource messageSource)
	{
		this.messageSource = messageSource;
	}

	/**
	 * Sends the activation e-mail to the given user.
	 *
	 * @param user   the user
	 * @param locale the locale
	 * @throws MessagingException messaging exception
	 */
	public final void sendActivationEmail(final UserAccount user, final String locale) throws MessagingException
	{
		final Properties props = new Properties();
		final Session session = Session.getDefaultInstance(props, null);
		final Message message = new MimeMessage(session);
		final Multipart multipart = new MimeMultipart();
		final MimeBodyPart htmlPart = new MimeBodyPart();
		final MimeBodyPart textPart = new MimeBodyPart();

		message.setFrom(new InternetAddress(getFromAddress()));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));

		message.setSubject(messageSource.getMessage("mail.subject", null, new Locale(locale)));

		String msg = messageSource.getMessage("mail.body.txt", new Object[]{getHostname(), user.getActivationKey()}, new Locale(locale));
		textPart.setContent(msg, "text/plain");

		htmlPart.setContent(messageSource.getMessage("mail.body.html", new Object[]{getHostname(), user.getActivationKey()}, new Locale(locale)), "text/html");

		System.out.println("\n\n\tEmail : "+msg+"\n\n");

		multipart.addBodyPart(textPart);
		multipart.addBodyPart(htmlPart);
		message.setContent(multipart);


		Transport.send(message);

	}

}
