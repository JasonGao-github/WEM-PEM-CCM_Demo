package com.wemccm.connectionhandover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.connectionhandover.dao.ConnectionHandoverDao;

@Service
public class ConnectionHandoverService {

	@Autowired
	private ConnectionHandoverDao Dao;



//	public List<FIMinputItermQuantityType> selectAllFIMinputItermQuantityType() {
//		List<FIMinputItermQuantityType> l = Dao.selectAllFIMinputItermQuantityType();
//
//		return l;
//	}






	public void insertConnectionHandover(ConnectionHandover pojo) {
		Dao.insertConnectionHandover(pojo);
		
	}



}
