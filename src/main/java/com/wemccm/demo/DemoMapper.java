package com.wemccm.demo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.User;

@Mapper
public interface DemoMapper {

	/**
	 * 分页查询用户
	 * 
	 * @return
	 */
	List<User> selectPage(DemoPageRequestDto dto);

}
