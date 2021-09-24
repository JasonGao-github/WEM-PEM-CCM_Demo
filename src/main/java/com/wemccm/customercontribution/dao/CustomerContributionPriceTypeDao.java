package com.wemccm.customercontribution.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.CustomerContributionPriceType;

@Mapper
public interface CustomerContributionPriceTypeDao {

	public List<CustomerContributionPriceType> listAll();

}
