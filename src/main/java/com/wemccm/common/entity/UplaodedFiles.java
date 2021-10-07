package com.wemccm.common.entity;

public class UplaodedFiles extends BaseEntity {

	private String fileName;
	private Integer projectId;
	private String module; 			//page name
	private String localURL;
	private String s3URL;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public String getLocalURL() {
		return localURL;
	}

	public void setLocalURL(String localURL) {
		this.localURL = localURL;
	}

	public String getS3URL() {
		return s3URL;
	}

	public void setS3URL(String s3url) {
		s3URL = s3url;
	}

}
