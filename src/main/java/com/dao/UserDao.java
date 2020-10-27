package com.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.UserDetails;

@Repository
@Transactional
public class UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	public int saveUser(UserDetails userDetails) {
		System.out.println("inside UserDao");
		int id = (Integer) sessionFactory.getCurrentSession().save(userDetails);
		System.out.println("inside UserDao id " + id);
		return id;
	}

	public List<UserDetails> getAllUserDetails() {

		List<UserDetails> userList = sessionFactory.getCurrentSession().createQuery(" from UserDetails").list();

		return userList;
	}

	public void deleteUser(String id) {

		sessionFactory.getCurrentSession().createQuery("DELETE FROM UserDetails WHERE id = " + id).executeUpdate();
	}

	public UserDetails findUserById(String id) {

		return (UserDetails) sessionFactory.getCurrentSession().get(UserDetails.class, Integer.parseInt(id));
	}

	public void updateUserDetails(UserDetails userDetails) {
		System.out.println("inside UserDao " + userDetails);
		System.out.println("inside UserDao getId " + userDetails.getId());
		sessionFactory.getCurrentSession().update(userDetails);
	}

}
