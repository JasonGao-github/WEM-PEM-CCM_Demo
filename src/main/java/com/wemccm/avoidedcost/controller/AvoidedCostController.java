package com.wemccm.avoidedcost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.avoidedcost.service.AvoidedCostService;
import com.wemccm.common.entity.AvoidedCostAssetReplacementCosts;
import com.wemccm.common.entity.AvoidedCostESCGuideline;
import com.wemccm.common.entity.AvoidedCostMaintenanceCosts;
import com.wemccm.common.entity.AvoidedCostType;
import com.wemccm.common.entity.AvoidedCostassetReplacementIterm;
import com.wemccm.common.pojo.AvoidedCostAssetReplacementCostsTypePojo;
import com.wemccm.common.pojo.AvoidedCostMaintenanceCostsTypeJojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.projectIdPojo;

@RestController
public class AvoidedCostController {
//
	@Autowired
	private AvoidedCostService serivce;

	@RequestMapping(value = "/selectAllAvoidedCostType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<AvoidedCostType> selectAllAvoidedCostType() {
		// get all table avoidedcosttype
		List<AvoidedCostType> l = serivce.selectAllAvoidedCostType();
		return l;
	}

	// select All basic data
	@RequestMapping(value = "/selectAllAvoidedCostassetReplacementIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<AvoidedCostassetReplacementIterm> selectAllAvoidedCostassetReplacementIterm() {
		// get all table avoidedcostassetreplacementiterm
		List<AvoidedCostassetReplacementIterm> l = serivce.selectAllAvoidedCostassetReplacementIterm();
		return l;
	}

	// insert basic data
	@RequestMapping(value = "/insertAvoidedCostassetReplacementIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertAvoidedCostassetReplacementIterm(@RequestBody AvoidedCostassetReplacementIterm pojo) {
		serivce.insertAvoidedCostassetReplacementIterm(pojo);
		return new ResponseResult();
	}

	@RequestMapping(value = "/insertAvoidedCostAssetReplacementCosts", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertAvoidedCostAssetReplacementCosts(@RequestBody List<AvoidedCostAssetReplacementCosts> list) {
		// insert table avoidedcostassetreplacementcosts
		serivce.insertAvoidedCostAssetReplacementCosts(list);
		return "success";
	}

	// insert data of the first part
	@RequestMapping(value = "/insertAvoidedCostESCGuideline", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertAvoidedCostESCGuideline(@RequestBody List<AvoidedCostESCGuideline> list) {
		// insert table avoidedcostescguideline
		serivce.insertAvoidedCostESCGuideline(list);
		return "success";
	}

	@RequestMapping(value = "/insertAvoidedCostMaintenanceCosts", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertAvoidedCostMaintenanceCosts(@RequestBody List<AvoidedCostMaintenanceCosts> list) {
		// insert table avoidedcostmaintenancecosts
		serivce.insertAvoidedCostMaintenanceCosts(list);
		return "success";
	}

	@RequestMapping(value = "/findAvoidedCostAssetReplacementCosts", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<AvoidedCostAssetReplacementCostsTypePojo> findAvoidedCostAssetReplacementCosts(
			@RequestBody projectIdPojo requestPojo) {
		// search by projectId, from table
		// avoidedcostassetreplacementcosts,avoidedcosttype,avoidedcostassetreplacementiterm

		List<AvoidedCostAssetReplacementCostsTypePojo> l = serivce.findAvoidedCostAssetReplacementCosts(requestPojo);
		return l;
	}

	@RequestMapping(value = "/findAvoidedCostMaintenanceCosts", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<AvoidedCostMaintenanceCostsTypeJojo> findAvoidedCostMaintenanceCosts(
			@RequestBody projectIdPojo requestPojo) {
		// search by projectId, from table avoidedcostmaintenancecosts,avoidedcosttype

		List<AvoidedCostMaintenanceCostsTypeJojo> l = serivce.findAvoidedCostMaintenanceCosts(requestPojo);
		return l;
	}

	@RequestMapping(value = "/findAvoidedCostESCGuideline", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<AvoidedCostESCGuideline> findAvoidedCostESCGuideline(@RequestBody projectIdPojo requestPojo) {
		// search by projectId, from table avoidedcostescguideline

		List<AvoidedCostESCGuideline> l = serivce.findAvoidedCostESCGuideline(requestPojo);
		return l;
	}

}
