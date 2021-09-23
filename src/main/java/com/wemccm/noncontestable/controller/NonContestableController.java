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
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.noncontestable.service.NonContestableService;

@RestController
public class NonContestableController {


	
	@Autowired
	private NonContestableService serivce;

//	@RequestMapping(value = "/insertQuantityInput", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String insertQuantityInput(@RequestBody QuantityInputPojo requestPojo) {
//
//		serivce.insertQuantityInput(requestPojo);
//		return "success";
//	}
//	
//	
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
	
}
