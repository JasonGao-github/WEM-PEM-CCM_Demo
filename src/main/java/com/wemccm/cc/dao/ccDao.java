package com.wemccm.cc.dao;


import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.pojo.CustomerContributionPojo;

@Mapper
public interface ccDao {

	


		public void updateCustomerContribution(CustomerContributionPojo requestPojo);


	

}
