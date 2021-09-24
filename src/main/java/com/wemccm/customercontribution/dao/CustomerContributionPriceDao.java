package com.wemccm.customercontribution.dao;

import org.apache.ibatis.annotations.Mapper;

import com.wemccm.common.entity.CustomerContributionPrice;

@Mapper
public interface CustomerContributionPriceDao {

	public void save(CustomerContributionPrice ccPrice);

}
