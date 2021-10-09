package com.wemccm.session.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.wemccm.common.entity.UpdateSessionPojo;
import com.wemccm.common.pojo.ResponseResult;

@RestController
public class SessionController {

	@RequestMapping(value = "/listFIMinputSubType", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult findFIMinputSubType(@RequestBody UpdateSessionPojo pojo) {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		session.setAttribute("projectId", pojo.getProjectId());

		return new ResponseResult();

	}

}
