package com.wemccm.connectionhandover.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.UplaodedFiles;
import com.wemccm.common.pojo.ConnectionHandoverPojo;
import com.wemccm.common.pojo.NegotiatedConnectionPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.connectionhandover.service.ConnectionHandoverService;

@RestController
public class ConnectionHandoverController {

	@Autowired
	private ConnectionHandoverService serivce;

	@RequestMapping(value = "/insertConnectionHandover", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertConnectionHandover(@RequestBody ConnectionHandover Pojo) {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		Pojo.setProjectId(projectId);
		serivce.insertConnectionHandover(Pojo);
		return new ResponseResult();
	}




	@RequestMapping(value = "/findConnectionHandover", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ConnectionHandoverPojo findConnectionHandover() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");

		
		ConnectionHandoverPojo p = serivce.findConnectionHandover(projectId);
		return p;
	}

	@RequestMapping(value = "/uplaodedFiles", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult uplaodedFiles(@RequestBody UplaodedFiles Pojo) {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		Pojo.setProjectId(projectId);
		serivce.uplaodedFiles(Pojo);
		return new ResponseResult();
	}
	
	@RequestMapping(value = "/downlaodedFiles", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public UplaodedFiles downlaodedFiles() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		UplaodedFiles uf=serivce.downlaodedFiles(projectId);
		return uf;
	}
	
	
	
	
	
	
	
	
	
	


}
