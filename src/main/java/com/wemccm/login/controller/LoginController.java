package com.wemccm.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.pojo.LoginRequestPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.util.SR;
import com.wemccm.login.service.LoginService;

@RestController
public class LoginController {

	@Autowired
	private LoginService serivce;

	@RequestMapping(value = "/loginPage", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult sendMyName(@RequestBody LoginRequestPojo requestPojo) {

		String email = requestPojo.getEmail();
		String password = requestPojo.getPassword();

		String s = serivce.login(email, password);
		if ("01".equals(s)) {
			return new ResponseResult(SR.REQUEST_RESULT_FAIL, SR.LOGIN_ERROR1);
		}
		if ("02".equals(s)) {
			return new ResponseResult(SR.REQUEST_RESULT_FAIL, SR.LOGIN_ERROR2);
		}
		return new ResponseResult();
	}

}
