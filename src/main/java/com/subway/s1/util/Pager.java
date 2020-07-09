package com.subway.s1.util;

import lombok.Data;

@Data
public class Pager {
	
	private Long curPage; // 페이지 번호 //아래에 써있는 1,2,3,...
	private Integer perPage;
	private long startRow;
	private long lastRow;
	
	private long totalPage;
	private long totalBlock;
	private long curBlock;
	
	private long startNum;
	private long lastNum;
	
	private String kind;
	private String search;

	
	public void makeRow() {
		this.startRow=((this.getCurPage()-1)*this.getPerPage());
		this.lastRow=(this.getCurPage()*this.getPerPage());
	}
	
	//Service에서 호출
	public void makePage(long totalCount) {
		
		this.totalPage=totalCount/this.getPerPage();
		if(totalCount%this.getPerPage() !=0) {
			this.totalPage++;
		}
		
		long perBlock=10L;  //밑에 깔리는 숫자
		this.totalBlock=totalPage/perBlock;
		
		if(totalPage%perBlock !=0) {
			this.totalBlock++;
		}
		
		this.curBlock=this.curPage/perBlock;
		if(this.curPage%perBlock!=0) {
			this.curBlock++;
		}
		
		this.startNum=(this.curBlock-1)*perBlock+1;
		this.lastNum = curBlock*perBlock;
		
		if(this.curBlock==this.totalBlock) {
			this.lastNum=this.totalPage;
		}

	}//end makePage

	
	public Long getCurPage() {
		
		if(this.curPage==null || this.curPage==0) {
			this.curPage=1L;
		}
		return curPage;
	}
	public void setCurPage(Long curPage) {
		this.curPage = curPage;
	}
	public Integer getPerPage() {
		//파라미터 값이 null일때 자동으로 들어올 수 있도록
		if(this.perPage==null || this.perPage==0) {
			this.perPage=10;
		}
		return perPage;
	}
	public void setPerPage(Integer perPage) {
		this.perPage = perPage;
	}
	
}
