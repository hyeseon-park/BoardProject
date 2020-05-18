package model;

public class Reply {
	private int rNum;
	private String rName;
	private String rPW;
	private String rContent;
	private int bNum;
	
	public int getrNum() {
		return rNum;
	}
	public void setrNum(int rNum) {
		this.rNum = rNum;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrPW() {
		return rPW;
	}
	public void setrPW(String rPW) {
		this.rPW = rPW;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	@Override
	public String toString() {
		return "Reply [rNum=" + rNum + ", rName=" + rName + ", rPW=" + rPW + ", rContent=" + rContent + ", bNum="
				+ bNum + "]";
	}
}
