package com.wemccm.contractschedule.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.NegotiatedConnection;
import com.wemccm.common.entity.URD;
import com.wemccm.common.pojo.NegotiatedConnectionPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.URDPojo;
import com.wemccm.contractschedule.service.ContractScheduleService;

@RestController
public class ContractScheduleController {

	@Autowired
	private ContractScheduleService serivce;

	@RequestMapping(value = "/findNegotiatedConnection", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public NegotiatedConnectionPojo findNegotiatedConnection() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		
		NegotiatedConnectionPojo p = serivce.findNegotiatedConnection(projectId);
		return p;
	}



	@RequestMapping(value = "/insertNegotiatedConnection", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertNegotiatedConnection(@RequestBody NegotiatedConnection pojo) {

		serivce.insertNegotiatedConnection(pojo);
		return new ResponseResult();
	}

	
	
	
	@RequestMapping(value = "/findURD", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public URDPojo findURD() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		
		URDPojo p = serivce.findURD(projectId);
		return p;
	}



	@RequestMapping(value = "/insertURD", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertURD(@RequestBody URD pojo) {

		serivce.insertURD(pojo);
		return new ResponseResult();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
