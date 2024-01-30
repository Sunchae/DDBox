package kr.spring.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.store.vo.StoreVO;

@Mapper
public interface StoreMapper {
	@Select("SELECT * FROM (SELECT store_num,store_title,store_content,store_price,store_photo,store_name FROM store JOIN member USING(mem_num))")
	public List<StoreVO> selectList(Map<String, Object> map);
	@Select("SELECT COUNT(*) FROM store JOIN member USING(mem_num)")
	public int selectRowCount(Map<String, Object> map);
	public void insertStore(StoreVO store);							//xml
	@Select("SELECT * FROM store JOIN member USING(mem_num) WHERE store_num=#{store_num}")
	public StoreVO selectStore(int store_num);						
	public void updateStore(StoreVO store);							//xml
	@Delete("DELETE FROM store WHERE store_num=#{store_num}")
	public void deleteStore(int store_num);
	@Update("UPDATE store SET store_photo='' WHERE store_num=#{store_num}")
	public void deleteFile(int store_num);
}
