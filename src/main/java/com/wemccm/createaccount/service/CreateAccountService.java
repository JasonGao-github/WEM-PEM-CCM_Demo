package com.wemccm.createaccount.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.User;
import com.wemccm.createaccount.dao.CreateAccountDao;


	@Service
	public class CreateAccountService {

		@Autowired
		private CreateAccountDao Dao;
		



		public String CreateAccount(String email, String password, String username, Integer userTypeId,
				Integer leaderId) {
			
			
			User u = Dao.getUserByEmail(email);
			if (null != u) {

				System.out.println(u.getPassword()+"++++++++++++++++++++++++++"+u.getEmail());
				return "01";
			}
			
			Dao.createUserByEmail(email,password,username,userTypeId,leaderId);


			return "00";
		}



	}

