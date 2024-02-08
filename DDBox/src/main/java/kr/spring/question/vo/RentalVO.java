package kr.spring.question.vo;

import java.sql.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RentalVO {
	private int rental_num;
	private int mem_num;
	private Integer scr_num; //영화관
	private Date rental_regdate;
	private Date rental_date;
	private Date rental_modifydate;
	private int rental_per;
	@NotBlank
	private String rental_content;
	@NotBlank
	private String rental_name;
	@NotBlank
	private String rental_phone;
	@Email
	private String rental_email;
	private int rental_status;
	
}
