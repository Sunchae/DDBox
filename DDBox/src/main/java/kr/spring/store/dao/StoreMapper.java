package kr.spring.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.store.vo.StoreVO;

@Mapper
public interface StoreMapper {
	public List<StoreVO> selectList(Map<String, Object> map);		//xml
	public int selectRowCount(Map<String, Object> map);				//xml
	public void insertStore(StoreVO store);							//xml
	public StoreVO selectStore(int store_num);						//xml
	public void updateStore(StoreVO store);
	public void deleteStore(int store_num);
	public void deleteFile(int store_num);
}
