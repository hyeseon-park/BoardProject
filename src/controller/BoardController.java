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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import model.Board;
import service.BoardService;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board, Model model, MultipartFile file) {
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
	public ModelAndView modify(Board board) {
		boolean result = boardService.modifyBoard(board);
		ModelAndView mav = new ModelAndView();
		String msg = "";
		String url = "";
		if (result) {
			msg = "수정 성공했습니다.";
			url = "list";
		} else {
			msg = "수정 실패했습니다.";
			url = "list";
		}
		mav.setViewName("board/boardResult");
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		return mav;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String showModify(Model model, int num) {
		model.addAttribute("board", boardService.getBoard(num));
		return "board/boardModify";
	}

	@RequestMapping("/delete")
	public ModelAndView delete(Board board) {
		boolean result = boardService.removeBoard(board);
		ModelAndView mav = new ModelAndView();
		String msg = "";
		String url = "";
		if (result) {
			msg = "삭제 성공했습니다.";
			url = "list";
		} else {
			msg = "삭제 실패했습니다.";
			url = "list";
		}
		mav.setViewName("board/boardResult");
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		return mav;
	}

	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public String check(int num, String password, String type) {
		if (password.equals(boardService.getBoard(num).getPass())) {
			if (type.equals("modify")) {
				return "redirect:modify?num=" + num;
			} else if (type.equals("delete")) {
				return "redirect:delete?num=" + num;
			}
		}
		return "board/boardCheck";
	}

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String showCheck() {
		return "board/boardCheck";
	}

	@RequestMapping("/view")
	public String view(Model model, int num) {
		model.addAttribute("board", boardService.getBoard(num));
		return "board/boardView";
	}

	@RequestMapping("/list")
	public String list(Model model, @RequestParam(defaultValue = "0") int type, @RequestParam(required = false) String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		param.put("keyword", keyword);
		Map<String, Object> result = boardService.getSearchedBoards(param);
		model.addAllAttributes(result);
		return "board/boardList";
	}

	@RequestMapping("/download")
	public View download(int num) {
		return boardService.getAttachment(num);
	}
}