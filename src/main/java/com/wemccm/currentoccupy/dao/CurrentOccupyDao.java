package com.wemccm.currentoccupy.dao;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.wemccm.common.entity.CurrentOccupy;



	@Mapper
	public interface CurrentOccupyDao {





		public void createCurrentOccupy(
				@Param("0")Integer pid, 
				@Param("1")Integer uid);

		public CurrentOccupy getCurrentOccupy(@Param("0")Integer pid);

		public void updateCurrentOccupy(@Param("0")Integer pid, @Param("1")Integer uid);

		public void deleteCurrentOccupy(@Param("0")Integer pid, @Param("1")Integer uid);

		
		
	}


