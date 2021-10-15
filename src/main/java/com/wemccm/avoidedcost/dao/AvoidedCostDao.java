package com.wemccm.avoidedcost.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.entity.AvoidedCostESCGuideline;
import com.wemccm.common.entity.AvoidedCostassetReplacementIterm;
import com.wemccm.common.pojo.AllAvoidedCostassetPojo;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsTypePojo;
import com.wemccm.common.pojo.AvoidedCostMaintenanceCostsTypeJojo;
import com.wemccm.common.pojo.IdPojo;
import com.wemccm.common.pojo.projectIdPojo;

@Mapper
public interface AvoidedCostDao {
	

//	public List<AvoidedCostType> selectAllAvoidedCostType();

	public List<AllAvoidedCostassetPojo> selectAllAvoidedCostassetReplacementIterm(Integer projectId);

	public void insertAvoidedCostAssetReplacementCosts(
			AvoidedCostAssetReplacementCosts avoidedCostAssetReplacementCosts);

	public void insertAvoidedCostESCGuideline(AvoidedCostESCGuideline avoidedCostESCGuideline);

//	public void insertAvoidedCostMaintenanceCosts(AvoidedCostMaintenanceCosts avoidedCostMaintenanceCosts);

	public void insertAvoidedCostassetReplacementIterm(AvoidedCostassetReplacementIterm iterm);

	public List<AvoidedCostAssetReplacementCostsTypePojo> findAvoidedCostAssetReplacementCosts(
			projectIdPojo requestPojo);

	public List<AvoidedCostMaintenanceCostsTypeJojo> findAvoidedCostMaintenanceCosts(projectIdPojo requestPojo);

	public List<AvoidedCostESCGuideline> findAvoidedCostESCGuideline(projectIdPojo requestPojo);

	
	
	
	public AvoidedCostassetReplacementIterm getByName(String name);

	public void deleteAvoidedCostassetReplacementIterm(IdPojo requestPojo);

	public void updateAvoidedCostassetReplacementIterm(AvoidedCostAssetReplacementCosts requestPojo);

	public List<AvoidedCostassetReplacementIterm> selectAllALLAvoidedCostassetReplacementIterm();

	public void insertAvoidedCostassetReplacementItermId(Integer id);

	public AvoidedCostAssetReplacementCosts getAvoidedCostAssetReplacementCostsId(Integer id);

	
	
	
}
