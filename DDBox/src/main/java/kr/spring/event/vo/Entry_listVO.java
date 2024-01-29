package kr.spring.event.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Entry_listVO {
	private int entry_num;
	private int event_num;
	private int event_type;
	private int mem_num;
	private Date entry_date;
	
	private int event_point;
}
