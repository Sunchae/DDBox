package kr.spring.store.service;

import java.util.List;
import java.util.Map;

import kr.spring.store.vo.StoreVO;

public interface StoreService {
	public List<StoreVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insertStore(StoreVO store);
	public StoreVO selectStoreVO(int Store_num);
	public void updateStore(StoreVO store);
	public void deleteStore(int store_num);
	public void deleteFile(int store_num);
}
