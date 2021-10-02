package com.wemccm.cicauthorisation.dao;


import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.CICAuthorisation;
import com.wemccm.common.pojo.CICAuthorisationPojo;

@Mapper
public interface CICAuthorisationDao {

	

	public void updateCICAuthorisation(CICAuthorisationPojo requestPojo);

	public CICAuthorisation createCICAuthorisation(CICAuthorisationPojo requestPojo);
	
//		public CICAuthorisation getCICAuthorisation(CICAuthorisationPojo requestPojo);

	

}
