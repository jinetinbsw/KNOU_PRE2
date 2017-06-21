package kr.or.possys.Member_sevice;

public class mVo {
	String selBox;
	String search;
	int beginRow;
	int pagePerRow;
	
	public int getBeginRow() {
		return beginRow;
	}
	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}
	public int getPagePerRow() {
		return pagePerRow;
	}
	public void setPagePerRow(int pagePerRow) {
		this.pagePerRow = pagePerRow;
	}
	public String getSelBox() {
		return selBox;
	}
	public void setSelBox(String selBox) {
		this.selBox = selBox;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
