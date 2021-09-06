package com.wemccm.CustomerContribution.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.CustomerContribution.dao.CustomerContributionDao;
import com.wemccm.common.entity.CustomerContribution;
import com.wemccm.common.pojo.CustomerContributionPojo;

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
