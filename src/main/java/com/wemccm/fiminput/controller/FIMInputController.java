package com.wemccm.fiminput.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.NonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableType;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.entity.FIMinputIterm;
import com.wemccm.common.entity.FIMinputItermQuantityType;
import com.wemccm.common.entity.FIMinputSubType;
import com.wemccm.common.entity.FIMinputType;
import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.NonContestableOtherCostsItem;
import com.wemccm.common.pojo.FIMinputItermPojo;
import com.wemccm.common.pojo.FIMinputItermQuantityPojo;
import com.wemccm.common.pojo.FIMinputSubTypePojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.fiminput.serivce.FIMInputService;
import com.wemccm.noncontestable.service.NonContestableService;

@RestController
public class FIMInputController {


	
	@Autowired
	private FIMInputService serivce;


	@RequestMapping(value = "/selectAllFIMinputType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<FIMinputType> selectAllFIMinputType() {

		List<FIMinputType> l=serivce.selectAllFIMinputType();
		return l;
	}
	

	@RequestMapping(value = "/findFIMinputSubType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<FIMinputSubType> findFIMinputSubType(@RequestBody FIMinputSubTypePojo requestPojo) {
		//find by fIMinputTypeID
		
		List<FIMinputSubType> l= serivce.findFIMinputSubType(requestPojo);
		return l;
	}

	

	@RequestMapping(value = "/selectAllFIMinputItermQuantityType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<FIMinputItermQuantityType> selectAllFIMinputItermQuantityType() {

		List<FIMinputItermQuantityType> l=serivce.selectAllFIMinputItermQuantityType();
		return l;
	}
	
	@RequestMapping(value = "/insertFIMinputItermQuantity", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertFIMinputItermQuantity(@RequestBody FIMinputItermQuantityPojo requestPojo) {

		serivce.insertFIMinputItermQuantity(requestPojo);
		return "success";
	}
	
	@RequestMapping(value = "/findFIMinputIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<FIMinputIterm> findFIMinputIterm(@RequestBody FIMinputItermPojo requestPojo) {
		//find by fIMinputSubTypeID
		
		List<FIMinputIterm> l= serivce.findFIMinputIterm(requestPojo);
		return l;
	}
	



	
}
