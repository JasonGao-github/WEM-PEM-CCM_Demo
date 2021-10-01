package com.wemccm.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.User;
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
	public List<UserListPojo> listAllUsers() {

		List<UserListPojo> list = serivce.listAllUser();

		return list;

	}

	// delete user
	@RequestMapping(value = "/deleteUser", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult deleteUser(@RequestBody DeleteUserPojo pojo) {

		serivce.deleteUser(pojo.getUserId());
		return new ResponseResult();

	}
	// change password
}
