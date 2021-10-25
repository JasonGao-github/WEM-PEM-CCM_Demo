package com.wemccm.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.User;
import com.wemccm.common.entity.UserType;
import com.wemccm.common.pojo.ChangePasswordPojo;
import com.wemccm.common.pojo.UserListPojo;
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

	public List<UserListPojo> listAllUser() {

		return userDao.listAllUser();
	};

	public void deleteUser(int id) {

		userDao.deleteUser(id);

	}

	public String changePassword(ChangePasswordPojo pojo) {

		User u = userDao.getUserById(pojo.getUserId());
		if (!u.getPassword().equals(pojo.getOriginalPassword())) {
			return "01";
		}

		userDao.updatePassword(pojo);
		return "00";

	}

	public List<UserType> listAllUserType() {

		return userDao.listAllUserType();
	}

	public List<User> listUserByType(int userTypeId) {

		return userDao.listUserByType(userTypeId);
	}

}