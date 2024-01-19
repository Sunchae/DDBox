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
	private int auth;
	private byte[] mem_photo;
	private String mem_photoname;
}




