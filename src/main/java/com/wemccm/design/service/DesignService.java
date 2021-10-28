package com.wemccm.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.Design;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.design.dao.DesignDao;

@Service
public class DesignService {

	@Autowired
	private DesignDao Dao;



//	public List<FIMinputItermQuantityType> selectAllFIMinputItermQuantityType() {
//		List<FIMinputItermQuantityType> l = Dao.selectAllFIMinputItermQuantityType();
//
//		return l;
//	}


	public String findWBSElement(projectIdPojo requestPojo) {
		String l = Dao.findWBSElement(requestPojo);

		return l;
	}



	public void insertDesign(Design Pojo) {
		
		
		Dao.insertDesign(Pojo);
		
	}

//	public void insertFIMinputIterm(List<FIMinputIterm> pojoList) {
//		for (FIMinputIterm pojo : pojoList) {
//			Dao.insertFIMinputIterm(pojo);
//		}
//	}

}
