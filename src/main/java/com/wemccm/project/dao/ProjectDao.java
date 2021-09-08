
package com.wemccm.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.page.FindPageRequestDto;

@Mapper
public interface ProjectDao {

	List<FindPageRequestDto> selectPage(FindPageRequestDto dto);

//	List<FindPageRequestDto> selectPage(List<FindPageRequestDto> dto);

}