package com.wemccm.connectionhandover.dao;


import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.UplaodedFiles;
import com.wemccm.common.pojo.ConnectionHandoverPojo;

@Mapper
public interface ConnectionHandoverDao {




	public void insertConnectionHandover(ConnectionHandover pojo);

	public ConnectionHandoverPojo findConnectionHandover(Integer projectId);

	public void uplaodedFiles(UplaodedFiles pojo);

	public UplaodedFiles downlaodedFiles(Integer projectId);

}
