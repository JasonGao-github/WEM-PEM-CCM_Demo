package com.wemccm.avoidedcost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.avoidedcost.dao.AvoidedCostDao;
import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.entity.AvoidedCostESCGuideline;
import com.wemccm.common.entity.AvoidedCostMaintenanceCosts;
import com.wemccm.common.entity.AvoidedCostType;
import com.wemccm.common.entity.AvoidedCostassetReplacementIterm;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsTypePojo;
import com.wemccm.common.pojo.AvoidedCostMaintenanceCostsTypeJojo;
import com.wemccm.common.pojo.projectIdPojo;

@Service
public class AvoidedCostService {
	

	@Autowired
	private AvoidedCostDao avoidedCostDao;

	public List<AvoidedCostType> selectAllAvoidedCostType() {
		List<AvoidedCostType> l = avoidedCostDao.selectAllAvoidedCostType();

		return l;
	}

	public void insertAvoidedCostAssetReplacementCosts(List<AvoidedCostAssetReplacementCosts> list) {
		for (int i = 0; i < list.size(); i++) {
			avoidedCostDao.insertAvoidedCostAssetReplacementCosts(list.get(i));

		}

	}

	public void insertAvoidedCostESCGuideline(List<AvoidedCostESCGuideline> list) {
		for (int i = 0; i < list.size(); i++) {
			avoidedCostDao.insertAvoidedCostESCGuideline(list.get(i));

		}

	}

	public void insertAvoidedCostMaintenanceCosts(List<AvoidedCostMaintenanceCosts> list) {
		for (int i = 0; i < list.size(); i++) {
			avoidedCostDao.insertAvoidedCostMaintenanceCosts(list.get(i));

		}
	}

	public void insertAvoidedCostassetReplacementIterm(AvoidedCostassetReplacementIterm pojo) {

		avoidedCostDao.insertAvoidedCostassetReplacementIterm(pojo);

	}

	public List<AvoidedCostAssetReplacementCostsTypePojo> findAvoidedCostAssetReplacementCosts(
			projectIdPojo requestPojo) {
		List<AvoidedCostAssetReplacementCostsTypePojo> l = avoidedCostDao
				.findAvoidedCostAssetReplacementCosts(requestPojo);

		return l;
	}

	public List<AvoidedCostMaintenanceCostsTypeJojo> findAvoidedCostMaintenanceCosts(projectIdPojo requestPojo) {
		List<AvoidedCostMaintenanceCostsTypeJojo> l = avoidedCostDao.findAvoidedCostMaintenanceCosts(requestPojo);

		return l;
	}

	public List<AvoidedCostESCGuideline> findAvoidedCostESCGuideline(projectIdPojo requestPojo) {
		List<AvoidedCostESCGuideline> l = avoidedCostDao.findAvoidedCostESCGuideline(requestPojo);

		return l;
	}

	public List<AvoidedCostassetReplacementIterm> selectAllAvoidedCostassetReplacementIterm() {
		List<AvoidedCostassetReplacementIterm> l = avoidedCostDao.selectAllAvoidedCostassetReplacementIterm();

		return l;
	}

}
