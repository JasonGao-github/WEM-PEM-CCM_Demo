package com.wemccm.customercontribution.controller;

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

import com.wemccm.common.entity.CustomerContribution;
import com.wemccm.common.entity.CustomerContributionAuthoris;
import com.wemccm.common.pojo.CustomerContributionDetailPojo;
import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.common.pojo.CustomerContributionURDPojo;
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
	
	
	@RequestMapping(value = "/CustomerContributionURD", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CustomerContributionURDPojo CustomerContributionURD() {
		Integer projectId=123;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		projectId=(int) session.getAttribute("projectId");
		CustomerContributionURDPojo result = serivce.CustomerContributionURD(projectId);

		return result;
	}
	
	
	
	
	
	
	
	
}
