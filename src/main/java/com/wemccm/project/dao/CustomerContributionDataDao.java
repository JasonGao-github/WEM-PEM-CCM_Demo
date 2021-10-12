package com.wemccm.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.pojo.CustomerContributionDataDetailPojo;

@Mapper
public interface CustomerContributionDataDao {

	public void saveCustomerContribution(CustomerContributionDataDetailPojo pojo);

	public void updateCustomerContribution(CustomerContributionDataDetailPojo pojo);

	public CustomerContributionDataDetailPojo getCustomerDetailsByProjectId(int projectId);

}
