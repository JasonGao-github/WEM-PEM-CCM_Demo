package com.wemccm.quantityinput.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.QuantityInputIterm;
import com.wemccm.common.entity.QuantityInputItermType;
import com.wemccm.common.pojo.QuantityInputBasicDataListPojo;
import com.wemccm.common.pojo.QuantityInputItermDetailPojo;
import com.wemccm.common.pojo.QuantityInputItermPojo;
import com.wemccm.common.pojo.QuantityInputItermTypeIdPojo;
import com.wemccm.common.pojo.QuantityInputItermTypePojo;
import com.wemccm.common.pojo.QuantityInputPojo;

@Mapper
public interface QuantityInputDao {
	//

	public List<QuantityInputItermType> selectAllQuantityInputItermType();

	public List<QuantityInputItermType> findQuantityInputItermType(QuantityInputItermTypePojo requestPojo);

	public List<QuantityInputBasicDataListPojo> findTableI(QuantityInputItermPojo requestPojo);

	public List<QuantityInputItermDetailPojo> findTableSTPAndST(Integer id);

	public void insertQuantityInput(QuantityInputPojo requestPojo);

	public List<QuantityInputIterm> findQuantityInputIterm(QuantityInputItermTypeIdPojo requestPojo);

}
