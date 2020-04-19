package dao;

import java.util.List;

import model.Reply;

public interface ReplyDao {
	public int insertReply(Reply reply);
	
	public int updateReply(Reply reply);
	
	public int deleteReply(int rNum);
	
	public Reply selectReplyByRNum(int rNum);
	
	public List<Reply> selectRepliesByBNum(int bNum);
}
