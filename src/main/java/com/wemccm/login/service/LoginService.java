package com.wemccm.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.User;
import com.wemccm.login.dao.ILoginDao;

@Service
public class LoginService {

	@Autowired
	private ILoginDao loginDao;

	public String login(String email, String password) {

		User u = loginDao.getUserByEmail(email);
		if (null == u) {
			return "01";
		}

		if (password.equals(u.getPassword())) {
			return "02";
		}

		return "00";

	};

}