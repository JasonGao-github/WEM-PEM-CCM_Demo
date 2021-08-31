package com.wemccm.currentoccupy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wemccm.common.entity.CurrentOccupy;
import com.wemccm.currentoccupy.dao.CurrentOccupyDao;

@Service
public class CurrentOccupyService {

	@Autowired
	private CurrentOccupyDao Dao;

	public String createCurrentOccupy(Integer pid, Integer uid) {
			
		CurrentOccupy co = Dao.getCurrentOccupy(pid);
		if (null== co) {
			System.out.println(pid+"++++++++++++++++"+ uid);
			Dao.createCurrentOccupy(pid, uid);
	
		}else {

		System.out.println(pid+"++++++++++++++++"+ uid);
			Dao.updateCurrentOccupy(pid, uid);


			
		}
		return "00";
	}

	public CurrentOccupy findCurrentOccupy(Integer pid) {
		
		
		CurrentOccupy co = Dao.getCurrentOccupy(pid);
		System.out.println(pid+"++++++++++++++++");
		return co;
	}

	public void deleteCurrentOccupy(Integer pid, Integer uid) {
		
		Dao.deleteCurrentOccupy(pid, uid);
		
	}

	
}
