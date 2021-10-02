package com.wemccm.fiminput.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.FIMinputIterm;
import com.wemccm.common.entity.FIMinputSubType;
import com.wemccm.common.entity.FIMinputType;
import com.wemccm.common.pojo.FIMinputItermPojo;
import com.wemccm.common.pojo.FIMinputItermQuantityPojo;
import com.wemccm.common.pojo.FIMinputSubTypePojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.fiminput.serivce.FIMInputService;

@RestController
public class FIMInputController {

	@Autowired
	private FIMInputService serivce;

	// return a list contains "Pole TX Estimate" and "Kiosk TX"
	@RequestMapping(value = "/listAllFIMinputType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<FIMinputType> selectAllFIMinputType() {

		List<FIMinputType> l = serivce.selectAllFIMinputType();
		return l;
	}

	// return a list contains "Transformer 22kv" .etc
	@RequestMapping(value = "/listFIMinputSubType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<FIMinputSubType> findFIMinputSubType(@RequestBody FIMinputSubTypePojo requestPojo) {
		// find by fIMinputTypeID

		List<FIMinputSubType> l = serivce.findFIMinputSubType(requestPojo);
		return l;
	}

	// list all the iterms under a specific group
	@RequestMapping(value = "/listFIMinputIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<FIMinputIterm> findFIMinputIterm(@RequestBody FIMinputItermPojo requestPojo) {
		// find by fIMinputSubTypeID

		List<FIMinputIterm> l = serivce.findFIMinputIterm(requestPojo);
		return l;
	}

//	@RequestMapping(value = "/selectAllFIMinputItermQuantityType", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public List<FIMinputItermQuantityType> selectAllFIMinputItermQuantityType() {
//
//		List<FIMinputItermQuantityType> l = serivce.selectAllFIMinputItermQuantityType();
//		return l;
//	}

	// save FIM input data
	@RequestMapping(value = "/insertFIMinputItermQuantity", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertFIMinputItermQuantity(@RequestBody List<FIMinputItermQuantityPojo> pojoList) {

		serivce.insertFIMinputItermQuantity(pojoList);
		return new ResponseResult();
	}

	@RequestMapping(value = "/insertFIMinputIterm", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertFIMinputIterm(@RequestBody FIMinputIterm pojo) {

		serivce.insertFIMinputIterm(pojo);
		return new ResponseResult();
	}

}
