package kr.spring.reserve.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.spring.reserve.vo.CGVVO;

@Mapper
public interface CGVMapper {
	int InsertMovieInfo(CGVVO cgv) throws Exception;
}
