package com.wemccm.projecttype.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.ProjectType;
import com.wemccm.common.pojo.projectTypePojo;

@Mapper
public interface ProjectTypeDao {

	


		public List<ProjectType> getProjectType(projectTypePojo pojo);

	

}
