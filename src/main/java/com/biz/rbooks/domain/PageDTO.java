package com.biz.rbooks.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class PageDTO {

	private long totalCount;
	
	private int offset;
	private int limit;
	
	private int listPerPage;
	private int pageCount;
	
	private int firstPageNo;
	private int finalPageNo;
	
	private int prePageNo;
	private int nextPageNo;
	
	private int startPageNo;
	private int endPageNo;
	
	private int currentPageNo;
}
