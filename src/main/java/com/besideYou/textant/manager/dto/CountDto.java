package com.besideYou.textant.manager.dto;

public class CountDto {
	private String visitDate;
	private String visitCount;
	
	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	public String getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}
	@Override
	public String toString() {
		return "CountDto [visitDate=" + visitDate + ", visitCount=" + visitCount + "]";
	}
	
}
