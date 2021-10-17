package com.wemccm.noncontestable.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.NonContestableOtherCostsItem;
import com.wemccm.common.entity.NonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableType;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.pojo.AllNonContestableOtherCostsPojo;
import com.wemccm.common.pojo.AllNonContestableProjectComponentPojo;
import com.wemccm.common.pojo.IdPojo;
import com.wemccm.common.pojo.NccItemsAndProjectIdPojo;
import com.wemccm.common.pojo.NccItemsPojo;
import com.wemccm.common.pojo.NccProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemTypePojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentTypePojo;
import com.wemccm.common.pojo.projectIdPojo;

@Mapper
public interface NonContestableDao {

	public List<NonContestableProjectComponent> findNonContestableProjectComponent(
			NonContestableProjectComponentPojo requestPojo);

	public List<NonContestableType> selectAllNonContestableType();

	public List<NonContestableOtherCostsItem> findNonContestableOtherCostsItem(
			NonContestableOtherCostsItemPojo requestPojo);

	public void insertProjectNonContestableProjectComponent(
			ProjectNonContestableProjectComponent projectNonContestableProjectComponent);

	public void insertNonContestableOtherCosts(NonContestableOtherCosts nonContestableOtherCosts);

	public List<NccProjectComponentPojo> findMultiNonContestableProjectComponent(projectIdPojo requestPojo);

	public List<NccItemsPojo> findMultiNonContestableOtherCosts(NccItemsAndProjectIdPojo requestPojo);

	public void insertNonContestableProjectComponent(NonContestableProjectComponent ncpc);

	public void insertNonContestableOtherCostsItem(NonContestableOtherCostsItem ncoci);

	public NonContestableProjectComponent getNonContestableProjectComponentByDescription(String description);

	public NonContestableOtherCostsItem getNonContestableOtherCostsItemByDescription(String description);
	
	

	public List<AllNonContestableOtherCostsPojo> listAllNonContestableOtherCostsIterm(Integer projectId);

	public void deleteNonContestableOtherCostsIterm(IdPojo requestPojo);

	public void updateNonContestableOtherCostsIterm(NonContestableOtherCosts requestPojo);

	public List<NonContestableOtherCostsItemTypePojo> listAllAllNonContestableOtherCostsIterm();
	
	public void insertNonContestableOtherCostsItermId(@Param("nonContestableOtherCostsItemId")Integer nonContestableOtherCostsItemId,@Param("projectId")Integer projectId);
	
	
	
	
	public List<AllNonContestableProjectComponentPojo> listAllNonContestableProjectComponent(Integer projectId);

	public void deleteNonContestableProjectComponent(IdPojo requestPojo);

	public void updateNonContestableProjectComponent(ProjectNonContestableProjectComponent requestPojo);

	public List<NonContestableProjectComponentTypePojo> listAllALLNonContestableProjectComponent();

	
	public void insertNonContestableProjectComponentId(@Param("nonContestableProjectComponentId")Integer nonContestableProjectComponentId,@Param("projectId")Integer projectId);

	public NonContestableOtherCosts getNonContestableOtherCostsId(@Param("nonContestableOtherCostsItemId")Integer nonContestableOtherCostsItemId,@Param("projectId")Integer projectId);

	public ProjectNonContestableProjectComponent getProjectNonContestableProjectComponentId(@Param("nonContestableProjectComponentId")Integer nonContestableProjectComponentId,@Param("projectId")Integer projectId);

	





}
