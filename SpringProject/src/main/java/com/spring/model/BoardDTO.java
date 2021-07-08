package com.spring.model;

import lombok.Data;

@Data
public class BoardDTO {

	private int board_no;
	private String board_title;
	private String board_cont;
	private String board_date;
	private int  board_hit;
}
