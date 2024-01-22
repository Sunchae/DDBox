package kr.spring.question.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class QuestionVO {
	private int board_num;
	@NotBlank
	private int board_category;
	@NotBlank
	private String board_title;
	@NotBlank
	private String board_content;
	private Date board_regdate;
	private int board_hit;
}
