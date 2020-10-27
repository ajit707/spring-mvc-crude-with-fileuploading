package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tets {

	public static void main(String[] args) {

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY HH:mm:HH");
		String format = sdf.format(d);
		System.out.println(format);
	}

}
