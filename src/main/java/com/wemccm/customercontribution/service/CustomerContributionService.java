package com.wemccm.customercontribution.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.CustomerContribution;
import com.wemccm.common.entity.CustomerContributionAuthoris;
import com.wemccm.common.pojo.CustomerContributionDetailPojo;
import com.wemccm.common.pojo.CustomerContributionPojo;
import com.wemccm.common.pojo.CustomerContributionPricePojo;
import com.wemccm.common.pojo.CustomerContributionURDPojo;
import com.wemccm.common.pojo.projectIdPojo;
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

	public void insertCustomerContributionAuthoris(List<CustomerContributionAuthoris> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertCustomerContributionAuthoris(list.get(i));

		}
	}

	public CustomerContributionDetailPojo CustomerContributionDetail(projectIdPojo requestPojo) {
		CustomerContributionDetailPojo p=Dao.findDetailPojo(requestPojo);

			List<CustomerContributionAuthoris> a=Dao.findCustomerContributionAuthoris(p.getCustomerContributionId());
			p.setAuthorList(a); 
			
			
			List<CustomerContributionPricePojo> pp=Dao.findCustomerContributionPricePojo(p.getCustomerContributionId());
			p.setPriceList(pp); 


		return p;
	}

	public CustomerContributionURDPojo CustomerContributionURD(Integer projectId) {
//		Boolean b=Dao.JENOverheadsBuildUpB23(projectId);
//		CustomerContributionURDPojo result;
//		if(b==true){
//			result.setScope("The services listed below must be performed by Jemena and in accordance with the Conditions of this contract./n"+
//					"• Design review and approval./n"+
//					"• Project management./n"+
//					"• Final audit and inspection./n"+
//					"• Co-ordination of access to the network.");
//			
//			result.setAssumptions("None");
//		}else {
//		result = Dao.CustomerContributionURD(projectId);
//		}
//		return result;
		return null;
	}
}
