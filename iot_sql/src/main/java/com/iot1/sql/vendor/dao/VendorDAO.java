package com.iot1.sql.vendor.dao;

import java.util.List;

import com.iot1.sql.vendor.dto.VendorInfo;

public interface VendorDAO {

	public VendorInfo selectVendorInfo(VendorInfo vi);
	public List<VendorInfo> selectVendorInfoList(VendorInfo vi);
}
