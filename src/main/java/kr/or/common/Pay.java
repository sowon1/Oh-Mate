package kr.or.common;

import lombok.Data;

@Data
public class Pay {
	private int payNo;					//결제번호
	private int payCategory;			//구분 		1.헬프 2.입주
	private int payGoods;				//상품번호		헬프no / 방 no
	private String payId;				//아이디
	private String payName;				//이름
	private String payNum;				//고유식별번호 , 주문번호
	private String payPrice;			//결제금액
	private String payDate;				//결제시각 YYYY-MM-DD HH:mm:SS
	private String payWay;				//결제수단
	private String payStatus;			//결제 상태 결제완료 / 결제취소
	private String cancelDate;			//취소일시 (YYYY-MM-DD HH:mm:SS)
}
