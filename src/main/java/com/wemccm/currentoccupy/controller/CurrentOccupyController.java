package com.wemccm.currentoccupy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.CurrentOccupy;
import com.wemccm.common.pojo.CurrentOccupyPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.currentoccupy.service.CurrentOccupyService;

@RestController
public class CurrentOccupyController {


	
	@Autowired
	private CurrentOccupyService serivce;

	@RequestMapping(value = "/createCurrentOccupy", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult createCurrentOccupy(@RequestBody CurrentOccupyPojo requestPojo) {

		Integer pid = requestPojo.getProjectId();
		Integer uid = requestPojo.getUserId();
		
		
		String s = serivce.createCurrentOccupy(pid, uid);
		return new ResponseResult();
	}
	

	@RequestMapping(value = "/findCurrentOccupy", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult findCurrentOccupy(@RequestBody CurrentOccupyPojo requestPojo) {

		Integer pid = requestPojo.getProjectId();
		
		
		CurrentOccupy oc = serivce.findCurrentOccupy(pid);
//		System.out.println(oc.getProjectId()+"   uid: "+oc.getUserId());
		return new ResponseResult();
	}
	
	
	@RequestMapping(value = "/deleteCurrentOccupy", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult deleteCurrentOccupy(@RequestBody CurrentOccupyPojo requestPojo) {

		Integer pid = requestPojo.getProjectId();
		Integer uid = requestPojo.getUserId();
		
		
		serivce.deleteCurrentOccupy(pid,uid);
		return new ResponseResult();
	}
}
