package com.wemccm.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.CICprojectEstimate;
import com.wemccm.common.entity.CICprojectTask;
import com.wemccm.common.pojo.CICProjectEstimateDataPojo;
import com.wemccm.common.pojo.CICProjectEstimatePojo;
import com.wemccm.common.pojo.FinancialDataPojo;
import com.wemccm.project.dao.CICDao;

@Service
public class CICService {
	//

	@Autowired
	private CICDao cicDao;

	public FinancialDataPojo getData(int projectId) {

		FinancialDataPojo result = new FinancialDataPojo();
		result.setProjectId(projectId);
		result.setProjectStatus("exist");
		result.setResult("success");

		CICProjectEstimatePojo projectData = new CICProjectEstimatePojo();

		String webElement = cicDao.getDetailByProjectId(projectId).getWbsElements();
		projectData.setWbsElement(webElement);

		List<CICProjectEstimateDataPojo> pojoList = new ArrayList<CICProjectEstimateDataPojo>();

		List<CICprojectTask> taskList = cicDao.listAllTask();
		for (CICprojectTask ciCprojectTask : taskList) {

			CICProjectEstimateDataPojo pojo = new CICProjectEstimateDataPojo();
			pojo.setTaskName(ciCprojectTask.getName());

			CICprojectEstimate estimate = cicDao.getEstimate(ciCprojectTask.getId(), projectId);
			pojo.setEstimate(estimate);

			pojoList.add(pojo);

		}

		projectData.setPojoList(pojoList);
		result.setProjectData(projectData);
		return result;

	}

}
