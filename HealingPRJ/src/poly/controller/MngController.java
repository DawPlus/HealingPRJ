package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.controller.comm.AbstractController;
import poly.dto.BasicInfoPageDTO;
import poly.dto.HistoryDTO;
import poly.dto.UserDTO;
import poly.service.IHistoryService;
import poly.service.IOperateService;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class MngController extends AbstractController {

	@Resource(name = "HistoryService")
	private IHistoryService historyService;

	@Resource(name = "UserService")
	private IUserService userSerivce;

	@Resource(name = "OperateService")
	private IOperateService operateService;

	@RequestMapping(value = "mng/mngGetUserList")
	public String mngGetUserList(HttpServletRequest request, HttpSession session) throws Exception {
		log.info(this.getClass() + "--- in");
		if (session.getAttribute("value") == null) {
			request.setAttribute("msg", "로그인을 해주세요.");
			request.setAttribute("url", "/");
			return "/redirect";
		}
		if (!CmmUtil.nvl(session.getAttribute("value").toString()).equals("3")) {
			request.setAttribute("msg", "관리자 권한이 없습니다.");
			request.setAttribute("url", "/insertForm/serviceInsertForm.do");
			return "/redirect";
		}

		List<UserDTO> uList = userSerivce.getUserInfo();

		request.setAttribute("uList", uList);

		log.info(this.getClass() + "--- out");
		return "/mng/mngUserList";
	}

	@RequestMapping(value = "mng/mngGetUserHist")
	public String mngGetUserHist(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
			HttpSession session) throws Exception {
		log.info(this.getClass() + "--- in");

		if (session.getAttribute("value") == null) {
			request.setAttribute("msg", "로그인을 해주세요.");
			request.setAttribute("url", "/");
			return "/redirect";
		}
		if (!CmmUtil.nvl(session.getAttribute("value").toString()).equals("3")) {
			request.setAttribute("msg", "관리자 권한이 없습니다.");
			request.setAttribute("url", "/insertForm/serviceInsertForm.do");
			return "/redirect";
		}

		List<HistoryDTO> hList = historyService.getAllHistories();
		for (HistoryDTO hDTO : hList) {
			log.info(hDTO.toString());
		}

		// 작성자들 중복값 없이 가져오기
		List<UserDTO> rList = historyService.getRegUser();

		model.addAttribute("rList", rList);
		model.addAttribute("hList", hList);

		hList = null;

		log.info(this.getClass() + "--- out");
		return "/mng/mngUserHist";
	}

	// 검색해서 리스트 가져오기
	@RequestMapping(value = "mng/mngGetUserHist/searchList")
	@ResponseBody
	public List<HistoryDTO> mngGetUserHistSearchList(HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + ".mngGetUserHistSearchList Start !!");

		String reg_id = request.getParameter("reg_id");
		log.info("reg_id : " + reg_id);

		HistoryDTO hDTO = new HistoryDTO();
		hDTO.setReg_id(reg_id);

		log.info(this.getClass().getName() + ".mngGetUserHistSearchList End !!");
		return historyService.getHistory(hDTO);
	}

	@RequestMapping(value = "mng/mngGetUserDetail")
	public String mngGetUserDetail(HttpServletRequest request, HttpServletResponse reponse, Model model,
			HttpSession session) throws Exception {
		log.info(this.getClass() + "--- in");
		if (session.getAttribute("user_name") == null) {
			String url = "/";
			String msg = "로그인을 해주세요.";
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);

			return "/redirect";
		}
		String userNo = request.getParameter("userNo");
		log.info("userNo : " + userNo);
		model.addAttribute("userNo", userNo);
		log.info(this.getClass() + "--- out");
		return "/mng/mngUserDetail";
	}

	@RequestMapping(value = "mng/mngCreateUser")
	public String mngCreateUser(HttpServletRequest request, HttpServletResponse reponse, Model model) throws Exception {
		log.info(this.getClass() + "--- in");

		log.info(this.getClass() + "--- out");
		return "/mng/mngCreateUser";
	}

	@RequestMapping(value = "mng/mngUpdatePage")
	public String mngUpdatepage(HttpServletRequest request, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".mngUpdatePage Start !!");
		if (session.getAttribute("user_name") == null) {
			String url = "/";
			String msg = "로그인을 해주세요.";
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);

			return "/redirect";
		}
		if (!CmmUtil.nvl(session.getAttribute("value").toString()).equals("3")) {
			request.setAttribute("msg", "관리자 권한이 없습니다.");
			request.setAttribute("url", "/insertForm/serviceInsertForm.do");
			return "/redirect";
		}
		// 유동적 페이지 가져오기
		BasicInfoPageDTO bDTO = operateService.getBasicInfoPage();
		if (bDTO == null) {
			bDTO = new BasicInfoPageDTO();
		}
		log.info(bDTO.toString());

		request.setAttribute("bDTO", bDTO);

		log.info(this.getClass() + "--- out");
		return "/mng/mngUpdatePage";
	}

	@RequestMapping(value = "mng/updatePage")
	@ResponseBody
	public String updatePage(HttpServletRequest request, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".mngUpdatePage Start !!");
		String support = CmmUtil.nvl(request.getParameter("support"));
		String income_type = CmmUtil.nvl(request.getParameter("income_type"));
		String part_type = CmmUtil.nvl(request.getParameter("part_type"));
		String biz_purpose = CmmUtil.nvl(request.getParameter("biz_purpose"));
		String program_in_out = CmmUtil.nvl(request.getParameter("program_in_out"));
		String service_type = CmmUtil.nvl(request.getParameter("service_type"));
		String age_type = CmmUtil.nvl(request.getParameter("age_type"));

		log.info(support + " | " + income_type + " | " + part_type + " | " + biz_purpose + " | " + program_in_out
				+ " | " + service_type + " | " + age_type + " | ");

		BasicInfoPageDTO bDTO = new BasicInfoPageDTO();
		bDTO.setSupport(support);
		bDTO.setIncome_type(income_type);
		bDTO.setPart_type(part_type);
		bDTO.setBiz_purpose(biz_purpose);
		bDTO.setProgram_in_out(program_in_out);
		bDTO.setService_type(service_type);
		bDTO.setAge_type(age_type);

		int result = operateService.updatePage(bDTO);

		if (result == 1) {
			log.info(this.getClass() + "--- out");
			return "success";
		} else {
			log.info(this.getClass() + "--- out");
			return "fail";
		}

	}

}
