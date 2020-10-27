package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.model.UserDetails;
import com.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/home")
	public ModelAndView home(@ModelAttribute(value = "stateList") Map<String, String> sMap) {

		ModelAndView modelAndView = new ModelAndView();
		System.out.println("inside statecitydropdown UserController");
		modelAndView.addObject("sMap", sMap);
		modelAndView.setViewName("registration");
		return modelAndView;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute UserDetails userDetails,
			@RequestParam("profile") CommonsMultipartFile file, HttpSession s) throws IOException {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println();
		System.out.println("getfName " + userDetails.getfName());

		/*
		 * String path = s.getServletContext().getRealPath("/") + "WEB-INF" +
		 * File.separator + "resources" + File.separator + "images" +
		 * File.separator + file.getOriginalFilename();
		 */

		String path = "E:/images/" + file.getOriginalFilename();
		System.out.println("path " + path);

		// upload file in folder
		byte[] data = file.getBytes();
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(data);
		fos.close();

		// upload file in db
		/*
		 * FileInputStream fis = new FileInputStream(path); byte[] data1 = new
		 * byte[fis.available()]; fis.read(data1); userDetails.setFile(data1);
		 */

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-YYYY HH:mm:HH");
		String creationDate = sdf.format(d);
		userDetails.setCreationDate(creationDate);
		userDetails.setImageName(file.getOriginalFilename());
		System.out.println("insdie controller===========");
		userService.saveUser(userDetails);
		modelAndView.setViewName("redirect:/view");
		return modelAndView;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public ModelAndView view() {

		ModelAndView modelAndView = new ModelAndView();
		List<UserDetails> allUserDetails = userService.getAllUserDetails();
		System.out.println("USerdetails " + allUserDetails.size());
		modelAndView.addObject("allUserDetails", allUserDetails);
		modelAndView.setViewName("viewAllDetails");
		return modelAndView;
	}

	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public ModelAndView deleteUser(@RequestParam("id") String id) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("inside deleteUser");
		System.out.println("id inside deleteUser " + id);

		userService.deleteUser(id);

		modelAndView.setViewName("redirect:/view");
		return modelAndView;
	}

	@RequestMapping(value = "/editUser", method = RequestMethod.GET)
	public ModelAndView updateUser(@RequestParam("id") String id,
			@ModelAttribute(value = "stateList") Map<String, String> sMap) {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("inside updateUser");

		UserDetails userDetails = userService.findUserById(id);

		System.out.println("id inside updateUser " + id);

		modelAndView.addObject("userDetails", userDetails);
		modelAndView.addObject("sMap", sMap);
		modelAndView.setViewName("edit");
		return modelAndView;
	}

	@RequestMapping(value = "/updateUserDetails", method = RequestMethod.POST)
	public ModelAndView updateUserDetails(@ModelAttribute UserDetails userDetails) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("inside updateUserDetails");
		System.out.println("getHobby " + userDetails.getHobby());
		System.out.println("getCreationDate " + userDetails.getCreationDate());

		userDetails.setUpdatedDate(new Date());
		userService.updateUserDetails(userDetails);
		modelAndView.setViewName("redirect:/view");
		return modelAndView;
	}

	@RequestMapping(value = "/updateEmp", method = RequestMethod.POST)
	public ModelAndView test(@ModelAttribute UserDetails userDetails) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("inside test method");

		return modelAndView;
	}

	@RequestMapping(value = "/uploadfile")
	public ModelAndView uploadFile(@ModelAttribute UserDetails userDetails) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("uploadfile");
		return modelAndView;
	}

	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public ModelAndView fileUpload(@RequestParam("name") String name,
			@RequestParam("profile") CommonsMultipartFile file, HttpSession s) {
		ModelAndView modelAndView = new ModelAndView();

		System.out.println("name " + name);

		System.out.println(file.getName());
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getStorageDescription());
		System.out.println("Actual path " + s.getServletContext().getRealPath("/"));
		String path = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "images" + File.separator
				+ file.getOriginalFilename();
		System.out.println("path " + path);

		byte[] data = file.getBytes();
		try {
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(data);
			fos.close();
			System.out.println("File Uploaded");
		} catch (Exception e) {

			e.printStackTrace();
			System.out.println("Uploading error");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/ajaxStateData")
	@ResponseBody
	public String city(@RequestParam String sName,
			@ModelAttribute(value = "cityList") Map<String, ArrayList<String>> cityMap) {
		StringJoiner cities = new StringJoiner(",");
		cityMap.forEach((k, v) -> {
			if (sName.equals(k)) {
				v.forEach((c) -> {
					cities.add(c);
				});
			}
		});

		return cities.toString();
	}

	@ModelAttribute(value = "cityList")
	public static HashMap<String, ArrayList<String>> populateCityStateWise() {

		HashMap<String, ArrayList<String>> cityMap = new HashMap<String, ArrayList<String>>();

		ArrayList<String> mh = new ArrayList<String>();
		mh.add("Mumbai");
		mh.add("Pune");
		mh.add("Nagpur");
		mh.add("Nashik");
		mh.add("Solapur");
		cityMap.put("Maharashtra", mh);

		ArrayList<String> mp = new ArrayList<String>();
		mp.add("Bhopal");
		mp.add("Indore");
		mp.add("Jablpur");
		mp.add("Gwalior");
		mp.add("Ujjain");
		cityMap.put("Madya Pradesh", mp);

		ArrayList<String> up = new ArrayList<String>();
		up.add("Kanpur");
		up.add("Lucknow");
		up.add("Ghaziabad");
		up.add("Varanasi");
		up.add("Gorakhpur");
		cityMap.put("Uttar Pradesh", up);

		ArrayList<String> ap = new ArrayList<String>();
		ap.add("Visakhapatnam");
		ap.add("Vijayawada");
		ap.add("Kakinada");
		ap.add("Guntur");
		cityMap.put("Andra Pradesh", ap);

		ArrayList<String> wb = new ArrayList<String>();
		wb.add("Kolkata");
		wb.add("Asansol");
		wb.add("Siliguri");
		wb.add("Shantipur");
		wb.add("Bardhaman");
		cityMap.put("West Bengal", wb);

		ArrayList<String> telagana = new ArrayList<String>();
		telagana.add("Hyderabad");
		telagana.add("Warangal");
		telagana.add("Karimnaga");
		telagana.add("Nizamabad");
		telagana.add("Khammam");
		cityMap.put("Telagana", telagana);

		ArrayList<String> bihar = new ArrayList<String>();
		bihar.add("Patna");
		bihar.add("Bihar Sharif");
		bihar.add("Gaya");
		bihar.add("Darbhanga");
		bihar.add("Nalanda");
		cityMap.put("Bihar", bihar);

		ArrayList<String> haryana = new ArrayList<String>();
		haryana.add("Faridabad");
		haryana.add("Gurugram");
		haryana.add("Panipat");
		haryana.add("Karnal");
		haryana.add("Panchkula");
		haryana.add("Ambala");
		cityMap.put("Haryana", haryana);

		ArrayList<String> gujarat = new ArrayList<String>();
		gujarat.add("Kolkata");
		gujarat.add("Asansol");
		gujarat.add("Siliguri");
		gujarat.add("Shantipur");
		gujarat.add("Bardhaman");
		cityMap.put("Gujarat", gujarat);

		ArrayList<String> karnataka = new ArrayList<String>();
		karnataka.add("Bengaluru");
		karnataka.add("Mangalore");
		karnataka.add("Ballari");
		karnataka.add("Hubli");
		cityMap.put("Karnataka", karnataka);

		ArrayList<String> kerala = new ArrayList<String>();
		kerala.add("Thiruvananthapuram");
		kerala.add("Kochi");
		kerala.add("Kozhikode");
		kerala.add("Kollam");
		kerala.add("Thrissur");
		kerala.add("Kannur");
		cityMap.put("Kerala", kerala);
		return cityMap;
	}

	@ModelAttribute(value = "stateList")
	public Map<String, String> populateSate() {

		Map<String, String> sMap = new HashMap<String, String>();
		sMap.put("Andra Pradesh", "Andra Pradesh");
		sMap.put("Maharashtra", "Maharashtra");
		sMap.put("Madya Pradesh", "Madya Pradesh");
		sMap.put("Uttar Pradesh", "Uttar Pradesh");
		sMap.put("West Bengal", "West Bengal");
		sMap.put("Telagana", "Telagana");
		sMap.put("Bihar", "Bihar");
		sMap.put("Haryana", "Haryana");
		sMap.put("Gujarat", "Gujarat");
		sMap.put("Karnataka", "Karnataka");
		sMap.put("Kerala", "Kerala");

		return sMap;
	}
}
