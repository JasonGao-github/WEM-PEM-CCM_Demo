package com.wemccm.cic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.pojo.CICAuthorisationPojo;
import com.wemccm.cic.service.cicService;
import com.wemccm.common.entity.CICAuthorisation;

@RestController
public class cicController {
	@Autowired
	private cicService serivce;

	
	@RequestMapping(value = "/addCICAuthorisation", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CICAuthorisation addCICAuthorisation(@RequestBody CICAuthorisationPojo requestPojo) {

		CICAuthorisation cica=serivce.createCICAuthorisation(requestPojo);

		return cica;
	}
	
	@RequestMapping(value = "/updateCICAuthorisation", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public CICAuthorisation updateCICAuthorisation(@RequestBody CICAuthorisationPojo requestPojo) {

		CICAuthorisation cica=serivce.updateCICAuthorisation(requestPojo);

		return cica;
	}
}
