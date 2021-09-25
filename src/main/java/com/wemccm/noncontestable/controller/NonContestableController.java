package com.wemccm.noncontestable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.NonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableType;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.NonContestableOtherCostsItem;
import com.wemccm.common.pojo.MultiNonContestableOtherCostsPojo;
import com.wemccm.common.pojo.MultiNonContestableProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.noncontestable.service.NonContestableService;

@RestController
public class NonContestableController {


	
	@Autowired
	private NonContestableService serivce;


	@RequestMapping(value = "/selectAllNonContestableType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NonContestableType> selectAllNonContestableType() {

		List<NonContestableType> l=serivce.selectAllNonContestableType();
		return l;
	}
	

	@RequestMapping(value = "/findNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NonContestableProjectComponent> findNonContestableProjectComponent(@RequestBody NonContestableProjectComponentPojo requestPojo) {
		//find by projectTypeId
		
		List<NonContestableProjectComponent> l= serivce.findNonContestableProjectComponent(requestPojo);
		return l;
	}

	
	@RequestMapping(value = "/findNonContestableOtherCostsIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NonContestableOtherCostsItem> findNonContestableOtherCostsItem(@RequestBody NonContestableOtherCostsItemPojo requestPojo) {
		//find by nonContestableTypeId
		
		List<NonContestableOtherCostsItem> l= serivce.findNonContestableOtherCostsItem(requestPojo);
		return l;
	}
	
	
	@RequestMapping(value = "/insertProjectNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertProjectNonContestableProjectComponent(@RequestBody List<ProjectNonContestableProjectComponent> list) {

		 serivce.insertProjectNonContestableProjectComponent(list);
		return "success";
	}

	@RequestMapping(value = "/insertNonContestableOtherCosts", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertNonContestableOtherCosts(@RequestBody List<NonContestableOtherCosts> list) {

		 serivce.insertNonContestableOtherCosts(list);
		return "success";
	}
	
	
	

	@RequestMapping(value = "/findMultiNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MultiNonContestableProjectComponentPojo> findMultiNonContestableProjectComponent(@RequestBody projectIdPojo requestPojo) {
		//find by projectTypeId
		
		List<MultiNonContestableProjectComponentPojo> l= serivce.findMultiNonContestableProjectComponent(requestPojo);
		return l;
	}
	
	@RequestMapping(value = "/findMultiNonContestableOtherCosts", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<MultiNonContestableOtherCostsPojo> findMultiNonContestableOtherCosts(@RequestBody projectIdPojo requestPojo) {
		//find by projectTypeId
		
		List<MultiNonContestableOtherCostsPojo> l= serivce.findMultiNonContestableOtherCosts(requestPojo);
		return l;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
