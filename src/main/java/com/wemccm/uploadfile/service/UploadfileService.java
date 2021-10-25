package com.wemccm.uploadfile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.common.entity.QuantityInputBasicData;
import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.IdPojo;
import com.wemccm.common.pojo.QuantityInputBasicDataGroupPojo;
import com.wemccm.common.pojo.QuantityInputDetailPojo;
import com.wemccm.common.pojo.QuantityInputItermGroupIdPojo;
import com.wemccm.common.pojo.QuantityInputPojo;
import com.wemccm.common.pojo.UploadfilePojo;
import com.wemccm.common.pojo.projectIdPojo;
import com.wemccm.quantityinput.dao.QuantityInputDao;
import com.wemccm.uploadfile.dao.UploadfileDao;

@Service
public class UploadfileService {

	@Autowired
	private UploadfileDao qiDao;

	


	public void insertUploadfile(UploadfilePojo pojo) {
		qiDao.insertUploadfile(pojo);
		
	}

}
