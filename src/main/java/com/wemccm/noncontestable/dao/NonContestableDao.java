package com.wemccm.noncontestable.dao;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.NonContestableOtherCostsItem;
import com.wemccm.common.entity.NonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableType;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.pojo.MultiNonContestableOtherCostsPojo;
import com.wemccm.common.pojo.MultiNonContestableProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsDetailPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.common.pojo.nonContestableProjectComponentIdDetailPojo;
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

		public List<MultiNonContestableProjectComponentPojo> findTablePPC(projectIdPojo requestPojo);

		public List<nonContestableProjectComponentIdDetailPojo> findTablePTAndPC(
				Integer nonContestableProjectComponentId);

		
		
		
		
		public List<MultiNonContestableOtherCostsPojo> findTableOC(projectIdPojo requestPojo);

		public List<NonContestableOtherCostsDetailPojo> findTableTAndOCI(Integer nonContestableOtherCostsItemId);




		
		
	}


