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

	@RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult sendMyName(@RequestBody LoginRequestPojo requestPojo) {

		String email = requestPojo.getEmail();
		String password = requestPojo.getPassword();

		// 如果成功就返回user的id，失败一个返回-1，一个返回-2；
		String s = serivce.login(email, password);
		if ("-1".equals(s)) {

			// 登录失败。。。
			return new ResponseResult(SR.REQUEST_RESULT_FAIL, SR.LOGIN_ERROR1);
		}
		if ("-2".equals(s)) {

			// 登录失败。。
			return new ResponseResult(SR.REQUEST_RESULT_FAIL, SR.LOGIN_ERROR2);
		}

		// TODO 登录成功以后用上一步返回的userid去数据库里查找这个user对象，需要根据userTypeID把对应的userType取出来。
		// TODO 取出来的东西，除了用户的密码以外，都放到session里。
		return new ResponseResult();
	}

}
