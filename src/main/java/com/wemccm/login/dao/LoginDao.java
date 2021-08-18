package com.wemccm.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.User;

@Mapper
public interface LoginDao {

	public User getUserByEmail(String email);

}
