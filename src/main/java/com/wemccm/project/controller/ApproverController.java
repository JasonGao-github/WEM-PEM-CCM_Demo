package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.ApproverDataPojo;
import com.wemccm.common.pojo.ProjectBasicPojo;
import com.wemccm.common.pojo.UpdateApproverPojo;
import com.wemccm.common.pojo.UpdateApproverStatusPojo;
import com.wemccm.project.service.ApproverService;


@RestController
@RequestMapping("/Approver")
public class ApproverController {

	@Autowired
	private ApproverService approverService;

	@RequestMapping(value = "/getData", produces = "application/json;charset=UTF-8")
	public ApproverDataPojo getData() {

		int projectId = getProjectIdInSession();
		String projectStatus = getProjectStatusInSession();

//		int projectId = 1;
//		String projectStatus = "exist";

		ApproverDataPojo pojo = approverService.getData(projectId, projectStatus);

		return pojo;

	}

	@RequestMapping(value = "/updateApprover", produces = "application/json;charset=UTF-8")
	public ProjectBasicPojo updateApprover(@RequestBody UpdateApproverPojo pojo) {

		int projectId = getProjectIdInSession();
//		String projectStatus = getProjectStatusInSession();

//		int projectId = 1;
//		String projectStatus = "exist";

		approverService.updateApprover(pojo);

		ProjectBasicPojo result = new ProjectBasicPojo();
		result.setProjectId(projectId);
		result.setResult("success");

		return result;

	}

	@RequestMapping(value = "/updateStatus", produces = "application/json;charset=UTF-8")
	public ProjectBasicPojo updateStatus(@RequestBody UpdateApproverStatusPojo pojo) {

//		int projectId = getProjectIdInSession();

		approverService.updateStatus(pojo.getApproverId());

		ProjectBasicPojo result = new ProjectBasicPojo();
//		result.setProjectId(projectId);
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
