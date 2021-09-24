package com.wemccm.customercontribution.dao;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.CustomerContributionAuthoris;
import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.common.pojo.projectPojo;

@Mapper
public interface CustomerContributionDao {

	public void updateCustomerContribution(CustomerContributionPojo requestPojo);

	public void insertCustomerContributionAuthoris(CustomerContributionAuthoris customerContributionAuthoris);

	public Integer getNewestId();

	public void addcustomercontribution(projectPojo pojo);

}
