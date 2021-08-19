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

	// TODO wem.sql穿上来了么？项目里我没找到。
	// TODO 仿照LoginCountroller开发添加账号的接口，Service和Dao的类自己添加，注意命名。
	// TODO 用postman测试这个接口。如果出现bug就改。
	// TODO 明天晚上开会之前做完我来review。
	
	@Autowired
	private CreateAccountService serivce;

	@RequestMapping(value = "/create", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult createAccount(@RequestBody CreateAccountRequestPojo requestPojo) {

		String email = requestPojo.getEmail();
		String password = requestPojo.getPassword();
		String username = requestPojo.getUsername();
		Integer userTypeId = requestPojo.getUserTypeId();
		Integer leaderId = requestPojo.getLeaderId();
		
		
		
		
		String s = serivce.CreateAccount(email, password,username,userTypeId,leaderId);
		if ("01".equals(s)) {
			return new ResponseResult(SR.REQUEST_RESULT_FAIL, SR.CreateAccount_ERROR1);
		}
		return new ResponseResult();
	}
}
