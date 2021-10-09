package com.wemccm.uploadfile.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.wemccm.common.util.S3Utils;

@Controller
public class UploadFileController {

	private static final String FILE_PATH = "/wemccm_upload";

	@PostMapping("/upload")
	@ResponseBody
	public String create(@RequestPart MultipartFile file) throws IOException {
		String fileName = file.getOriginalFilename();
		String filePath = FILE_PATH + fileName;
		File dest = new File(filePath);
		Files.copy(file.getInputStream(), dest.toPath());

		S3Utils.uploadToS3(dest, fileName);

		return "Upload file success : " + dest.getAbsolutePath();
	}

	@RequestMapping("/download")
	public String fileDownLoad(HttpServletResponse response, @RequestParam("fileName") String fileName) {
		File file = new File(FILE_PATH + '/' + fileName);
		if (!file.exists()) {
			return "the file is not exist";
		}
		response.reset();
		response.setContentType("application/octet-stream");
		response.setCharacterEncoding("utf-8");
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", "attachment;filename=" + fileName);

		try (BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));) {
			byte[] buff = new byte[1024];
			OutputStream os = response.getOutputStream();
			int i = 0;
			while ((i = bis.read(buff)) != -1) {
				os.write(buff, 0, i);
				os.flush();
			}
		} catch (IOException e) {
			return "download fail";
		}
		return "download success";
	}

}
