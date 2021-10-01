package com.wemccm.connectionhandover.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.connectionhandover.service.ConnectionHandoverService;

@RestController
public class ConnectionHandoverController {

	@Autowired
	private ConnectionHandoverService serivce;

	@RequestMapping(value = "/insertConnectionHandover", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertConnectionHandover(@RequestBody ConnectionHandover Pojo) {
		System.out.println(Pojo.getProjectRef());
		serivce.insertConnectionHandover(Pojo);
		return new ResponseResult();
	}




	
//	@RequestMapping(value = "/listAllFIMinputType", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public List<FIMinputType> selectAllFIMinputType() {
//
//		List<FIMinputType> l = serivce.selectAllFIMinputType();
//		return l;
//	}

	
	
	
	
	
	
	
	
	
	
	
	


}
