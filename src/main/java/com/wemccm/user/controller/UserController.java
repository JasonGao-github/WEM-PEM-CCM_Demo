package com.wemccm.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.entity.User;
import com.wemccm.common.pojo.ChangePasswordPojo;
import com.wemccm.common.pojo.DeleteUserPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.UserListPojo;
import com.wemccm.common.pojo.UsertypePojo;
import com.wemccm.common.pojo.leaderidPojo;
import com.wemccm.common.pojo.wholeUserPojo;
import com.wemccm.user.service.UserService;

@RestController
public class UserController {

	@Autowired
	private UserService serivce;

	@RequestMapping(value = "/searchUsertype", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<wholeUserPojo> searchUsertype(@RequestBody UsertypePojo Pojo) {
		// find by usertype.`name` from table user, usertype

		String usertype = Pojo.getUsertype();
		List<wholeUserPojo> u = serivce.usertype(usertype);

		return u;

	}

	@RequestMapping(value = "/leaderid", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<User> leaderid(@RequestBody leaderidPojo Pojo) {
		// find by leaderId from table user

		int leaderid = Pojo.getLeaderid();
		List<User> u = serivce.leaderid(leaderid);

		return u;

	}

	// list all users
	@RequestMapping(value = "/listAllUsers", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult listAllUsers() {

		List<UserListPojo> list = serivce.listAllUser();

		ResponseResult rr = new ResponseResult();
		rr.setData(list);

		return rr;

	}

	// delete user
	@RequestMapping(value = "/deleteUser", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult deleteUser(@RequestBody DeleteUserPojo pojo) {

		serivce.deleteUser(pojo.getUserId());
		return new ResponseResult();

	}
	// change password

	// delete user
	@RequestMapping(value = "/changePassword", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult changePassword(@RequestBody ChangePasswordPojo pojo) {

		if (null == pojo.getUserId()) {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
					.getRequest();
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("userId");

			System.out.println("userId in session is >>> " + userId);

			pojo.setUserId(Integer.valueOf(userId));
		}
		String result = serivce.changePassword(pojo);

		if (result.equals("01")) {
			return new ResponseResult("false", "the original password is not correct!");
		}
		return new ResponseResult();

	}
}
