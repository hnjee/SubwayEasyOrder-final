package com.subway.s1.payment;

import java.util.Date;
import java.util.List;

import com.subway.s1.orderProduct.OrderProductVO;

import lombok.Data;

@Data
public class PaymentVO {
	
	private String payNum;
	private int totalPrice;
	private Date payDate;
	private String id;
	private int refund;
	private String storeNum;
	private int orderInfo;
	private String payTime;
	
	private List<OrderProductVO> orderItems;
	private int menuCounts;
	
	
}
