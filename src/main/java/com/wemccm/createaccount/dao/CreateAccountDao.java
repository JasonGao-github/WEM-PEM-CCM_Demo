package com.wemccm.createaccount.dao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.wemccm.common.entity.User;


	@Mapper
	public interface CreateAccountDao {

		public User getUserByEmail(String email);


		public void createUserByEmail(
				@Param("0")String email, 
				@Param("1")String password, 
				@Param("2")String username, 
				@Param("3")Integer userTypeId,
				@Param("4")Integer leaderId);


		public void createUserByEmail(
				@Param("0")String email, 
				@Param("1")String password, 
				@Param("2")String firstname, 
				@Param("3")Integer userTypeId,
				@Param("4")String lastname);

		
		
	}


