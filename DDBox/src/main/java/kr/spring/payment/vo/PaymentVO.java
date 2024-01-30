package kr.spring.payment.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class PaymentVO {
	private String paymentCode;
	private String paymentGroupCode;
	private String mem_email;
	private String paymentMethodCode;
	private String paymentMethodName;
	private int paymentTotalOrderPrice;
	private int paymentUsePoint;
	private int paymentTotlaPayPrice;
	private int paymentState;
	private Date paymentRegDate;
}
