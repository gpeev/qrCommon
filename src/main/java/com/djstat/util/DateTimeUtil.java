package com.djstat.util;

import java.text.SimpleDateFormat;
import java.util.Date;



public class DateTimeUtil
{

	private static final SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a z");

	public static String formatDate(long longDate)
	{
		if(longDate == 0)
		{
			return "";
		}
		else
		{
			return formatter.format(new Date(longDate));
		}
	}

}
