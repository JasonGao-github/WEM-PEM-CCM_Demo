package com.wemccm.customercontribution.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.CustomerContribution;
import com.wemccm.common.entity.CustomerContributionAuthoris;
import com.wemccm.common.pojo.CustomerContributionDetailPojo;
import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.customercontribution.service.CustomerContributionService;

@RestController
public class CustomerContributionController {
	@Autowired
	private CustomerContributionService serivce;

	@RequestMapping(value = "/updateCustomerContribution", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult updateCustomerContribution(@RequestBody CustomerContributionPojo requestPojo) {

		CustomerContribution cc = serivce.updateCustomerContribution(requestPojo);

		return new ResponseResult();
	}

	@RequestMapping(value = "/insertCustomerContributionAuthoris", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertCustomerContributionAuthoris(@RequestBody List<CustomerContributionAuthoris> list) {
		// insert table avoidedcostassetreplacementcosts
		serivce.insertCustomerContributionAuthoris(list);
		return new ResponseResult();
	}

	@RequestMapping(value = "/CustomerContributionDetail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CustomerContributionDetailPojo CustomerContributionDetail(@RequestBody projectIdPojo requestPojo) {

		CustomerContributionDetailPojo result = serivce.CustomerContributionDetail(requestPojo);

		return result;
	}
}
