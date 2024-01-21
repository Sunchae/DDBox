package kr.spring.member.vo;

import java.io.IOException;
import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
//ToString이 재정의될 때 photo의 값을 반환하지 않음 
@ToString(exclude = {"mem_photo"})
public class MemberVO {
	private int mem_num;
	@Pattern(regexp="^[A-Za-z0-9]{4,12}$")
	private String mem_id;
	private int mem_auth;
	@NotBlank
	private String mem_name;
	
	private String mem_birth;
	private String mem_nickname;
	private String mem_autoid;	//아이디 저장 기능 
	@Pattern(regexp="^[A-Za-z0-9]{4,12}$")
	private String mem_pw;
	private String mem_nowpw;	//비밀번호 일치여부 체크 
	@NotBlank
	private String mem_phone;
	@Email
	@NotBlank
	private String mem_email;
	@Size(min=5,max=5)
	private String mem_zipcode;
	@NotBlank
	private String mem_address1;
	@NotEmpty
	private String mem_address2;
	private Date mem_regdate;
	private Date mem_modifydate;
	
	private String mem_gender;
	private String mem_age;
	private int mem_grade;
	
	private byte[] mem_photo;
	private String mem_photoname;
	
	/*=========================
	 * 비밀번호 일치 여부 체크
	 *=========================*/
	public boolean isCheckedPassword(String userPasswd) {
		if(mem_auth >= 1 && mem_pw.equals(userPasswd)) {
			return true;
		}
		return false;
	}
	
	/*=========================
	 * 이미지 BLOB 처리
	 *=========================*/
	//폼에서 파일업로드 파라미터네임은 반드시 upload로 지정해야 함
	public void setUpload(MultipartFile upload)throws IOException{
		//MultipartFile -> byte[]
		setMem_photo(upload.getBytes());
		//파일명 지정
		setMem_photoname(upload.getOriginalFilename());
	}
	
	
}




