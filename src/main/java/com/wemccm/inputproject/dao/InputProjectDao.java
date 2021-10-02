package com.wemccm.inputproject.dao;


import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.InputProject;

@Mapper
public interface InputProjectDao {

	void insertInputProject(InputProject pojo);


	
	

}
