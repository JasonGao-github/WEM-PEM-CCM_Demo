package com.wemccm.projectType.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.ProjectType;
import com.wemccm.common.pojo.projectTypePojo;
import com.wemccm.projectType.dao.projectTypeDao;

@Service
public class projectTypeService {
	@Autowired
	private projectTypeDao Dao;

	public List<ProjectType> projectType(projectTypePojo requestPojo) {

		List<ProjectType> pt = Dao.getProjectType(requestPojo);
		

			return pt;
		

	}
}
