package com.wemccm.design.dao;


import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.Design;
import com.wemccm.common.pojo.projectIdPojo;

@Mapper
public interface DesignDao {



	public String findWBSElement(projectIdPojo requestPojo);

	public void insertDesign(Design pojo);

}
