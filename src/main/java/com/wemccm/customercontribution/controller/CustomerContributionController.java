package com.wemccm.customercontribution.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.CustomerContribution;
import com.wemccm.common.entity.CustomerContributionAuthoris;
import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.customercontribution.service.CustomerContributionService;

@RestController
public class CustomerContributionController {
	@Autowired
	private CustomerContributionService serivce;

	@RequestMapping(value = "/updateCustomerContribution", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateCustomerContribution(@RequestBody CustomerContributionPojo requestPojo) {

		CustomerContribution cc = serivce.updateCustomerContribution(requestPojo);

		return "Success";
	}

	@RequestMapping(value = "/insertCustomerContributionAuthoris", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertCustomerContributionAuthoris(@RequestBody List<CustomerContributionAuthoris> list) {
		// insert table avoidedcostassetreplacementcosts
		serivce.insertCustomerContributionAuthoris(list);
		return "success";
	}

	@RequestMapping(value = "/CustomerContributionDetail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertCustomerContributionAuthoris(int projectId) {

		// TODO

		return null;
	}
}
