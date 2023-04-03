package poly.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.controller.comm.AbstractController;
import poly.dto.HistoryDTO;
import poly.dto.UserDTO;
import poly.service.IHistoryService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.DateUtil;

@Controller
public class UserController extends AbstractController {

	@Resource(name = "UserService")
	private IUserService userService;

	@Resource(name = "HistoryService")
	private IHistoryService historyService;

	@RequestMapping(value = "login")
	public String login(HttpServletRequest request, HttpServletResponse reponse) throws IOException {
		return "/user/login";
	}

	@RequestMapping(value = "user/loginProc")
	public String loginProc(HttpServletRequest request, HttpServletResponse reponse, HttpSession session)
			throws Exception {
		log.info(this.getClass().getName() + ".loginProc Start !!");

		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(CmmUtil.nvl(request.getParameter("id")));
		uDTO.setUser_pwd(CmmUtil.nvl(request.getParameter("pwd")));

		UserDTO result = userService.loginProc(uDTO);
		if (result == null) {
			request.setAttribute("msg", "로그인실패");
			request.setAttribute("url", "/");
			return "redirect";
		} else if (result != null && result.getValue().equals("2") || result.getValue().equals("3")) {
			log.info("login success");
			session.setAttribute("user_seq", result.getUser_seq());
			session.setAttribute("user_id", result.getUser_id());
			session.setAttribute("user_name", result.getUser_name());
			session.setAttribute("value", result.getValue());
			session.setAttribute("basic_end", false);
			log.info("user_id : " + result.getUser_id() + " | user_name : " + result.getUser_name());
			request.setAttribute("url", "/insertOperateResult.do");
			log.info(this.getClass().getName() + ".loginProc End !!");
			return "redirect";
		} else if (result.getValue().equals("1")) {
			request.setAttribute("msg", "관리자 승인이 필요합니다.");
			request.setAttribute("url", "/");
			return "redirect";
		} else {
			log.info("login fail");
			request.setAttribute("msg", "로그인 실패");
			request.setAttribute("url", "/");
			log.info(this.getClass().getName() + ".loginProc End !!");
			return "redirect";
		}
	}

	// 회원가입
	@RequestMapping(value = "user/signupProc")
	@ResponseBody
	public String signUp(HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + ".signUp Start !!");
		String user_id = request.getParameter("user_id");
		String user_pwd = request.getParameter("user_pwd");
		String user_name = request.getParameter("user_name");

		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		uDTO.setUser_name(user_name);
		uDTO.setUser_pwd(user_pwd);
		uDTO.setValue("1");
		log.info(uDTO.toString());

		int result = userService.signupProc(uDTO);

		if (result == 1) {
			log.info("signupProc success");
			log.info(this.getClass().getName() + ".signupProc End!!");
			return "success";
		} else {
			log.info("signupProc fail");
			log.info(this.getClass().getName() + ".signupProc End!!");
			return "fail";
		}
	}

	@RequestMapping(value = "user/logout")
	public String logout(HttpServletRequest request, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".logout start !!");
		log.info(this.getClass().getName() + ".logout end !!");

		session.invalidate();
		request.setAttribute("url", "/");

		return "redirect";
	}

	@RequestMapping(value = "user/approveUser")
	@ResponseBody
	public String approveUser(HttpServletRequest request, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".approveUser Start !!");

		String user_id = request.getParameter("user_id");
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		int result = userService.approveUser(uDTO);
		if (result == 1) {
			// history 기록 남기기
			HistoryDTO hDTO = new HistoryDTO();
			hDTO.setDescription(user_id + " 사용자 계정 승인");
			hDTO.setReg_id((String) session.getAttribute("user_name"));
			hDTO.setDate(DateUtil.getDateTime());

			int historyResult = historyService.InsertHistory(hDTO);
			if (historyResult == 1) {
				log.info("history Insert");
			} else {
				log.info("history Insert Fail");
			}
			// history 기록 끝
		}
		log.info(this.getClass().getName() + ".approveUser End !!");
		return "";
	}

	@RequestMapping(value = "user/deleteUser")
	public String deleteUser(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".deleteUser Start !!");
		String user_id = request.getParameter("user_id");
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(user_id);
		int result = userService.deleteUser(uDTO);

		if (result == 1) {
			log.info("deleteUser success");
			// history 기록 남기기
			HistoryDTO hDTO = new HistoryDTO();
			hDTO.setDescription(user_id + " 사용자 계정 삭제");
			hDTO.setReg_id((String) session.getAttribute("user_name"));
			hDTO.setDate(DateUtil.getDateTime());

			int historyResult = historyService.InsertHistory(hDTO);
			if (historyResult == 1) {
				log.info("history Insert");
			} else {
				log.info("history Insert Fail");
			}
			// history 기록 끝
		} else {
			log.info("deleteUser fail");
			model.addAttribute("msg", "삭제 실패 !!");
		}
		model.addAttribute("url", "/mng/mngGetUserList.do");

		log.info(this.getClass().getName() + ".deleteUser End !!");

		return "redirect";
	}
}
