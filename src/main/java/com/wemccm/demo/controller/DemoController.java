package com.wemccm.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.wemccm.common.entity.DemoEntity;
import com.wemccm.demo.service.DemoService;

@RestController
public class DemoController {

	@Autowired
	private DemoService serivce;

	@RequestMapping("/demoIndex")
	@ResponseBody
	public ModelAndView demoIndex() {

		ModelAndView mode = new ModelAndView();
		mode.setViewName("Demo");
		return mode;

	}

	@RequestMapping("/demoAction")
	@ResponseBody
	public ModelAndView demoAction(HttpServletRequest request) {

		String userId = request.getParameter("userId");

		System.out.println("userId is : " + userId);

		DemoEntity u = serivce.selectUserById(Integer.valueOf(userId));

		ModelAndView mode = new ModelAndView();
		mode.addObject("username", u.getUsername());
		mode.setViewName("Demo");
		return mode;

	}

}
