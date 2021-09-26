package com.wemccm.noncontestable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.wemccm.noncontestable.dao.NonContestableDao;

@Service
public class NonContestableService {

	//
	@Autowired
	private NonContestableDao Dao;

	public List<NonContestableProjectComponent> findNonContestableProjectComponent(
			NonContestableProjectComponentPojo requestPojo) {

		List<NonContestableProjectComponent> l = Dao.findNonContestableProjectComponent(requestPojo);

		return l;
	}

	public List<NonContestableType> selectAllNonContestableType() {
		List<NonContestableType> l = Dao.selectAllNonContestableType();

		return l;
	}

	public List<NonContestableOtherCostsItem> findNonContestableOtherCostsItem(
			NonContestableOtherCostsItemPojo requestPojo) {
		List<NonContestableOtherCostsItem> l = Dao.findNonContestableOtherCostsItem(requestPojo);

		return l;
	}

	public void insertProjectNonContestableProjectComponent(List<ProjectNonContestableProjectComponent> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertProjectNonContestableProjectComponent(list.get(i));
		}

	}

	public void insertNonContestableOtherCosts(List<NonContestableOtherCosts> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertNonContestableOtherCosts(list.get(i));
		}
	}

	public List<MultiNonContestableProjectComponentPojo> findMultiNonContestableProjectComponent(
			projectIdPojo requestPojo) {

		List<MultiNonContestableProjectComponentPojo> l = Dao.findTablePPC(requestPojo);
		for (int i = 0; i < l.size(); i++) {
			List<nonContestableProjectComponentIdDetailPojo> details = Dao
					.findTablePTAndPC(l.get(i).getNonContestableProjectComponentId());
			l.get(i).setDetails(details);
		}

		return l;
	}

	public List<MultiNonContestableOtherCostsPojo> findMultiNonContestableOtherCosts(projectIdPojo requestPojo) {
		List<MultiNonContestableOtherCostsPojo> l = Dao.findTableOC(requestPojo);
		for (int i = 0; i < l.size(); i++) {
			List<NonContestableOtherCostsDetailPojo> details = Dao
					.findTableTAndOCI(l.get(i).getNonContestableOtherCostsItemId());
			l.get(i).setDetails(details);
		}

		return l;
	}

}
