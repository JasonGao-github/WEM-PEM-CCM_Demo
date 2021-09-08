
package com.wemccm.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.page.FindPageRequestDto;
import com.wemccm.common.page.FindPageRequestDtoPojo;

@Mapper
public interface ProjectDao {

	List<FindPageRequestDto> selectPage(FindPageRequestDtoPojo dto);

//	List<FindPageRequestDto> selectPage(List<FindPageRequestDto> dto);

}