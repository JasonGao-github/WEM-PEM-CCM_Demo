
package com.wemccm.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.page.FindPageRequestDto;
import com.wemccm.common.page.FindPageRequestDtoPojo;
import com.wemccm.common.pojo.projectPojo;

@Mapper
public interface ProjectDao {

	public List<FindPageRequestDto> selectPage(FindPageRequestDtoPojo dto);

	public void addProject(projectPojo pojo);

	public void addcustomercontribution(projectPojo pojo);

	public List<Integer> getId(projectPojo pojo);

	public List<Integer> getCCId(projectPojo pojo);

	public void addcustomercontributionprice(projectPojo pojo);

//	List<FindPageRequestDto> selectPage(List<FindPageRequestDto> dto);

}