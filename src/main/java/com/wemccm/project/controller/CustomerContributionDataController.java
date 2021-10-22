package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.CustomerControllerDatePojo;
import com.wemccm.common.pojo.ProjectBasicPojo;
import com.wemccm.project.service.CustomerContributionDataService;

@RestController
@RequestMapping("/customer_contribution")
public class CustomerContributionDataController {
	////

	@Autowired
	private CustomerContributionDataService service;

	@RequestMapping(value = "/getData", produces = "application/json;charset=UTF-8")
	public CustomerControllerDatePojo getData() {

		int projectId = getProjectIdInSession();
		String projectStatus = getProjectStatusInSession();

//		int projectId = 1;
//		String projectStatus = "exist";

		CustomerControllerDatePojo pojo = service.getData(projectId, projectStatus);

		return pojo;

	}

//
	@RequestMapping(value = "/saveAndUpdate", produces = "application/json;charset=UTF-8")
	public ProjectBasicPojo saveAndUpdate(@RequestBody CustomerControllerDatePojo pojo) {

		int projectId = getProjectIdInSession();

		String projectStatus = getProjectStatusInSession();

//		int projectId = 1;
//		String projectStatus = "new";

		pojo.setProjectId(projectId);

		int newProjectId = service.saveAndupdate(pojo, projectStatus, projectId);

		updateSession(newProjectId);

		ProjectBasicPojo result = new ProjectBasicPojo();
		result.setProjectId(projectId);
		result.setResult("success");
		return result;

	}

	private int getProjectIdInSession() {

		HttpSession session = getSession();

		return (int) session.getAttribute("projectId");

	}//

	private String getProjectStatusInSession() {

		HttpSession session = getSession();

		return (String) session.getAttribute("projectStatus");
	}

	private void updateSession(int projectId) {

		HttpSession session = getSession();
		session.setAttribute("projectId", projectId);
		session.setAttribute("projectStatus", "exist");

	}

	private HttpSession getSession() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		return session;

	}

}
