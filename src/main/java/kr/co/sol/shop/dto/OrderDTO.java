package kr.co.sol.shop.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {
	private int  	 no;
	private String   quantity;
	private String   or_date;
	private String   state;
	private String   id;
	
}
