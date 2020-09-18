package com.project.domain;

import java.io.Serializable;

public class Page implements Serializable {

	private Integer currentPage;
	private Integer pageSize = 20;
	private Integer totalPageCount;
	private Integer messageCount;

	public Page() {
	}

	public Page(Integer currentPage, Integer pageSize, Integer totalPageCount, Integer messageCount) {
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalPageCount = totalPageCount;
		this.messageCount = messageCount;
	}

	public Integer getCurrentPage() {
		if (currentPage == null) {
			currentPage = 1;
		} else if (currentPage > getTotalPageCount()) {
			currentPage = getTotalPageCount();
		} else if (currentPage <= 0) {
			currentPage = 1;
		}
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPageCount() {
		totalPageCount = this.getMessageCount() % pageSize == 0 ? getMessageCount() / pageSize
				: getMessageCount() / pageSize + 1;
		return totalPageCount;
	}

	public void setTotalPageCount(Integer totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public Integer getMessageCount() {
		return messageCount;
	}

	public void setMessageCounts(Integer messageCount) {
		this.messageCount = messageCount;
	}

	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalPageCount=" + totalPageCount
				+ ", messageCount=" + messageCount + "]";
	}

}
