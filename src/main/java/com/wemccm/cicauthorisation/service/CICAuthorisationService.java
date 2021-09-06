package com.wemccm.cicauthorisation.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.cicauthorisation.dao.CICAuthorisationDao;
import com.wemccm.common.entity.CICAuthorisation;
import com.wemccm.common.pojo.CICAuthorisationPojo;

@Service
public class CICAuthorisationService {
	@Autowired
	private CICAuthorisationDao Dao;



	public CICAuthorisation createCICAuthorisation(CICAuthorisationPojo requestPojo) {
		Dao.createCICAuthorisation(requestPojo);
		return null;
	}




	public CICAuthorisation updateCICAuthorisation(CICAuthorisationPojo requestPojo) {
		Dao.updateCICAuthorisation(requestPojo);
		return null;
	}
}
