
package com.wemccm.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.User;
import com.wemccm.common.page.FindPageRequestDto;

@Mapper
public interface ProjectDao {

	/**
	 * 分页查询用户
	 * 
	 * @return
	 */
	List<User> selectPage(FindPageRequestDto dto);

}