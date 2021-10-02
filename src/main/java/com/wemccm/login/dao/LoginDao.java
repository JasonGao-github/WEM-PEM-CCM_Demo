package com.wemccm.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.User;
import com.wemccm.common.pojo.wholeUserPojo;

@Mapper
public interface LoginDao {

	public User getUserByEmail(String email);


	public wholeUserPojo getWholeUser(int id);

}
