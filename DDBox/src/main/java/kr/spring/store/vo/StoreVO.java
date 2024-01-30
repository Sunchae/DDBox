package kr.spring.store.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StoreVO {
	private int store_num;
	@NotBlank
	private String store_title;
	@NotBlank
	private String store_content;
	private int store_price;
	private MultipartFile upload;
	private String store_photo;
	private String store_name;
	private int store_type;
	private Date store_reg_date;
	private Date store_modify_date;
	private int store_status;
	private String store_ip;
	private int mem_num;
}
