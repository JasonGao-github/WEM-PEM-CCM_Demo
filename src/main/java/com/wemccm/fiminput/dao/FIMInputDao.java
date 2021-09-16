package com.wemccm.fiminput.dao;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.FIMinputIterm;
import com.wemccm.common.entity.FIMinputItermQuantityType;
import com.wemccm.common.entity.FIMinputSubType;
import com.wemccm.common.entity.FIMinputType;
import com.wemccm.common.pojo.FIMinputItermPojo;
import com.wemccm.common.pojo.FIMinputItermQuantityPojo;
import com.wemccm.common.pojo.FIMinputSubTypePojo;




	@Mapper
	public interface FIMInputDao {



		public List<FIMinputType> selectAllFIMinputType();

		public List<FIMinputSubType> findFIMinputSubType(FIMinputSubTypePojo requestPojo);

		public List<FIMinputItermQuantityType> selectAllFIMinputItermQuantityType();

		public void insertFIMinputItermQuantity(FIMinputItermQuantityPojo requestPojo);

		public List<FIMinputIterm> findFIMinputIterm(FIMinputItermPojo requestPojo);




		
		
	}


