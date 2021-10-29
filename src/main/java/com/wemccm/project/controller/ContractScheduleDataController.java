package com.wemccm.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.entity.URD;
import com.wemccm.common.pojo.AssetRelocationData;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsDataPojo;
import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.common.pojo.FIMinputItermSubTypeTypeDataPojo;
import com.wemccm.common.pojo.NegotiatedConnectionData;
import com.wemccm.common.pojo.ProjectBasicPojo;
import com.wemccm.common.pojo.URDData;
import com.wemccm.project.service.AvoidedCostDataService;
import com.wemccm.project.service.ContractScheduleDataService;
import com.wemccm.project.service.FIMInputDataService;


	@RestController
	@RequestMapping("/ContractSchedule")
	public class ContractScheduleDataController {

		@Autowired
		private ContractScheduleDataService qiService;

		@RequestMapping(value = "/getNegotiatedConnectionData", produces = "application/json;charset=UTF-8")
		public NegotiatedConnectionData getNegotiatedConnectionData() {

			int projectId = getProjectIdInSession();
			String projectStatus = getProjectStatusInSession();

//			int projectId = 1;
//			String projectStatus = "exist";

			System.out.println("projectStatus"+projectStatus);
			NegotiatedConnectionData resultPojo = qiService.getNegotiatedConnectionData(projectId, projectStatus);

			return resultPojo;

		}

		@RequestMapping(value = "/saveAndUpdateNegotiatedConnection", produces = "application/json;charset=UTF-8")
		public ProjectBasicPojo saveAndUpdateNegotiatedConnection(@RequestBody NegotiatedConnectionData pojo) {

			int projectId = getProjectIdInSession();
//			int projectId = 1;
			pojo.setProjectId(projectId);
			String projectStatus = getProjectStatusInSession();
			pojo.setProjectStatus(projectStatus);
			
			System.out.println("projectStatus"+projectStatus);
			
			
			
			qiService.saveAndUpdateNegotiatedConnection(pojo);

			updateSession(projectId);

			ProjectBasicPojo result = new ProjectBasicPojo();
			result.setResult("success");
			return result;

		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		@RequestMapping(value = "/getURD", produces = "application/json;charset=UTF-8")
		public URDData getURD() {

			int projectId = getProjectIdInSession();
			String projectStatus = getProjectStatusInSession();

//			int projectId = 1;
//			String projectStatus = "exist";
			System.out.println("projectStatus"+projectStatus);
			URDData resultPojo = qiService.getURD(projectId, projectStatus);

			return resultPojo;

		}

		@RequestMapping(value = "/saveAndUpdateURD", produces = "application/json;charset=UTF-8")
		public ProjectBasicPojo saveAndUpdateURD(@RequestBody URDData pojo) {
//			int projectId = 1;
			
			int projectId = getProjectIdInSession();
			pojo.setProjectId(projectId);
			
			String projectStatus = getProjectStatusInSession();
			pojo.setProjectStatus(projectStatus);
			
//			URD urd=pojo.getProjectData();
//			System.out.println(urd);
//			System.out.println(urd.getInquiryNumber());

			System.out.println("projectStatus"+projectStatus);
			qiService.saveAndUpdateURD(pojo);

			updateSession(projectId);

			ProjectBasicPojo result = new ProjectBasicPojo();
			result.setResult("success");
			return result;

		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		@RequestMapping(value = "/getAssetRelocation", produces = "application/json;charset=UTF-8")
		public AssetRelocationData getAssetRelocation() {

			int projectId = getProjectIdInSession();
			String projectStatus = getProjectStatusInSession();

//			int projectId = 1;
//			String projectStatus = "exist";

			System.out.println("projectStatus"+projectStatus);
			AssetRelocationData resultPojo = qiService.getAssetRelocation(projectId, projectStatus);

			return resultPojo;

		}

		@RequestMapping(value = "/saveAndUpdateAssetRelocation", produces = "application/json;charset=UTF-8")
		public ProjectBasicPojo saveAndUpdateAssetRelocation(@RequestBody AssetRelocationData pojo) {
			System.out.println("saveAndUpdateAssetRelocation");
			System.out.println("saveAndUpdateAssetRelocation"+pojo.getProjectData().getInquiryNumber());
			System.out.println("saveAndUpdateAssetRelocation"+pojo.getProjectData().getWorksAddress());

			int projectId = getProjectIdInSession();
//			int projectId = 1;
			pojo.setProjectId(projectId);
			String projectStatus = getProjectStatusInSession();
			pojo.setProjectStatus(projectStatus);

			System.out.println("saveAndUpdateAssetRelocation"+"projectStatus"+projectStatus);
			qiService.saveAndUpdateAssetRelocation(pojo);

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
