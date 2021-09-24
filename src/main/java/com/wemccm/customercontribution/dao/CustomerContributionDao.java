package com.wemccm.customercontribution.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.CustomerContributionAuthoris;
import com.wemccm.common.pojo.CustomerContributionDetailPojo;
import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.common.pojo.CustomerContributionPricePojo;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.common.pojo.projectPojo;

@Mapper
public interface CustomerContributionDao {

	public void updateCustomerContribution(CustomerContributionPojo requestPojo);

	public void insertCustomerContributionAuthoris(CustomerContributionAuthoris customerContributionAuthoris);

	public Integer getNewestId();

	public void addcustomercontribution(projectPojo pojo);

	
	
	
	
	public CustomerContributionDetailPojo findDetailPojo(projectIdPojo requestPojo);

	public List<CustomerContributionAuthoris> findCustomerContributionAuthoris(Integer customerContributionId);

	public List<CustomerContributionPricePojo> findCustomerContributionPricePojo(Integer customerContributionId);

}
