package com.wemccm.common.pojo;

import java.util.List;

import com.wemccm.common.util.SR;

public class ResponseResult {

	private String result;
	private String massage;
	private String projectStatus;// "new","existing";
	private List data;

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public ResponseResult() {
		super();
		this.result = SR.REQUEST_RESULT_SUCCESS;
		this.massage = "";
	}

	public ResponseResult(String result, String massage) {
		super();
		this.result = result;
		this.massage = massage;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMassage() {
		return massage;
	}

	public void setMassage(String massage) {
		this.massage = massage;
	}

}
