package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Reply;
import service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	ReplyService replyService;

	@ResponseBody
	@RequestMapping(value = "/all/{bNum}", method = RequestMethod.GET)
	public List<Reply> ReplyList(Model model, @PathVariable("bNum") int bNum) {
		List<Reply> replyList = replyService.getRepliesByBNum(bNum);
		return replyList;
	}

	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public boolean write(Reply reply) {
		boolean result = replyService.writeReply(reply);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public boolean modify(Reply reply) {
		boolean result = replyService.modifyReply(reply);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public boolean delete(Reply reply) {
		boolean result = replyService.removeReply(reply);
		return result;
	}
}