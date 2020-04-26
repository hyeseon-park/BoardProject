package dao;

import java.util.List;

import model.Member;

public interface MemberDao {
	public int insertMember(Member member);

	public Member selectMember(int num);

	public Member selectMemberByID(String mID);
	
	public List<String> selectAuthoritiesByMNum(int mNum);
}
