package com.wemccm.project.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.Project;
import com.wemccm.common.pojo.CustomerContributionDataDetailPojo;
import com.wemccm.common.pojo.CustomerControllerDatePojo;
import com.wemccm.common.util.SR;
import com.wemccm.project.dao.CustomerContributionDataDao;
import com.wemccm.project.dao.ProjectDao;

@Service
public class CustomerContributionDataService {

	@Autowired
	private CustomerContributionDataDao ccDao;
	@Autowired
	private ProjectDao pDao;

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
			return newProjectId;
		}
		if ("exist".equals(projectStatus)) {
			pojo.setProjectId(projectId);
			ccDao.updateCustomerContribution(pojo.getProjectData());
			return projectId;
		}
		return 0;

	}

}
