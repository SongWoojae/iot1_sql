package com.iot1.sql.vendor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.vendor.dao.VendorDAO;
import com.iot1.sql.vendor.dto.VendorInfo;

@Service
public class VendorServiceImpl implements VendorService {
	
	@Autowired
	VendorDAO vDao;

	@Override
	public VendorInfo getVendorInfo(VendorInfo vi) {
		// TODO Auto-generated method stub
		return vDao.selectVendorInfo(vi);
	}

	@Override
	public List<VendorInfo> getVendorInfoList(VendorInfo vi) {
		// TODO Auto-generated method stub
		return vDao.selectVendorInfoList(vi);
	}

	@Override
	public List<VendorInfo> getVendorInfoCombo() {
		// TODO Auto-generated method stub
		return vDao.comboVendorInfo(vi);
	}

	@Override
	public int insertVendorInfoList(VendorInfo[] viList) {
		int result = 0;
		for(VendorInfo vi : viList){
			result += vDao.insertVendorInfo(vi);
		}
		return result;
	}

	@Override
	public int insertVendorInfo(VendorInfo vi) {
		// TODO Auto-generated method stub
		return vDao.insertVendorInfo(vi);
	}

	@Override
	public int updateVendorInfo(VendorInfo vi) {
		// TODO Auto-generated method stub
		return vDao.updateVendorInfo(vi);
	}

	@Override
	public int deleteVendorInfo(VendorInfo vi) {
		// TODO Auto-generated method stub
		return vDao.deleteVendorInfo(vi);
	}

}
