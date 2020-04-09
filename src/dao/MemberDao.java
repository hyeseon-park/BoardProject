package dao;

import model.Member;

public interface MemberDao {
	public int insertMember(Member member);

	public Member selectMember(int num);

	public Member selectMemberByID(String mID);
}
