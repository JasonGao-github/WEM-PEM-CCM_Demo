package com.wemccm.uploadfile.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.QuantityInputBasicData;
import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.IdPojo;
import com.wemccm.common.pojo.QIDataPojo;
import com.wemccm.common.pojo.QuantityInputBasicDataGroupPojo;
import com.wemccm.common.pojo.QuantityInputDetailPojo;
import com.wemccm.common.pojo.QuantityInputItermGroupIdPojo;
import com.wemccm.common.pojo.QuantityInputPojo;
import com.wemccm.common.pojo.UploadfilePojo;
import com.wemccm.common.pojo.projectIdPojo;

@Mapper
public interface UploadfileDao {



	void insertUploadfile(UploadfilePojo pojo);

}
