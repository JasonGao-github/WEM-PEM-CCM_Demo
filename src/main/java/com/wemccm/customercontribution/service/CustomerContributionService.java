package com.wemccm.customercontribution.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.CustomerContribution;
import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.customercontribution.dao.CustomerContributionDao;

@Service
public class CustomerContributionService {
	@Autowired
	private CustomerContributionDao Dao;




//		CICAuthorisation cica = Dao.getCICAuthorisation(requestPojo);




	public CustomerContribution updateCustomerContribution(CustomerContributionPojo requestPojo) {
		Dao.updateCustomerContribution(requestPojo);
		return null;
	}
}
