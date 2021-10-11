package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.ProjectBasicPojo;
import com.wemccm.common.pojo.QuantityInputGetdataPojo;
import com.wemccm.common.pojo.QuantityInputSaveAndUpdatePojo;
import com.wemccm.project.service.QuantityInputDataService;

@RestController
@RequestMapping("/quantity_input")
public class QuantityInputDataController {

	@Autowired
	private QuantityInputDataService qiService;

	@RequestMapping(value = "/getData", produces = "application/json;charset=UTF-8")
	public QuantityInputGetdataPojo getData() {

		int projectId = getProjectIdInSession();

		String projectStatus = getProjectStatusInSession();
//		int projectId = 1;
//		String projectStatus = "new";

		QuantityInputGetdataPojo resultPojo = qiService.getData(projectId, projectStatus);

		return resultPojo;

	}

	@RequestMapping(value = "/saveAndUpdate", produces = "application/json;charset=UTF-8")
	public ProjectBasicPojo saveAndUpdate(@RequestBody QuantityInputSaveAndUpdatePojo pojo) {

		int projectId = getProjectIdInSession();

		pojo.setProjectId(projectId);

		qiService.saveAndUpdate(pojo);

		ProjectBasicPojo result = new ProjectBasicPojo();
		result.setResult("success");
		return result;

	}

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
