package com.wemccm.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.wemccm.common.entity.Notice;
import com.wemccm.common.pojo.NoticePojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.notice.service.NoticeService;

@RestController
public class NoticeController {


	
	@Autowired
	private NoticeService serivce;

	@RequestMapping(value = "/createNotice", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult createNotice(@RequestBody NoticePojo requestPojo) {

		
		String s = serivce.createNotice(requestPojo);
		return new ResponseResult();
	}
	

	@RequestMapping(value = "/findNotice", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult findNotice(@RequestBody NoticePojo requestPojo) {

		
		
		List<Notice> n = serivce.findNotice(requestPojo);
//		System.out.println(n.get(0).getCreateTime()+"   uid: ");
		return new ResponseResult();
	}
	
	

}
