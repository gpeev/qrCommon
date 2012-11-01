package com.djstat.exception;

/**
 * The duplicate exception.
 */
@SuppressWarnings("serial")
public class DuplicateException extends RuntimeException
{

	public DuplicateException()
	{
		super();
	}


	public DuplicateException(String msg)
	{
		super(msg);
	}
}
