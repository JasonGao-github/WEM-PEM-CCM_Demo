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

	// TODO 根据User和UserType两个entity，编写SQL建表语句.命名成wem.sql，放在项目的resource目录下传到GitHub上。
	// TODO 用postman构造json对象，测试这个接口。如果出现bug就改。

	@Autowired
	private LoginService serivce;

	@RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
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
