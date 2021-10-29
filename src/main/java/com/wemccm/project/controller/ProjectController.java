package com.wemccm.project.controller;

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

import com.wemccm.common.page.FindPageRequestDtoPojo;
import com.wemccm.common.page.PageResult;
import com.wemccm.common.pojo.AddCurrentoccupyPojo;
import com.wemccm.common.pojo.ListProjectsByApproverPojo;
import com.wemccm.common.pojo.ProjectListPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.projectPojo;
import com.wemccm.project.service.ProjectService;

@RestController
public class ProjectController {

	@Autowired
	private ProjectService service;

	@RequestMapping(value = "/findPage", produces = "application/json;charset=UTF-8")
	public PageResult findPage(@RequestBody FindPageRequestDtoPojo dto) {
		// get by any attribute input (one or many)
		// from table project,currentoccupy,customercontribution

		return service.findPage(dto);
	}

	@RequestMapping(value = "/addProject", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult addProject(@RequestBody projectPojo pojo) {
		// insert to table project and customercontribution
		Integer projectId = service.addProject(pojo);

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("projectId", projectId);
		session.setAttribute("projectStatus", "exist");

		Integer userId = Integer.valueOf((String) session.getAttribute("userId"));

		AddCurrentoccupyPojo addCurrentoccupyPojo = new AddCurrentoccupyPojo();
		addCurrentoccupyPojo.setProjectId(projectId);
		addCurrentoccupyPojo.setUserId(userId);
		service.addCurrentoccupy(addCurrentoccupyPojo);

		return new ResponseResult();
	}

	// listByApprover
	@RequestMapping(value = "/listProjectsByApprover", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult listByApprover(@RequestBody ListProjectsByApproverPojo pojo) {

		int userId = getUserIdInSession();
//		int userId = 1;
		pojo.setUserId(userId);
		List<ProjectListPojo> list = service.listByApprover(pojo);
		ResponseResult rr = new ResponseResult();
		rr.setData(list);

		return rr;

	}

	private int getUserIdInSession() {

		HttpSession session = getSession();

		return (int) session.getAttribute("userId");

	}//

	private HttpSession getSession() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		return session;

	}

}
