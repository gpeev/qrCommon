package com.peev.utils;

public class BaseConverterUtil
{
	public static void main(String[] args)
	{
		long c = 5209547307818686L;//11/16/2012@4:10PM EST
		long l = System.nanoTime();
		System.out.println("nanoTime = " + (l-c));

		String maxValue = Long.MAX_VALUE+"";
		System.out.println("m["+maxValue.length()+"] = "+maxValue);
		String d = BaseConverterUtil.toBase64(l);
		System.out.println("l["+(l+"").length()+"] = " + l);
		System.out.println("d["+d.length()+"] = " + d);
		String i = BaseConverterUtil.fromOtherBaseToDecimal(64, d)+"";
		System.out.println("a["+i.length()+"] = "+ i);


		System.out.println("NanoTime:"+toBase64(System.nanoTime()-c));
		System.out.println("NanoTime:"+toBase64(System.nanoTime()-c));
		System.out.println("NanoTime:"+toBase64(System.nanoTime()-c));
		System.out.println("NanoTime:"+toBase64(System.nanoTime()-c));
		System.out.println("NanoTime:"+toBase64(System.nanoTime()-c));
		System.out.println("NanoTime:"+toBase64(System.nanoTime()-c));
		System.out.println("NanoTime:"+toBase64(System.nanoTime()-c));
		System.out.println("MilliTime:"+toBase64(System.currentTimeMillis()+1));
		System.out.println("MilliTime:"+toBase64(System.currentTimeMillis()+2));
		System.out.println("MilliTime:"+toBase64(System.currentTimeMillis()+3));
		System.out.println("MilliTime:"+toBase64(System.currentTimeMillis()+4));
		System.out.println("MilliTime:"+toBase64(System.currentTimeMillis()+5));
		System.out.println("MilliTime:"+toBase64(System.currentTimeMillis()+6));
		System.out.println("MilliTime:"+toBase64(System.currentTimeMillis()+7));



	}




	private static final String baseDigits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@";

	public static String toBase64(long decimalNumber)
	{
		return fromDecimalToOtherBase(64, decimalNumber);
	}

	public static String toBase36(int decimalNumber)
	{
		return fromDecimalToOtherBase(36, decimalNumber);
	}

	public static String toBase16(int decimalNumber)
	{
		return fromDecimalToOtherBase(16, decimalNumber);
	}

	public static String toBase8(int decimalNumber)
	{
		return fromDecimalToOtherBase(8, decimalNumber);
	}

	public static String toBase2(int decimalNumber)
	{
		return fromDecimalToOtherBase(2, decimalNumber);
	}

	public static long fromBase64(String base64Number)
	{
		return fromOtherBaseToDecimal(64, base64Number);
	}

	public static long fromBase36(String base36Number)
	{
		return fromOtherBaseToDecimal(36, base36Number);
	}

	public static long fromBase16(String base16Number)
	{
		return fromOtherBaseToDecimal(16, base16Number);
	}

	public static long fromBase8(String base8Number)
	{
		return fromOtherBaseToDecimal(8, base8Number);
	}

	public static long fromBase2(String base2Number)
	{
		return fromOtherBaseToDecimal(2, base2Number);
	}

	private static String fromDecimalToOtherBase(int base, long decimalNumber)
	{
		String tempVal = decimalNumber == 0 ? "0" : "";
		int mod = 0;

		while (decimalNumber != 0)
		{
			mod = (int)(decimalNumber % base);
			tempVal = baseDigits.substring(mod, mod + 1) + tempVal;
			decimalNumber = decimalNumber / base;
		}

		return tempVal;
	}

	private static long fromOtherBaseToDecimal(int base, String number)
	{
		int iterator = number.length();
		long returnValue = 0;
		long multiplier = 1;

		while (iterator > 0)
		{
			int i = baseDigits.indexOf(number.substring(iterator - 1, iterator));
			returnValue = returnValue + (i * multiplier);
			multiplier = multiplier * base;
			--iterator;
		}
		return returnValue;
	}

}
