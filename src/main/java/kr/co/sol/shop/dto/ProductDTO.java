package kr.co.sol.shop.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDTO {
	private int		 no;
	private String name;
	private String price;
	private String detail;
	private String pr_date;
	private String stock;
	private String image;
                 
}
