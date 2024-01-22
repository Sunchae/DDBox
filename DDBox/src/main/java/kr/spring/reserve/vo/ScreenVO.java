package kr.spring.reserve.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScreenVO {
	private int scr_num;
	private String scr_name;
	private String src_do;
	private String src_si;
	private int scr_type;
	private int scr_seatTotal;
	private int scr_seatLine;
	private int scr_seatRow;
}
