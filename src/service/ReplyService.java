package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReplyDao;
import model.Reply;

@Service
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;

	public boolean writeReply(Reply reply) {
		if (replyDao.insertReply(reply) > 0) {
			return true;
		}
		return false;
	}

	public boolean modifyReply(Reply reply) {
		if (replyDao.updateReply(reply) > 0) {
			return true;
		}
		return false;
	}

	public boolean removeReply(Reply reply) {
		if (replyDao.deleteReply(reply.getrNum()) > 0) {
			return true;
		}
		return false;
	}

	public Reply getReplyByRNum(int rNum) {
		return replyDao.selectReplyByRNum(rNum);
	}

	public List<Reply> getRepliesByBNum(int bNum) {
		return replyDao.selectRepliesByBNum(bNum);
	}
}
