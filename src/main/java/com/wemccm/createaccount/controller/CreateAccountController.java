package com.wemccm.createaccount.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.pojo.CreateAccountRequestPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.util.SR;
import com.wemccm.createaccount.service.CreateAccountService;

@RestController
public class CreateAccountController {

	@Autowired
	private CreateAccountService serivce;

	@RequestMapping(value = "/create", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult createAccount(@RequestBody CreateAccountRequestPojo requestPojo) {

		String email = requestPojo.getEmail();
		String password = requestPojo.getPassword();
		String firstname = requestPojo.getFirstname();
		Integer userTypeId = requestPojo.getUserTypeId();
		String lastname = requestPojo.getLastname();
		
		String s = serivce.CreateAccount(email, password,firstname,userTypeId,lastname);
		if ("01".equals(s)) {
			return new ResponseResult(SR.REQUEST_RESULT_FAIL, SR.CreateAccount_ERROR1);
		}
		return new ResponseResult();
	}
}
