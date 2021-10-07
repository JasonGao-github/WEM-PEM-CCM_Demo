package com.wemccm.connectionhandover.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.UplaodedFiles;
import com.wemccm.common.pojo.ConnectionHandoverPojo;
import com.wemccm.common.pojo.NegotiatedConnectionPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.connectionhandover.service.ConnectionHandoverService;

@RestController
public class ConnectionHandoverController {

	@Autowired
	private ConnectionHandoverService serivce;

	@RequestMapping(value = "/insertConnectionHandover", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertConnectionHandover(@RequestBody ConnectionHandover Pojo) {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		Pojo.setProjectId(projectId);
		serivce.insertConnectionHandover(Pojo);
		return new ResponseResult();
	}




	@RequestMapping(value = "/findConnectionHandover", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ConnectionHandoverPojo findConnectionHandover() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");

		
		ConnectionHandoverPojo p = serivce.findConnectionHandover(projectId);
		return p;
	}

	@RequestMapping(value = "/uplaodedFiles", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult uplaodedFiles(@RequestPart MultipartFile file) throws IOException  {
		UplaodedFiles Pojo = new UplaodedFiles();
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		Pojo.setProjectId(projectId);
		String fileName = file.getOriginalFilename();
		Pojo.setFileName(fileName);
		String filePath ="/src/main/resource/uploadfile/" + fileName;
		Pojo.setLocalURL(filePath);
		Pojo.setModule("ConnectionHandover");
		File dest = new File(filePath);
	    Files.copy(file.getInputStream(), dest.toPath());
	     
		serivce.uplaodedFiles(Pojo);
		return new ResponseResult();
	}
	
	@RequestMapping(value = "/downlaodedFiles", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public UplaodedFiles downlaodedFiles() {
		Integer projectId=123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId=(int) session.getAttribute("projectId");
		UplaodedFiles uf=serivce.downlaodedFiles(projectId);
		return uf;
	}
	
	
	
	
	
	
	
	
	
	


}
