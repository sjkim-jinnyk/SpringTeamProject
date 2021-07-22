package com.spring.model;

import lombok.Data;

@Data
public class QnaDTO {

	private int qna_no;
	private String qna_writer;
	private int qna_pro;
	private String qna_title;
	private String qna_cont;
	private int qna_order_no;
	private int qna_category_no;
	private String qna_date;
	private int qna_group;
	private int qna_step;
	private int qna_secret;
	
	private QnaDTO qnaDTO;
	
}
