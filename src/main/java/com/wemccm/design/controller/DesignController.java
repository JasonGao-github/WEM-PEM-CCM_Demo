package com.wemccm.design.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.wemccm.common.entity.Design;
import com.wemccm.common.entity.UplaodedFiles;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.common.util.S3Utils;
import com.wemccm.connectionhandover.service.ConnectionHandoverService;
import com.wemccm.design.service.DesignService;

@RestController
public class DesignController {

	@Autowired
	private DesignService serivce;
//	@Autowired
//	private ConnectionHandoverService CHserivce;
	
	@RequestMapping(value = "/findWBSElement", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findWBSElement() {
		// find by fIMinputTypeID
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		int projectId=(int) session.getAttribute("projectId");
		
		
		projectIdPojo requestPojo=new projectIdPojo();
		requestPojo.setProjectId(projectId);
		String l = serivce.findWBSElement(requestPojo);
		return l;
	}
	
	



//	@RequestMapping(value = "/DesignUplaodedFiles", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public ResponseResult uplaodedFiles(@RequestPart MultipartFile file) throws IOException {
//		UplaodedFiles Pojo = new UplaodedFiles();
//		Integer projectId = 123;
////		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
////				.getRequest();
////		HttpSession session = request.getSession();
////		projectId = (int) session.getAttribute("projectId");
//		Pojo.setProjectId(projectId);
//
//		String fileName = System.currentTimeMillis()+"_"+file.getOriginalFilename() ;
//		Pojo.setFileName(fileName);
////		String filePath = "D:\\RMIT\\y2s2\\Jemena Project\\project\\jemena-WEM-PEM-CCM\\" + fileName;
////		String filePath = "C:\\git_workplace\\jemena-WEM-PEM-CCM\\jemena-WEM-PEM-CCM\\src\\main\\resource\\uploadfile\\" + fileName;
//
//		String filePath = "C:\\uploadfile\\" + fileName;
//		
//		File filess=new File("C:\\uploadfile\\");
//		if(!filess.exists()){
//			filess.mkdir();
//		}
//		
//		Pojo.setLocalURL(filePath);
//		Pojo.setModule("Design");
//		File dest = new File(filePath);
//		Files.copy(file.getInputStream(), dest.toPath());
//		String url = S3Utils.uploadToS3(dest, fileName);
//	    System.out.println(Pojo.getLocalURL()+Pojo.getFileName()+Pojo.getModule());
//		Pojo.setS3URL(url);
//		CHserivce.uplaodedFiles(Pojo);
//		return new ResponseResult();
//	}
//	
//	
//	@RequestMapping(value = "/DesignDownlaodedFiles", produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public List<UplaodedFiles> downlaodedFiles() {
//		Integer projectId = 123;
//		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
//				.getRequest();
//		HttpSession session = request.getSession();
//		projectId = (int) session.getAttribute("projectId");
//		List<UplaodedFiles> uf = CHserivce.downlaodedFiles(projectId);
//		return uf;
//	}
	
	
	
	
	
	
	

	@RequestMapping(value = "/insertDesign", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertDesign(@RequestBody Design Pojo) {
		System.out.println(Pojo.getwBSElement());
		Integer projectId=123;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		projectId=(int) session.getAttribute("projectId");
		Pojo.setProjectId(projectId);
		serivce.insertDesign(Pojo);
		return new ResponseResult();
	}



}
