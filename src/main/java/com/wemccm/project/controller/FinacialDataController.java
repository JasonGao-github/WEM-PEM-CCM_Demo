package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.FinancialDataPojo;
import com.wemccm.project.service.CICService;

@RestController
@RequestMapping("/Financial")
public class FinacialDataController {

	@Autowired
	private CICService cicService;

	@RequestMapping(value = "/getData", produces = "application/json;charset=UTF-8")
	public FinancialDataPojo getData() {

		int projectId = getProjectIdInSession();
//		String projectStatus = getProjectStatusInSession();

//			int projectId = 1;
//			String projectStatus = "exist";

		FinancialDataPojo result = cicService.getData(projectId);
		return result;

	}

	private int getProjectIdInSession() {

		HttpSession session = getSession();

		int projectId = (int) session.getAttribute("projectId");

		System.out.println("project..." + projectId);

		return projectId;

	}

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
