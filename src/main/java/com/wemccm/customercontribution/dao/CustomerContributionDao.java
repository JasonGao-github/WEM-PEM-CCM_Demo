package com.wemccm.customercontribution.dao;


import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.pojo.CustomerContributionPojo;

@Mapper
public interface CustomerContributionDao {

	


		public void updateCustomerContribution(CustomerContributionPojo requestPojo);


	

}