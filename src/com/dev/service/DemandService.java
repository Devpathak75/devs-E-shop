package com.dev.service;

import java.util.List;

import com.dev.beans.DemandBean;

public interface DemandService {

	public boolean addProduct(String userId, String prodId, int demandQty);

	public boolean addProduct(DemandBean userDemandBean);

	public boolean removeProduct(String userId, String prodId);

	public List<DemandBean> haveDemanded(String prodId);

}
