package com.wemccm.contractschedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.AssetRelocation;
import com.wemccm.common.entity.FIMinputIterm;
import com.wemccm.common.entity.FIMinputSubType;
import com.wemccm.common.entity.FIMinputType;
import com.wemccm.common.entity.NegotiatedConnection;
import com.wemccm.common.entity.URD;
import com.wemccm.common.pojo.AssetRelocationPojo;
import com.wemccm.common.pojo.FIMinputItermPojo;
import com.wemccm.common.pojo.FIMinputItermQuantityPojo;
import com.wemccm.common.pojo.FIMinputSubTypePojo;
import com.wemccm.common.pojo.NegotiatedConnectionPojo;
import com.wemccm.common.pojo.URDPojo;
import com.wemccm.contractschedule.dao.ContractScheduleDao;

@Service
public class ContractScheduleService {

	@Autowired
	private ContractScheduleDao Dao;




	public NegotiatedConnectionPojo findNegotiatedConnection(Integer projectId) {
		NegotiatedConnectionPojo l = Dao.findNCinCC(projectId);
		if(l!=null) {
		l.setJemenaResponsibleOfficer("?????????????");
		}
		return l;
	}


	public void insertNegotiatedConnection(NegotiatedConnection pojo) {
		Dao.insertNegotiatedConnection(pojo);
	}


	public URDPojo findURD(Integer projectId) {
		URDPojo l = Dao.findURDinCC(projectId);
		if(l!=null) {
		l.setJemenaResponsibleOfficer("?????????????");
		}
		return l;
	}


	public void insertURD(URD pojo) {
		Dao.insertURD(pojo);
	}


	public AssetRelocationPojo findAssetRelocation(Integer projectId) {
		AssetRelocationPojo l = Dao.findARinCC(projectId);
		if(l!=null) {
		l.setContestableContributionChargesforWorksCompletedbyJemena("?????????????");
		l.setNonContestableContributionChargesforWorksCompletedbyJemena("?????????????");
		l.setJemenaResponsibleOfficer("?????????????");
		}
		return l;
	}


	public void insertAssetRelocation(AssetRelocation pojo) {
		Dao.insertAssetRelocation(pojo);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
