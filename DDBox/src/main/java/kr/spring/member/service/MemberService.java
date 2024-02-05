package kr.spring.member.service;


import kr.spring.member.vo.MemberVO;

public interface MemberService {
	//회원관리 - 사용자
	public void insertMember(MemberVO member);
	public MemberVO selectCheckMember(String mem_id);
	public MemberVO selectMember(int mem_num);
	public void updateMember(MemberVO member);
	public void updateMember_detail(MemberVO member);
	public void updatePassword(MemberVO member);
	
	public int selectCheckMemberRegistered(MemberVO member);
	
	//public void deleteMember(int mem_num); 디테일만 지우고 member 테이블은 지우지말자 일단
	public void deleteMember_detail(int mem_num);


	//자동 로그인
	public void updateAutoid(String mem_autoid, int mem_num);
	public MemberVO selectAutoid(String autoid);
	public void deleteAutoid(int mem_num);

	//프로필 이미지 업데이트
	public void updateProfile(MemberVO member);
	//회원관리 - 관리자
		
}
