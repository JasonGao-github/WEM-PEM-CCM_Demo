package com.wemccm.cc.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.cc.dao.ccDao;
import com.wemccm.common.entity.CustomerContribution;
import com.wemccm.common.pojo.CustomerContributionPojo;

@Service
public class ccService {
	@Autowired
	private ccDao Dao;




//		CICAuthorisation cica = Dao.getCICAuthorisation(requestPojo);




	public CustomerContribution updateCustomerContribution(CustomerContributionPojo requestPojo) {
		Dao.updateCustomerContribution(requestPojo);
		return null;
	}
}
