package com.wemccm.inputproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.InputProject;
import com.wemccm.common.pojo.InputProjectPojo;
import com.wemccm.connectionhandover.dao.ConnectionHandoverDao;
import com.wemccm.inputproject.dao.InputProjectDao;

@Service
public class InputProjectService {

	@Autowired
	private InputProjectDao Dao;





	public InputProjectPojo findInputProject(Integer projectId) {
//		InputProjectPojo ip=Dao.findIPinF(projectId);
//		return ip;
		return null;
	}



	public void insertInputProject(InputProject pojo) {
		Dao.insertInputProject(pojo);
		
	}



	public InputProject sendInputProject(Integer projectId) {
//		InputProject ip=Dao.sendInputProject(projectId);
//		return ip;
		return null;
	}



}
