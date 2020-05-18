package model;

public class Board {
	private int bNum;
	private String bTitle;
	private String bContent;
	private String bPW;
	private String bName;
	private String fName;
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public String getbPW() {
		return bPW;
	}
	public void setbPW(String bPW) {
		this.bPW = bPW;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	@Override
	public String toString() {
		return "Board [bNum=" + bNum + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bPW=" + bPW + ", bName="
				+ bName + ", fName=" + fName + "]";
	}
	
}
