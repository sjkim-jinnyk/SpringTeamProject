package com.spring.model;

import java.util.HashMap;
import java.util.List;

public interface CartDAO {

	// cart
	public List<CartDTO> getCartList(String id); // 특정 회원이 담은 장바구니 목록
	public List<ProductDTO> getMemCart(List<Integer> list); // 장바구니에 담긴 상품 상세정보
	public int addCart(CartDTO dto); // 장바구니에 물건 담기
	public int checkCart(CartDTO dto); // 동일한 상품이 장바구니에 있는지 확인
	public int updateAmount(CartDTO dto); // 동일한 상품이 장바구니에 담길 경우 수량 +1
	public int resetCart(String id); 	// 장바구니 비우기
	public int emptyCheck(String id);	// 장바구니가 비어있는지 확인
	public int deleteCart(CartDTO dto);	// 장바구니 상품 삭제
	public int plusCartAmount(int no);	// 장바구니 수량 1개 증가
	public int minusCartAmount(int no);	// 장바구니 수량 1개 감소
	public int deleteCartSelected(String[] checked);	// 선택된 상품 삭제
	public int setCartAmount(HashMap<String, Integer> hm);	// 장바구니 수량 증가 

}
