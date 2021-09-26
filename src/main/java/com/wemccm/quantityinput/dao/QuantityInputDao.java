package com.wemccm.quantityinput.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.QuantityInputBasicData;
import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.QIDataPojo;
import com.wemccm.common.pojo.QuantityInputDetailPojo;
import com.wemccm.common.pojo.QuantityInputItermGroupIdPojo;
import com.wemccm.common.pojo.QuantityInputPojo;
import com.wemccm.common.pojo.projectIdPojo;

@Mapper
public interface QuantityInputDao {

	List<QuantityInputItermGroup> selectAllQuantityInputItermGroup();
	

	List<QuantityInputBasicData> findQuantityInputBasicData(QuantityInputItermGroupIdPojo requestPojo);

	void insertQuantityInputBasicData(QuantityInputBasicData data);


	List<QuantityInputDetailPojo> findTableI(projectIdPojo requestPojo);


	List<QIDataPojo> findTableBDAndIG(Integer quantityInputBasicDataId);


	void insertQuantityInput(QuantityInputPojo quantityInputPojo);


	List<QuantityInputDetailPojo> findQuantityInputDetail(projectIdPojo requestPojo);



}
