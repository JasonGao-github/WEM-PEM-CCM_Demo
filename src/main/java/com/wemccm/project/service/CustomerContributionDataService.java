package com.wemccm.project.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.Approver;
import com.wemccm.common.entity.Project;
import com.wemccm.common.pojo.CustomerContributionDataDetailPojo;
import com.wemccm.common.pojo.CustomerControllerDatePojo;
import com.wemccm.common.util.SR;
import com.wemccm.project.dao.ApproverDao;
import com.wemccm.project.dao.CustomerContributionDataDao;
import com.wemccm.project.dao.ProjectDao;

@Service
public class CustomerContributionDataService {

	@Autowired
	private CustomerContributionDataDao ccDao;
	@Autowired
	private ProjectDao pDao;
	@Autowired
	private ApproverDao approverDao;

	public CustomerControllerDatePojo getData(Integer projectId, String projectStatus) {

		CustomerControllerDatePojo result = new CustomerControllerDatePojo();
		result.setMassage("");
		result.setResult("success");
		result.setProjectStatus(projectStatus);
		result.setProjectId(projectId);

//		if ("new".equals(projectStatus)) {
//
//		}

		if ("exist".equals(projectStatus)) {

			CustomerContributionDataDetailPojo pojo = ccDao.getCustomerDetailsByProjectId(projectId);

			result.setProjectData(pojo);
		}

		return result;

	}

	public int saveAndupdate(CustomerControllerDatePojo pojo, String projectStatus, int projectId) {

		if ("new".equals(projectStatus)) {
			// save to project table;
			Project project = new Project();
			project.setCreateDate(new Date());
			project.setStatues(SR.PROJECT_STATUS_NEW);
			project.setVersion("0");
			pDao.addProject(project);
			int newProjectId = pDao.getNewestId();
			pojo.getProjectData().setProjectId(newProjectId);
			ccDao.saveCustomerContribution(pojo.getProjectData());

			System.out.println("******");
			createApprovers(projectId);
			return newProjectId;
		}
		if ("exist".equals(projectStatus)) {
			pojo.setProjectId(projectId);
			ccDao.updateCustomerContribution(pojo.getProjectData());
			
			System.out.println("******!!!");
			return projectId;
		}

		return 0;

	}

	private void createApprovers(Integer projectId) {

		for (int i = 1; i <= 3; i++) {

			Approver approver = new Approver();
			approver.setProjectId(projectId);
			approver.setApproverStatus("Not_Approved");
			approverDao.insertApprover(approver);

		}

	}

}
