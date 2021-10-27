package com.wemccm.noncontestable.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.entity.NonContestableOtherCosts;
import com.wemccm.common.entity.NonContestableOtherCostsItem;
import com.wemccm.common.entity.NonContestableProjectComponent;
import com.wemccm.common.entity.NonContestableType;
import com.wemccm.common.entity.ProjectNonContestableProjectComponent;
import com.wemccm.common.pojo.IdPojo;
import com.wemccm.common.pojo.NccItemsAndProjectIdPojo;
import com.wemccm.common.pojo.NccItemsPojo;
import com.wemccm.common.pojo.NccProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemPojo;
import com.wemccm.common.pojo.NonContestableOtherCostsItemTypePojo;
import com.wemccm.common.pojo.NonContestableProjectComponentPojo;
import com.wemccm.common.pojo.NonContestableProjectComponentTypePojo;
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
	@RequestMapping(value = "/deleteNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult deleteNonContestableProjectComponent(
			@RequestBody IdPojo requestPojo) {
		// find by nonContestableTypeId

		 serivce.deleteNonContestableProjectComponent(requestPojo);
		return new ResponseResult();
	}
//	@RequestMapping(value = "/listAllNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public List<NonContestableProjectComponentTypePojo> listAllNonContestableProjectComponent() {
//		Integer projectId=123;
////		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
////				.getRequest();
////		HttpSession session = request.getSession();
////		projectId=(int) session.getAttribute("projectId");
//
//		List<NonContestableProjectComponentTypePojo> l = serivce.listAllNonContestableProjectComponent(projectId);
//		return l;
//	}
//	@RequestMapping(value = "/updateNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseResult updateNonContestableProjectComponent(
//			@RequestBody NonContestableProjectComponentTypePojo requestPojo) {
//
//
//		 serivce.updateNonContestableProjectComponent(requestPojo);
//		return new ResponseResult();
//	}
	
	
	
	
	
	// list items under each blue line.
	@RequestMapping(value = "/findNonContestableOtherCostsIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NonContestableOtherCostsItem> findNonContestableOtherCostsItem(
			@RequestBody NonContestableOtherCostsItemPojo requestPojo) {
		// find by nonContestableTypeId

		List<NonContestableOtherCostsItem> l = serivce.findNonContestableOtherCostsItem(requestPojo);
		return l;
	}
	
	
//	@RequestMapping(value = "/listAllNonContestableOtherCostsIterm", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public List<NonContestableOtherCostsItemTypePojo> listAllNonContestableOtherCostsIterm() {
//		Integer projectId=456;
////		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
////				.getRequest();
////		HttpSession session = request.getSession();
////		projectId=(int) session.getAttribute("projectId");
//
//		List<NonContestableOtherCostsItemTypePojo> l = serivce.listAllNonContestableOtherCostsIterm(projectId);
//		return l;
//	}
//	
//	@RequestMapping(value = "/updateNonContestableOtherCostsIterm", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseResult updateNonContestableOtherCostsIterm(
//			@RequestBody NonContestableOtherCostsItemTypePojo requestPojo) {
//
//
//		 serivce.updateNonContestableOtherCostsIterm(requestPojo);
//		return new ResponseResult();
//	}
	
	@RequestMapping(value = "/deleteNonContestableOtherCostsIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult deleteNonContestableOtherCostsIterm(
			@RequestBody IdPojo requestPojo) {


		 serivce.deleteNonContestableOtherCostsIterm(requestPojo);
		return new ResponseResult();
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
		
		
		
//		System.out.println(ncpc.getProjecTypeId()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//		System.out.println(ncpc.getDescription()+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		
		String result = serivce.insertNonContestableProjectComponent(ncpc);
		if ("-1".equals(result)) {
			return new ResponseResult("false", "this data has already exist in our system!");
		}
		return new ResponseResult();
	}

	@RequestMapping(value = "/insertNonContestableOtherCostsItem", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertNonContestableOtherCostsItem(@RequestBody NonContestableOtherCostsItem ncoci) {

		String result = serivce.insertNonContestableOtherCostsItem(ncoci);

		if ("-1".equals(result)) {
			return new ResponseResult("false", "this data has already exist in our system!");
		}
		return new ResponseResult();
	}

	@RequestMapping(value = "/findMultiNonContestableProjectComponent", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<NccProjectComponentPojo> findMultiNonContestableProjectComponent() {
		// find by projectTypeId
		projectIdPojo requestPojo=new projectIdPojo();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		int projectId=(int) session.getAttribute("projectId");
		requestPojo.setProjectId(projectId);
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
