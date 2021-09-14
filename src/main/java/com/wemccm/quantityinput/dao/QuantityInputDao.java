package com.wemccm.quantityinput.dao;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.wemccm.common.entity.QuantityInputItermType;
import com.wemccm.common.pojo.QuantityInputItermPojo;
import com.wemccm.common.pojo.QuantityInputItermTypePojo;
import com.wemccm.common.pojo.ThreeQuantityInputItermTable;



	@Mapper
	public interface QuantityInputDao {





		public List<QuantityInputItermType> selectAllQuantityInputItermType();

		public List<QuantityInputItermType> findQuantityInputItermType(QuantityInputItermTypePojo requestPojo);

		public List<ThreeQuantityInputItermTable> threeQuantityInputItermTable(QuantityInputItermPojo requestPojo);

		
		
	}


