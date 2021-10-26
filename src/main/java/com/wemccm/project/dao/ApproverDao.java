package com.wemccm.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.Approver;
import com.wemccm.common.pojo.UpdateApproverPojo;

@Mapper
public interface ApproverDao {

	public List<Approver> listApprover(Integer projectId);

	public void insertApprover(Approver approver);

	public void updateApprover(UpdateApproverPojo approver);

	public void updateStatus(Approver approver);

}
