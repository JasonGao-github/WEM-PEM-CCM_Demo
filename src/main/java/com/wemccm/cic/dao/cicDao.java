package com.wemccm.cic.dao;


import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.pojo.CICAuthorisationPojo;

@Mapper
public interface cicDao {

	

	public void updateCICAuthorisation(CICAuthorisationPojo requestPojo);

	public void createCICAuthorisation(CICAuthorisationPojo requestPojo);
	
//		public CICAuthorisation getCICAuthorisation(CICAuthorisationPojo requestPojo);

	

}
