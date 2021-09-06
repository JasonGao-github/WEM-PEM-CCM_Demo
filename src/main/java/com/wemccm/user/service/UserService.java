package com.wemccm.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.User;
import com.wemccm.common.pojo.wholeUserPojo;
import com.wemccm.user.dao.UserDao;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;



	public List<wholeUserPojo> usertype(String usertype) {
		return userDao.getWholeUser(usertype);
	}



	public List<User> leaderid(int leaderid) {
		// TODO Auto-generated method stub
		return userDao.leaderid(leaderid);
	};
	
}