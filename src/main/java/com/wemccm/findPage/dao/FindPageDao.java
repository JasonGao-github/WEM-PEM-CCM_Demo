package com.wemccm.findPage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.User;
import com.wemccm.common.page.FindPageRequestDto;

@Mapper
public interface FindPageDao {

	/**
	 * 分页查询用户
	 * 
	 * @return
	 */
	List<User> selectPage(FindPageRequestDto dto);

}
