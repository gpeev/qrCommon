package com.djstat.form;

import javax.validation.constraints.Pattern;
import java.io.Serializable;


public class QrData
		implements Serializable
{

	/**
	 * Display name.
	 */
	@Pattern(regexp = ".+")
	private String qrText;



	/* CHECKSTYLE:OFF */
	public void setQrText(final String qrText)
	{
		this.qrText = qrText;
	}
	/* CHECKSTYLE:ON */


	/* CHECKSTYLE:OFF */
	public String getQrText()
	{
		return qrText;
	}
}
