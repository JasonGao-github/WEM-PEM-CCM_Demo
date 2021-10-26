package com.wemccm.project.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.Approver;
import com.wemccm.common.pojo.ApproverDataPojo;
import com.wemccm.project.dao.ApproverDao;

@Service
public class ApproverService {

	@Autowired
	private ApproverDao approverDao;

	public ApproverDataPojo getData(int projectId, String projectStatus) {

		ApproverDataPojo result = new ApproverDataPojo();
		result.setMassage("");
		result.setResult("success");
		result.setProjectStatus(projectStatus);
		result.setProjectId(projectId);

		List<Approver> projectData = approverDao.listApprover(projectId);
		result.setProjectData(projectData);

		return result;

	};

	public void updateApprover(ApproverDataPojo pojo) {

		List<Approver> projectData = pojo.getProjectData();

		for (Approver approver : projectData) {

			approverDao.updateApprover(approver);

		}

	}

	public void updateStatus(int id) {

		Approver approver = new Approver();

		approver.setId(id);

		approver.setApprovalDate(new Date());

		approver.setApproverStatus("Approved");

		approverDao.updateStatus(approver);

	}

}
