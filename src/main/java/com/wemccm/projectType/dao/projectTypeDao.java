package com.wemccm.projectType.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.ProjectType;
import com.wemccm.common.pojo.projectTypePojo;

@Mapper
public interface projectTypeDao {

	


		public List<ProjectType> getProjectType(projectTypePojo pojo);

	

}
