package com.spring.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<ProductDTO> getMemCart(List<Integer> list) {
		
		return this.sqlSession.selectList("memCart", list);
	}

	@Override
	public List<CartDTO> getCartList(String id) {
		
		return this.sqlSession.selectList("cartList", id);
	}

	@Override
	public int addCart(CartDTO dto) {
		
		return this.sqlSession.insert("addCart", dto);
	}

	@Override
	public int checkCart(CartDTO dto) {
		
		return this.sqlSession.selectOne("checkCart", dto);
	}

	@Override
	public int updateAmount(CartDTO dto) {
		
		return this.sqlSession.update("updateAmount", dto);
	}

	@Override
	public int resetCart(String id) {
		
		return this.sqlSession.delete("resetCart", id);
	}

	@Override
	public int emptyCheck(String id) {
		
		return this.sqlSession.selectOne("emptyCheck", id);
	}

	@Override
	public int deleteCart(CartDTO dto) {
		
		return this.sqlSession.delete("deleteCart", dto);
	}

	@Override
	public int plusCartAmount(int no) {
		
		return this.sqlSession.update("plusCartAmount", no);
	}

	@Override
	public int minusCartAmount(int no) {
		
		return this.sqlSession.update("minusCartAmount", no);
	}

	@Override
	public int deleteCartSelected(String[] checked) {
		
		return this.sqlSession.delete("deleteCartSelected", checked);
	}
	

}
