package com.djstat.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Common
{

	public static boolean isPhoneNumber(String num)
	{
		num =num.replace(" ","");
		try
		{
			String expression = "^(?=.{7,32}$)(\\(?\\+?[0-9]*\\)?)?[0-9_\\- \\(\\)]*((\\s?x\\s?|ext\\s?|extension\\s?)\\d{1,5}){0,1}$";
			CharSequence inputStr = num;
			Pattern pattern = Pattern.compile(expression);
			Matcher matcher = pattern.matcher(inputStr);
			int x = 0, y = 0;
			char[] value = num.toCharArray();
			for (int i = 0; i < value.length; i++)
			{
				if(value[i] == '(') x++;
				if(value[i] == ')' && ((value[i + 1] >= 48 && value[i + 1] <= 57) || value[i + 1] == '-')) y++;
			}
			if(matcher.matches() && x == y)
			{
				return true; //valid number
			}
			else
			{
				return false; //invalid number
			}
		}
		catch (Exception ex)
		{
			return false;
		}
	}

}
