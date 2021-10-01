package com.wemccm.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.design;
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


	public Integer findWBSElement(projectIdPojo requestPojo) {
		Integer l = Dao.findWBSElement(requestPojo);

		return l;
	}



	public void insertDesign(design Pojo) {
		
		
		Dao.insertDesign(Pojo);
		
	}

//	public void insertFIMinputIterm(List<FIMinputIterm> pojoList) {
//		for (FIMinputIterm pojo : pojoList) {
//			Dao.insertFIMinputIterm(pojo);
//		}
//	}

}
