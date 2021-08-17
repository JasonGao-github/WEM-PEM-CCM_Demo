package com.wemccm.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.User;

@Mapper
public interface ILoginDao {

	public User getUserByEmail(String email);

}
