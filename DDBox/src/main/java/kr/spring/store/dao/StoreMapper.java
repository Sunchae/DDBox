package kr.spring.store.dao;

import java.util.List;
import java.util.Map;

import kr.spring.store.vo.StoreVO;

public interface StoreMapper {
	public List<StoreVO> selectList(Map<String, Object> map);		//xml
	public void insertStore(StoreVO store);							//xml
	public StoreVO selectStoreVO(int Store_num);
	public void updateStore(StoreVO store);
	public void deleteStore(int store_num);
}
