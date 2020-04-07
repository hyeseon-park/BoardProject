package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Board;
import service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board board, Model model) {
		boolean result = boardService.writeBoard(board);
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
		return "boardResult";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String showWrite() {
		return "boardWrite";
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
		mav.setViewName("boardResult");
		mav.addObject("url", url);
		mav.addObject("msg", msg);
		return mav;
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String showModify(Model model, int num) {
		model.addAttribute("board", boardService.getBoard(num));
		return "boardModify";
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
		mav.setViewName("boardResult");
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
		return "boardCheck";
	}

	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String showCheck() {
		return "boardCheck";
	}

	@RequestMapping("/view")
	public String view(Model model, int num) {
		model.addAttribute("board", boardService.getBoard(num));
		return "boardView";
	}

	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("boardList", boardService.getAllBoards());
		return "boardList";
	}
}