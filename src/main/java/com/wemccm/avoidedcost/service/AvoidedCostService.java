package com.wemccm.avoidedcost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.entity.AvoidedCostESCGuideline;
import com.wemccm.common.entity.AvoidedCostMaintenanceCosts;
import com.wemccm.common.entity.AvoidedCostType;
import com.wemccm.common.entity.AvoidedCostassetReplacementIterm;
import com.wemccm.avoidedcost.dao.AvoidedCostDao;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsTypePojo;
import com.wemccm.common.pojo.AvoidedCostMaintenanceCostsTypeJojo;
import com.wemccm.common.pojo.projectIdPojo;

@Service
public class AvoidedCostService {

	@Autowired
	private AvoidedCostDao Dao;

	public List<AvoidedCostType> selectAllAvoidedCostType() {
		List<AvoidedCostType> l = Dao.selectAllAvoidedCostType();

		return l;
	}

	public void insertAvoidedCostAssetReplacementCosts(List<AvoidedCostAssetReplacementCosts> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertAvoidedCostAssetReplacementCosts(list.get(i));

		}

	}

	public void insertAvoidedCostESCGuideline(List<AvoidedCostESCGuideline> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertAvoidedCostESCGuideline(list.get(i));

		}

	}

	public void insertAvoidedCostMaintenanceCosts(List<AvoidedCostMaintenanceCosts> list) {
		for (int i = 0; i < list.size(); i++) {
			Dao.insertAvoidedCostMaintenanceCosts(list.get(i));

		}
	}

	public List<AvoidedCostAssetReplacementCostsTypePojo> findAvoidedCostAssetReplacementCosts(
			projectIdPojo requestPojo) {
		List<AvoidedCostAssetReplacementCostsTypePojo> l = Dao.findAvoidedCostAssetReplacementCosts(requestPojo);

		return l;
	}

	public List<AvoidedCostMaintenanceCostsTypeJojo> findAvoidedCostMaintenanceCosts(projectIdPojo requestPojo) {
		List<AvoidedCostMaintenanceCostsTypeJojo> l = Dao.findAvoidedCostMaintenanceCosts(requestPojo);

		return l;
	}

	public List<AvoidedCostESCGuideline> findAvoidedCostESCGuideline(projectIdPojo requestPojo) {
		List<AvoidedCostESCGuideline> l = Dao.findAvoidedCostESCGuideline(requestPojo);

		return l;
	}

	public List<AvoidedCostassetReplacementIterm> selectAllAvoidedCostassetReplacementIterm() {
		List<AvoidedCostassetReplacementIterm> l = Dao.selectAllAvoidedCostassetReplacementIterm();

		return l;
	}

}
