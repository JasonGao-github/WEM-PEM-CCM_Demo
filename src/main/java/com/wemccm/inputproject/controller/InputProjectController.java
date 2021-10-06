package com.wemccm.inputproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.InputProject;
import com.wemccm.common.entity.URD;
import com.wemccm.common.pojo.InputProjectPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.URDPojo;
import com.wemccm.connectionhandover.service.ConnectionHandoverService;
import com.wemccm.inputproject.service.InputProjectService;

@RestController
public class InputProjectController {

	@Autowired
	private InputProjectService serivce;

	@RequestMapping(value = "/findInputProjectYes", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public InputProjectPojo findInputProjectYes() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		
		InputProjectPojo p = serivce.findInputProjectYes(projectId);
		return p;
	}

	@RequestMapping(value = "/findInputProjectNo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public InputProjectPojo findInputProjectNo() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		
		InputProjectPojo p = serivce.findInputProjectNo(projectId);
		return p;
	}


	@RequestMapping(value = "/insertInputProject", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertInputProject(@RequestBody InputProject pojo) {

		serivce.insertInputProject(pojo);
		return new ResponseResult();
	}
	
	
	@RequestMapping(value = "/sendInputProject", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public InputProject sendInputProject() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		InputProject ip=serivce.sendInputProject(projectId);
		return ip;
	}
	
	
	
	
	
	
	
	
	


}
