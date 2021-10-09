package com.wemccm.contractschedule.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.AssetRelocation;
import com.wemccm.common.entity.NegotiatedConnection;
import com.wemccm.common.entity.URD;
import com.wemccm.common.pojo.AssetRelocationPojo;
import com.wemccm.common.pojo.NegotiatedConnectionPojo;
import com.wemccm.common.pojo.URDPojo;

@Mapper
public interface ContractScheduleDao {



	public NegotiatedConnectionPojo findNCinCC(Integer projectId);

	public void insertNegotiatedConnection(NegotiatedConnection pojo);

	public URDPojo findURDinCC(Integer projectId);

	public void insertURD(URD pojo);

	public AssetRelocationPojo findARinCC(Integer projectId);

	public void insertAssetRelocation(AssetRelocation pojo);

}
