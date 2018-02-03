package com.itwill.el.function;

import java.text.DecimalFormat;

public class Function {
	public static String decimalFormat(int decimal, String pattern) {
		DecimalFormat format = new DecimalFormat(pattern);
		return format.format(decimal);
		
	}
}
