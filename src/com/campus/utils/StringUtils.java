package com.campus.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtils {

	public static String dateFormat(String date) {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");

		try {
			Date date2 = simpleDateFormat.parse(date);
			SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(
					"yyyy年MM月dd日 HH:mm");
			date = simpleDateFormat2.format(date2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return date;

	}

	public Date stringToDate(String date) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sdf.parse(date);
		} catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		return null;

	}

	public String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}

}
