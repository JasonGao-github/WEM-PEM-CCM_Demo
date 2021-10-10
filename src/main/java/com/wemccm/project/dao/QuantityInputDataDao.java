
package com.wemccm.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.QuantityInputItermGroup;
import com.wemccm.common.pojo.QuantityInputGroupDataPojo;

@Mapper
public interface QuantityInputDataDao {

	public List<QuantityInputItermGroup> listAllGroup();

	public List<QuantityInputGroupDataPojo> listQuantityInputGroupDataPojo(int projectId, int groupId);

	public List<QuantityInputGroupDataPojo> listBasicDatabyGroup(int groupId);

}