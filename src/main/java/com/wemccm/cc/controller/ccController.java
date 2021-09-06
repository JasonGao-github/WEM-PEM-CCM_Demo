package com.wemccm.cc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.cc.service.ccService;
import com.wemccm.common.entity.CustomerContribution;

@RestController
public class ccController {
	@Autowired
	private ccService serivce;


	

	
	@RequestMapping(value = "/updateCustomerContribution", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CustomerContribution updateCustomerContribution(@RequestBody CustomerContributionPojo requestPojo) {

		CustomerContribution cc=serivce.updateCustomerContribution(requestPojo);

		return cc;
	}
}
