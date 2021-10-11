package com.wemccm.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.LoginRequestPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.wholeUserPojo;
import com.wemccm.common.util.SR;
import com.wemccm.login.service.LoginService;

@RestController
public class LoginController {

	@Autowired
	private LoginService serivce;

	@RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult sendMyName(@RequestBody LoginRequestPojo requestPojo) {

		// find by email
		String email = requestPojo.getEmail();
		String password = requestPojo.getPassword();

		String s = serivce.login(email, password);
		if ("-1".equals(s)) {

			return new ResponseResult(SR.REQUEST_RESULT_FAIL, SR.LOGIN_ERROR1);
		}
		if ("-2".equals(s)) {

			return new ResponseResult(SR.REQUEST_RESULT_FAIL, SR.LOGIN_ERROR2);
		}

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		int id = Integer.valueOf(s);
		wholeUserPojo wu = serivce.getWholeUser(id);

		session.setAttribute("userId", wu.getId());
		session.setAttribute("email", wu.getEmail());
		session.setAttribute("userTypeId", wu.getUserTypeId());
		session.setAttribute("userType", wu.getUserType());
		session.setAttribute("firstName", wu.getFirstName());
		session.setAttribute("lastName", wu.getLastName());
		return new ResponseResult();

	}

}
