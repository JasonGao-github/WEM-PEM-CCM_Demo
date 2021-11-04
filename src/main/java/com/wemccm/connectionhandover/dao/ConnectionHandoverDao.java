package com.wemccm.connectionhandover.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.UplaodedFiles;
import com.wemccm.common.pojo.ConnectionHandoverPojo;
import com.wemccm.common.pojo.DownlaodedFilesPojo;

@Mapper
public interface ConnectionHandoverDao {




	public void insertConnectionHandover(ConnectionHandover pojo);

	public ConnectionHandoverPojo findConnectionHandover(Integer projectId);

	public void uplaodedFiles(UplaodedFiles pojo);

	public List<UplaodedFiles> downlaodedFiles(DownlaodedFilesPojo pojo);

	public ConnectionHandover listAllConnectionHandover(Integer projectId);

	public void updateConnectionHandover(ConnectionHandover pojo);

	public ConnectionHandover getConnectionHandoverId(Integer id);

}
