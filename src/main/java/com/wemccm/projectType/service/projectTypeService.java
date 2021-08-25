package com.wemccm.projectType.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wemccm.projectType.dao.projectTypeDao;

@Service
public class projectTypeService {
	@Autowired
	private projectTypeDao Dao;

	public String projectType(int id, String description, String name) {

		Dao.projectType(id, description, name);

		return "00";
	}
}
