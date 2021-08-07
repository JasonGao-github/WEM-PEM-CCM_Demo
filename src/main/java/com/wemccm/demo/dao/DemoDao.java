package com.wemccm.demo.dao;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.DemoEntity;

@Mapper
public interface DemoDao {

	public DemoEntity selectUserById(Integer id);

}
