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
	   private int mem_num;
	   private Date entry_date;
	   private String mem_id;
	   private String event_title;
	//private String event_start;
	//private String event_end;
}
