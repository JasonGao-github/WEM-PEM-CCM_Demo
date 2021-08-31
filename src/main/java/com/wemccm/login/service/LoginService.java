package com.wemccm.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.User;
import com.wemccm.common.pojo.wholeUserPojo;
import com.wemccm.login.dao.LoginDao;

@Service
public class LoginService {

	//

	@Autowired
	private LoginDao loginDao;

	public String login(String email, String password) {

		User u = loginDao.getUserByEmail(email);
		if (null == u) {
			return "-1";
		}
		if (!password.equals(u.getPassword())) {
			return "-2";
		}
		
		return u.getId().toString();

	}

	public wholeUserPojo getWholeUser(int id) {
		
		return loginDao.getWholeUser(id);
		
		
	};

//	int type=u.getUserTypeId();
//	String typename=loginDao.getTypeId(type);
	
}