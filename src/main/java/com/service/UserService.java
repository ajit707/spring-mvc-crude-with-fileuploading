package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.model.UserDetails;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public int saveUser(UserDetails userDetails) {
		System.out.println("inside UserService");
		int id = userDao.saveUser(userDetails);
		return id;
	}

	public List<UserDetails> getAllUserDetails() {

		List<UserDetails> listOfUser = userDao.getAllUserDetails();

		return listOfUser;
	}

	public void deleteUser(String id) {

		userDao.deleteUser(id);
	}

	public UserDetails findUserById(String id) {

		return userDao.findUserById(id);
	}

	public void updateUserDetails(UserDetails userDetails) {
		userDao.updateUserDetails(userDetails);
	}

}
