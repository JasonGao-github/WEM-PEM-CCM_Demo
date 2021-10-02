package com.wemccm.common.pojo;

import com.wemccm.common.entity.User;

public class UserListPojo extends User {

	private String userType;

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}
