package kr.spring.reserve.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CGVVO {
	private String rank_check_time;
	private String seq;
	private String movie_rank;
	private String movie_nm;
	private String movie_reserve;
	private String score;
	private String open_day;
	private String reg_id;
	private String reg_dt;
	private String chg_id;
	private String chg_dt;
}
