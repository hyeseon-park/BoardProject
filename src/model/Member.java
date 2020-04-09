package model;

public class Member {
	private int mNum;
	private String mID;
	private String mPass;
	private String mName;
	
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public String getmID() {
		return mID;
	}
	public void setmID(String mID) {
		this.mID = mID;
	}
	public String getmPass() {
		return mPass;
	}
	public void setmPass(String mPass) {
		this.mPass = mPass;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	@Override
	public String toString() {
		return "Member [mNum=" + mNum + ", mID=" + mID + ", mPass=" + mPass + ", mName=" + mName + "]";
	}
}
