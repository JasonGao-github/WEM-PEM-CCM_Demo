package com.wemccm.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.CICprojectDetails;
import com.wemccm.common.entity.CICprojectEstimate;
import com.wemccm.common.entity.CICprojectTask;

@Mapper
public interface CICDao {
	//

	public void saveCICprojectEstimate(CICprojectEstimate cicProjectEstimate);

	public void saveCICprojectDetails(CICprojectDetails cicProjectDetails);

	public int getsaveCICprojectEstimateNewestId();

	public int getCICprojectDetailsNewestId();

	public void updateCICprojectEstimate(CICprojectEstimate cicprojectEstimate);

	public void updateCICprojectDetails(CICprojectDetails cicprojectDetails);

	public int getCICProjectDetailsId(int projectId);

	public List<CICprojectTask> listAllTask();

	public CICprojectDetails getDetailByProjectId(int projectId);// TODO

	public CICprojectEstimate getEstimate(int cicProjectTaskId, int cicProjectDetailsId);// TODO

	public double caculateProjectManagementDesignLabour1(int projectId);

	public double caculateProjectManagementDesignLabour2(int projectId);

	public double caculateProjectManagementDesignLabour3(int projectId);

	public double caculateProjectManagementMaterials1(int projectId);

	public double caculateProjectManagementMaterials2(int projectId);

	public double caculateProjectManagementPlant1(int projectId);

	public double caculateProjectManagementPlant2(int projectId);

	public double caculateProjectManagementContracts1(int projectId);

	public double caculateProjectManagementContracts2(int projectId);

	public double caculateProjectManagementContracts3(int projectId);

}
