package com.wemccm.projectType.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface projectTypeDao {

	


		public void projectType(int id, String description, String name);

	

}
