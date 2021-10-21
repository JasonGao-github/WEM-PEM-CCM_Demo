package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsDataPojo;
import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.common.pojo.ProjectBasicPojo;
import com.wemccm.project.service.AvoidedCostDataService;
import com.wemccm.project.service.FIMInputDataService;


	@RestController
	@RequestMapping("/AvoidedCost")
	public class AvoidedCostDataController {

		@Autowired
		private AvoidedCostDataService qiService;

		@RequestMapping(value = "/getData", produces = "application/json;charset=UTF-8")
		public AvoidedCostassetReplacementItermDataPojo getData() {

			int projectId = getProjectIdInSession();
			String projectStatus = getProjectStatusInSession();

//			int projectId = 1;
//			String projectStatus = "exist";

			AvoidedCostassetReplacementItermDataPojo resultPojo = qiService.getData(projectId, projectStatus);

			return resultPojo;

		}

		@RequestMapping(value = "/saveAndUpdate", produces = "application/json;charset=UTF-8")
		public ProjectBasicPojo saveAndUpdate(@RequestBody AvoidedCostAssetReplacementCostsDataPojo pojo) {

			int projectId = getProjectIdInSession();
//			int projectId = 1;
			pojo.setProjectId(projectId);

			qiService.saveAndUpdate(pojo);

			updateSession(projectId);

			ProjectBasicPojo result = new ProjectBasicPojo();
			result.setResult("success");
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
