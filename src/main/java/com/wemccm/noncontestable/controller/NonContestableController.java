package com.wemccm.noncontestable.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.NonContestableOtherCostsItem;
import com.wemccm.common.entity.NonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableType;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.pojo.NccItemsAndProjectIdPojo;
import com.wemccm.common.pojo.NccItemsPojo;
import com.wemccm.common.pojo.NccProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.noncontestable.service.NonContestableService;

@RestController
public class NonContestableController {

	@Autowired
	private NonContestableService serivce;

	// list all the blue lines(group)
	@RequestMapping(value = "/selectAllNonContestableType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NonContestableType> selectAllNonContestableType() {

		List<NonContestableType> l = serivce.selectAllNonContestableType();
		return l;
	}

	// list project component by project Type
	@RequestMapping(value = "/findNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NonContestableProjectComponent> findNonContestableProjectComponent(
			@RequestBody NonContestableProjectComponentPojo requestPojo) {
		// find by projectTypeId

		List<NonContestableProjectComponent> l = serivce.findNonContestableProjectComponent(requestPojo);
		return l;
	}

	// list items under each blue line.
	@RequestMapping(value = "/findNonContestableOtherCostsIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NonContestableOtherCostsItem> findNonContestableOtherCostsItem(
			@RequestBody NonContestableOtherCostsItemPojo requestPojo) {
		// find by nonContestableTypeId

		List<NonContestableOtherCostsItem> l = serivce.findNonContestableOtherCostsItem(requestPojo);
		return l;
	}

	// save the data of Project Component part of ncc.
	@RequestMapping(value = "/insertProjectNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertProjectNonContestableProjectComponent(
			@RequestBody List<ProjectNonContestableProjectComponent> list) {

		serivce.insertProjectNonContestableProjectComponent(list);
		return new ResponseResult();
	}

	// save the data of other part of ncc.
	@RequestMapping(value = "/insertNonContestableOtherCosts", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertNonContestableOtherCosts(@RequestBody List<NonContestableOtherCosts> list) {

		serivce.insertNonContestableOtherCosts(list);
		return new ResponseResult();
	}

	@RequestMapping(value = "/insertNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertNonContestableProjectComponent(@RequestBody NonContestableProjectComponent ncpc) {

		serivce.insertNonContestableProjectComponent(ncpc);
		return new ResponseResult();
	}

	@RequestMapping(value = "/insertNonContestableOtherCostsItem", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertNonContestableOtherCostsItem(@RequestBody NonContestableOtherCostsItem ncoci) {

		serivce.insertNonContestableOtherCostsItem(ncoci);
		return new ResponseResult();
	}

	@RequestMapping(value = "/findMultiNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NccProjectComponentPojo> findMultiNonContestableProjectComponent(
			@RequestBody projectIdPojo requestPojo) {
		// find by projectTypeId

		List<NccProjectComponentPojo> l = serivce.findMultiNonContestableProjectComponent(requestPojo);
		return l;
	}

	@RequestMapping(value = "/findMultiNonContestableOtherCosts", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NccItemsPojo> findMultiNonContestableOtherCosts(@RequestBody NccItemsAndProjectIdPojo requestPojo) {
		// find by projectTypeId and nonContestableOtherCostsItemId

		List<NccItemsPojo> l = serivce.findMultiNonContestableOtherCosts(requestPojo);
		return l;
	}

}
