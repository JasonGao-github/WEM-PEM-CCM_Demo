
package com.wemccm.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.Project;
import com.wemccm.common.entity.User;
import com.wemccm.common.page.FindPageRequestDto;
import com.wemccm.common.page.FindPageRequestDtoPojo;
import com.wemccm.common.pojo.AddCurrentoccupyPojo;
import com.wemccm.common.pojo.ProjectListPojo;
import com.wemccm.common.pojo.projectPojo;

@Mapper
public interface ProjectDao {

	public List<FindPageRequestDto> selectPage(FindPageRequestDtoPojo dto);

	public void addProject(Project p);

	public List<Integer> getId(projectPojo pojo);

	public List<Integer> getCCId(projectPojo pojo);

	public void addcustomercontributionprice(projectPojo pojo);

	public int getNewestId();

	public User getUser(Integer id);

	public String getTypeName(Integer typeId);

	public void addCurrentoccupy(AddCurrentoccupyPojo addCurrentoccupyPojo);

//	List<FindPageRequestDto> selectPage(List<FindPageRequestDto> dto);

	public List<ProjectListPojo> listByApprover(int userId);

}