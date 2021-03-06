package com.wemccm.connectionhandover.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.wemccm.common.entity.ConnectionHandover;
import com.wemccm.common.entity.UplaodedFiles;
import com.wemccm.common.pojo.ConnectionHandoverPojo;
import com.wemccm.common.pojo.DownlaodedFilesPojo;
import com.wemccm.common.pojo.NegotiatedConnectionPojo;
import com.wemccm.common.pojo.ResponseResult;
import com.wemccm.common.util.S3Utils;
import com.wemccm.connectionhandover.service.ConnectionHandoverService;

@RestController
public class ConnectionHandoverController {

	@Autowired
	private ConnectionHandoverService serivce;

	@RequestMapping(value = "/insertConnectionHandover", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult insertConnectionHandover(@RequestBody ConnectionHandover Pojo) {
		Integer projectId = 123;

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();

		projectId = (int) session.getAttribute("projectId");

		Pojo.setProjectId(projectId);
		serivce.insertConnectionHandover(Pojo);
		return new ResponseResult();
	}

	@RequestMapping(value = "/findConnectionHandover", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ConnectionHandoverPojo findConnectionHandover() {
		Integer projectId = 123;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		projectId = (int) session.getAttribute("projectId");

		ConnectionHandoverPojo p = serivce.findConnectionHandover(projectId);
		return p;
	}

	@RequestMapping(value = "/ConnectionHandoverUplaodedFiles", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult ConnectionHandoverUplaodedFiles(@RequestPart MultipartFile file) throws IOException {
		UplaodedFiles Pojo = new UplaodedFiles();
		Integer projectId = 123;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		projectId = (int) session.getAttribute("projectId");
		Pojo.setProjectId(projectId);

		String fileName = System.currentTimeMillis()+"_"+file.getOriginalFilename() ;
		Pojo.setFileName(fileName);
		String filePath = "D:\\RMIT\\y2s2\\Jemena Project\\project\\jemena-WEM-PEM-CCM\\" + fileName;
//		String filePath = "C:\\git_workplace\\jemena-WEM-PEM-CCM\\jemena-WEM-PEM-CCM\\src\\main\\resource\\uploadfile\\" + fileName;

//		String filePath = "C:\\uploadfile\\" + fileName;
		
		File filess=new File("C:\\uploadfile\\");
		if(!filess.exists()){
			filess.mkdir();
		}
		
		Pojo.setLocalURL(filePath);
		Pojo.setModule("ConnectionHandover");
		File dest = new File(filePath);
		Files.copy(file.getInputStream(), dest.toPath());
		String url = S3Utils.uploadToS3(dest, fileName);
	    System.out.println(Pojo.getLocalURL()+Pojo.getFileName()+Pojo.getModule());
		Pojo.setS3URL(url);
		serivce.uplaodedFiles(Pojo);
		return new ResponseResult();
	}

	@RequestMapping(value = "/ConnectionHandoverDownlaodedFiles", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<UplaodedFiles> ConnectionHandoverDownlaodedFiles() {
		Integer projectId = 123;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		projectId = (int) session.getAttribute("projectId");
		
		DownlaodedFilesPojo pojo=new DownlaodedFilesPojo();
		pojo.setProjectId(projectId);
		pojo.setModule("ConnectionHandover");
		
		
		
		List<UplaodedFiles> uf = serivce.downlaodedFiles(pojo);
		return uf;
	}

	
	@RequestMapping(value = "/DesignUplaodedFiles", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResponseResult DesignUplaodedFiles(@RequestPart MultipartFile file) throws IOException {
		UplaodedFiles Pojo = new UplaodedFiles();
		Integer projectId = 123;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		projectId = (int) session.getAttribute("projectId");
		Pojo.setProjectId(projectId);

		String fileName = System.currentTimeMillis()+"_"+file.getOriginalFilename() ;
		Pojo.setFileName(fileName);

		String filePath = "C:\\uploadfile\\" + fileName;
		
		File filess=new File("C:\\uploadfile\\");
		if(!filess.exists()){
			filess.mkdir();
		}
		
		Pojo.setLocalURL(filePath);
		Pojo.setModule("Design");
		File dest = new File(filePath);
		Files.copy(file.getInputStream(), dest.toPath());
		String url = S3Utils.uploadToS3(dest, fileName);
	    System.out.println(Pojo.getLocalURL()+Pojo.getFileName()+Pojo.getModule());
		Pojo.setS3URL(url);
		serivce.uplaodedFiles(Pojo);
		return new ResponseResult();
	}
	
	
	@RequestMapping(value = "/DesignDownlaodedFiles", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<UplaodedFiles> DesignDownlaodedFiles() {
		Integer projectId = 123;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		HttpSession session = request.getSession();
		projectId = (int) session.getAttribute("projectId");
		
		DownlaodedFilesPojo pojo=new DownlaodedFilesPojo();
		pojo.setProjectId(projectId);
		pojo.setModule("Design");
		
		
		
		List<UplaodedFiles> uf = serivce.downlaodedFiles(pojo);
		return uf;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
