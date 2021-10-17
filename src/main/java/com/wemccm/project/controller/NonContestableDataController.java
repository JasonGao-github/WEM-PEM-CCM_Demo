package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.pojo.AllNonContestableOtherCostsPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsDataPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemTypeDataPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentTypeDataPojo;
import com.wemccm.common.pojo.ProjectBasicPojo;
import com.wemccm.common.pojo.ProjectNonContestableProjectComponentData;
import com.wemccm.project.service.FIMInputDataService;
import com.wemccm.project.service.NonContestableDataService;

	@RestController
	@RequestMapping("/NonContestable")
	public class NonContestableDataController {

		@Autowired
		private NonContestableDataService qiService;

		@RequestMapping(value = "/getDataNonContestableOtherCostsIterm", produces = "application/json;charset=UTF-8")
		public NonContestableOtherCostsItemTypeDataPojo getDataNonContestableOtherCostsIterm() {

//			int projectId = getProjectIdInSession();
//			String projectStatus = getProjectStatusInSession();

			int projectId = 1;
			String projectStatus = "exist";

			NonContestableOtherCostsItemTypeDataPojo resultPojo = qiService.getDataNonContestableOtherCostsIterm(projectId, projectStatus);

			return resultPojo;

		}

		@RequestMapping(value = "/saveAndUpdateNonContestableOtherCostsIterm", produces = "application/json;charset=UTF-8")
		public ProjectBasicPojo saveAndUpdateNonContestableOtherCostsIterm(@RequestBody NonContestableOtherCostsDataPojo pojo) {

//			int projectId = getProjectIdInSession();
			int projectId = 2;
			pojo.setProjectId(projectId);
			qiService.saveAndUpdateNonContestableOtherCostsIterm(pojo);

			updateSession(projectId);

			ProjectBasicPojo result = new ProjectBasicPojo();
			result.setResult("success");
			return result;

		}

		
		@RequestMapping(value = "/getDataNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
		public NonContestableProjectComponentTypeDataPojo getDataNonContestableProjectComponent() {

//			int projectId = getProjectIdInSession();
//			String projectStatus = getProjectStatusInSession();

			int projectId = 1;
			String projectStatus = "exist";

			NonContestableProjectComponentTypeDataPojo resultPojo = qiService.getDataNonContestableProjectComponent(projectId, projectStatus);

			return resultPojo;

		}

		@RequestMapping(value = "/saveAndUpdateNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
		public ProjectBasicPojo saveAndUpdateNonContestableProjectComponent(@RequestBody ProjectNonContestableProjectComponentData pojo) {

//			int projectId = getProjectIdInSession();
			int projectId = 1;
			pojo.setProjectId(projectId);

			qiService.saveAndUpdateNonContestableProjectComponent(pojo);

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

