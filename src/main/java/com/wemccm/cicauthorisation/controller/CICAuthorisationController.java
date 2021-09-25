package com.wemccm.cicauthorisation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.pojo.CICAuthorisationPojo;
import com.wemccm.cicauthorisation.service.CICAuthorisationService;
import com.wemccm.common.entity.CICAuthorisation;

@RestController
public class CICAuthorisationController {
	@Autowired
	private CICAuthorisationService serivce;

	
	@RequestMapping(value = "/addCICAuthorisation", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCICAuthorisation(@RequestBody CICAuthorisationPojo requestPojo) {
		//INSERT INTO table cicauthorisation
		CICAuthorisation cica=serivce.createCICAuthorisation(requestPojo);

		return "Success";
	}
	
	@RequestMapping(value = "/updateCICAuthorisation", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateCICAuthorisation(@RequestBody CICAuthorisationPojo requestPojo) {
		//update cicauthorisation
		serivce.updateCICAuthorisation(requestPojo);
			return "Success";
		
		
	}
}
