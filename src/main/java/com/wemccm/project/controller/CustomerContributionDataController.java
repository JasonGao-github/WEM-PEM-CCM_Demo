package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.ProjectBasicPojo;
import com.wemccm.common.pojo.QuantityInputGetdataPojo;
import com.wemccm.common.pojo.QuantityInputSaveAndUpdatePojo;

@RestController
@RequestMapping("/customer_contribution")
public class CustomerContributionDataController {

//	@RequestMapping(value = "/getData", produces = "application/json;charset=UTF-8")
//	public QuantityInputGetdataPojo getData() {
//
//	}
//
//	@RequestMapping(value = "/saveAndUpdate", produces = "application/json;charset=UTF-8")
//	public ProjectBasicPojo saveAndUpdate(@RequestBody QuantityInputSaveAndUpdatePojo pojo) {
//
//	}

	private int getProjectIdInSession() {

		HttpSession session = getSession();

		return Integer.valueOf((String) session.getAttribute("projectId"));

	}

	private String getProjectStatusInSession() {

		HttpSession session = getSession();

		return (String) session.getAttribute("projectStatus");
	}

	private HttpSession getSession() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		return session;

	}

}
