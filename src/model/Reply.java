package model;

public class Reply {
	private int rNum;
	private String rName;
	private String rPass;
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
	public String getrPass() {
		return rPass;
	}
	public void setrPass(String rPass) {
		this.rPass = rPass;
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
		return "Reply [rNum=" + rNum + ", rName=" + rName + ", rPass=" + rPass + ", rContent=" + rContent + ", bNum="
				+ bNum + "]";
	}
}
