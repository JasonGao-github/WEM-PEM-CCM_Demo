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

	@RequestMapping(value = "/loginPage", produces = "application/json;charset=UTF-8")
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
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		int id = Integer.valueOf(s);
		wholeUserPojo wu = serivce.getWholeUser(id);

		session.setAttribute("id", wu.getId());
		session.setAttribute("username", wu.getUsername());
		session.setAttribute("email", wu.getEmail());
		session.setAttribute("userTypeId", wu.getUserTypeId());
		session.setAttribute("leaderId", wu.getLeaderId());
		session.setAttribute("name", wu.getName());

		System.out.println("name" + wu.getName());

		return new ResponseResult();

	}

}
