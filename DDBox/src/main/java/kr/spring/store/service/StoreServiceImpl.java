package kr.spring.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.spring.store.dao.StoreMapper;
import kr.spring.store.vo.StoreVO;

public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreMapper storeMapper;

	@Override
	public List<StoreVO> selectList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertStore(StoreVO store) {
		storeMapper.insertStore(store);
	}

	@Override
	public StoreVO selectStoreVO(int Store_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateStore(StoreVO store) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStore(int store_num) {
		// TODO Auto-generated method stub
		
	}

}
