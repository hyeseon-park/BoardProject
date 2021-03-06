package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import model.Board;
import service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping("/list")
	public String list(Model model, @RequestParam(defaultValue = "0", value = "type") int type, @RequestParam(required = false, value = "keyword") String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		Map<String, Object> result = boardService.getSearchedBoards(param);
		model.addAllAttributes(result);
		return "board/boardList";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board, Model model, @RequestParam(value = "file")MultipartFile file) {
		boolean result = boardService.writeBoard(board, file);
		String msg = "";
		String url = "";
		if (result) {
			msg = "등록 성공했습니다.";
			url = "list";
		} else {
			msg = "등록 실패했습니다.";
			url = "write";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "board/boardResult";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String showWrite() {
		return "board/boardWrite";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, Board board) {
		boolean result = boardService.modifyBoard(board);
		String msg = "";
		String url = "";
		if (result) {
			msg = "수정 성공했습니다.";
			url = "list";
		} else {
			msg = "수정 실패했습니다.";
			url = "list";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "board/boardResult";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String showModify(Model model, int bNum) {
		model.addAttribute("board", boardService.getBoard(bNum));
		return "board/boardModify";
	}

	@RequestMapping("/delete")
	public String delete(Model model, int bNum) {
		boolean result = boardService.removeBoard(bNum);
		String msg = "";
		String url = "";
		if (result) {
			msg = "삭제 성공했습니다.";
			url = "list";
		} else {
			msg = "삭제 실패했습니다.";
			url = "list";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		return "board/boardResult";
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String check(int bNum, String password, String type) {
		if (password.equals(boardService.getBoard(bNum).getbPW())) {
			if (type.equals("modify")) {
				return "redirect:modify?bNum=" + bNum;
			} else if (type.equals("delete")) {
				return "redirect:delete?bNum=" + bNum;
			}
		}
		return "board/boardCheck";
	}

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String showCheck() {
		return "board/boardCheck";
	}

	@RequestMapping("/view")
	public String view(Model model, int bNum) {
		model.addAttribute("board", boardService.getBoard(bNum));
		return "board/boardView";
	}

	@RequestMapping("/download")
	public View download(int num) {
		return boardService.getAttachment(num);
	}
}