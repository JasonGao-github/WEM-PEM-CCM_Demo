package com.wemccm.connectionhandover.dao;


import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.ConnectionHandover;

@Mapper
public interface ConnectionHandoverDao {




	public void insertConnectionHandover(ConnectionHandover pojo);

}
