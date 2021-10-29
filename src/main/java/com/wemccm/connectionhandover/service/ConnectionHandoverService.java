package com.wemccm.connectionhandover.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.UplaodedFiles;
import com.wemccm.common.pojo.ConnectionHandoverPojo;
import com.wemccm.common.pojo.DownlaodedFilesPojo;
import com.wemccm.connectionhandover.dao.ConnectionHandoverDao;

@Service
public class ConnectionHandoverService {

	@Autowired
	private ConnectionHandoverDao Dao;


	public void insertConnectionHandover(ConnectionHandover pojo) {
		Dao.insertConnectionHandover(pojo);
		
	}



	public ConnectionHandoverPojo findConnectionHandover(Integer projectId) {
		ConnectionHandoverPojo p=Dao.findConnectionHandover(projectId);
		
		return p;
	}



	public void uplaodedFiles(UplaodedFiles pojo) {
		Dao.uplaodedFiles(pojo);
		
	}



	public List<UplaodedFiles> downlaodedFiles(DownlaodedFilesPojo pojo) {
		List<UplaodedFiles> p=Dao.downlaodedFiles(pojo);
		
		return p;
	}



}
