package kr.spring.member.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	//회원관리 - 사용자
	@Select("SELECT member_seq.nextval FROM dual")
	public int selectMem_num();
	@Insert("INSERT INTO member (mem_num,mem_id) VALUES (#{mem_num},#{mem_id})")
	public void insertMember(MemberVO member);
	public void insertMember_detail(MemberVO member);
	
	public int selectCheckMemberRegistered(MemberVO member);
	
	public MemberVO selectCheckMember(String mem_id);
	@Select("SELECT * FROM member JOIN member_detail USING (mem_num) WHERE mem_num=#{mem_num}")
	public MemberVO selectMember(int mem_num);
	public void updateMember(MemberVO member);
	public void updateMember_detail(MemberVO member);
	public void updatePassword(MemberVO member);
	//public void deleteMember(int mem_num); 디테일만 지우고 member 테이블은 지우지말자 일단
	public void deleteMember_detail(int mem_num);
	
	//자동 로그인
	@Update("UPDATE member_detail SET mem_autoid=#{autoid} WHERE mem_num=#{mem_num}")
	public void updateAutoid(String autoid, int mem_num);
	public void selectAutoid(String autoid);
	public void deleteAutoid(int mem_num);
	//프로필 이미지 업데이트
	@Update("UPDATE member_detail SET mem_photo=#{mem_photo},mem_photoname=#{mem_photoname} WHERE mem_num=#{mem_num}")
	public void updateProfile(MemberVO member);
	//회원관리 - 관리자
	
}
