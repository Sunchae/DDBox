package kr.spring.store.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.store.dao.StoreMapper;
import kr.spring.store.vo.StoreVO;

@Service
@Transactional
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreMapper storeMapper;

	@Override
	public List<StoreVO> selectList(Map<String, Object> map) {
		return storeMapper.selectList(map);
	}

	@Override
	public void insertStore(StoreVO store) {
		storeMapper.insertStore(store);
	}

	@Override
	public StoreVO selectStore(int store_num) {
		return storeMapper.selectStore(store_num);
	}

	@Override
	public void updateStore(StoreVO store) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteStore(int store_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return storeMapper.selectRowCount(map);
	}

	@Override
	public void deleteFile(int store_num) {
		// TODO Auto-generated method stub
		
	}

}
