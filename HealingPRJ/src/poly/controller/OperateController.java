package poly.controller;

import static poly.util.CmmUtil.nvl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.controller.comm.AbstractController;
import poly.dto.BasicInfoDTO;
import poly.dto.BasicInfoPageDTO;
import poly.dto.ExpenseDTO;
import poly.dto.IncomeDTO;
import poly.service.IOperateService;
import poly.util.CmmUtil;

@Controller
public class OperateController extends AbstractController {

	@Resource(name = "OperateService")
	private IOperateService operateService;

	@RequestMapping(value="/test")
	public String test() {
		System.out.println("---- HELOO ");
		return "/test/index.html";
	}
	
	
	@RequestMapping(value = "insertOperateResult")
	public String insertOperateResult(HttpServletRequest request, HttpServletResponse reponse, HttpSession session)
			throws Exception {
		log.info(this.getClass() + "--- in");
		if (session.getAttribute("user_name") == null) {
			String url = "/";
			String msg = "로그인을 해주세요.";
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);

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
		return "/operate/index";
	}

	// 수입지출금액 또는 중간저장 insert 테스트
	@RequestMapping(value = "insertTest", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String insertTest(@ModelAttribute BasicInfoDTO bDTO, HttpServletRequest request, HttpServletResponse reponse,
			HttpSession session) throws Exception {
		log.info(this.getClass() + ".insertTest in");

		log.info("test start~");
		int result = operateService.insertTest(bDTO);
		// 실제 사용하는 경우엔 세션 값이라든지 별다른 처리 없이 바로 서비스로 데이터 전달
		log.info("basic + expense + income = " + result);

		log.info(this.getClass() + ".insertTest out");
		if (result > 0) {
			return "success,코딩 화면으로 이동합니다.";
		}
		return "warning,올바른 정보인지 확인해주십시오.";
	}

	@RequestMapping(value = "/insertOperateResultProc", produces = "application/text; charset=UTF-8")
	public @ResponseBody String insertOperateResultProc(@ModelAttribute BasicInfoDTO bDTO, HttpServletRequest request,
			HttpServletResponse reponse, Model model, HttpSession session) throws Exception {
		log.info(this.getClass() + ".insertOperateResultProc in");

		String agency = bDTO.getAgency();
		log.info("agency : " + agency);
		String openday = bDTO.getOpenday();
		log.info("openday : " + openday);
		// 홍두표 - 중간 저장 기능 테스트
		String state = (nvl(bDTO.getProgress_state()).length() > 0) ? bDTO.getProgress_state() : "P";
		log.info("state : " + state);
		bDTO.setProgress_state(state);

		/**
		 * program_info테이블은 단체명, 시작일자, 프로그램명, intutor, oututor로 이루어짐 현재 단체명, 시작일자로 외래키로
		 * 잡음 변경해도 됨 _0720이재훈
		 */
		/*
		 * int program_insert = 0; log.info("in_out_size : " +
		 * bDTO.getProgram_in_out().size()); for (int i = 0; i <
		 * bDTO.getProgram_in_out().size(); i++) { String program_name =
		 * bDTO.getProgram_in_out().get(i).getProgramName(); String in_tutor =
		 * bDTO.getProgram_in_out().get(i).getIn_tutor(); String out_tutor =
		 * bDTO.getProgram_in_out().get(i).getOut_tutor(); String bunya =
		 * bDTO.getProgram_in_out().get(i).getBunya(); String teacher =
		 * bDTO.getProgram_in_out().get(i).getTeacher();
		 * 
		 * ProgramInOutDTO prDTO = new ProgramInOutDTO(); prDTO.setAgency(agency);
		 * prDTO.setOpenday(openday); prDTO.setProgramName(program_name);
		 * prDTO.setIn_tutor(in_tutor); prDTO.setOut_tutor(out_tutor);
		 * prDTO.setTeacher(teacher); prDTO.setBunya(bunya);
		 * 
		 * // 프로그램 리스트 저장 program_insert = operateService.insertProgramList(prDTO); }
		 */

		// int res = operateService.insertOperateResultProc(bDTO);
		// if (res != 0 && program_insert != 0) {
		// msg = "입력이 정상적으로 처리되었습니다.";
		// } else {
		//// msg = "입력을 처리할 수 없습니다. \n올바른 정보인지 확인 후 재요청 해주십시오.";
		// msg = "올바른 정보인지 확인해주십시오.";
		// }

		int result = operateService.insertOperateResultProc(bDTO);
		log.info("basic + expense + income = " + result);

		log.info(this.getClass() + ".insertOperateResultProc out");
		if (result > 0) {
			session.setAttribute("basic_end", true);
			session.setAttribute("agency", bDTO.getAgency());
			session.setAttribute("openday", bDTO.getOpenday());
			return "success,코딩 화면으로 이동합니다.";
		}
		return "warning,올바른 정보인지 확인해주십시오.";
	}

	@RequestMapping(value = "/getSaveList")
	@ResponseBody
	public List<BasicInfoDTO> getSaveList(HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".getSaveList Start !!");
		String reg_id = CmmUtil.nvl(request.getParameter("reg_id"));
		BasicInfoDTO bDTO = new BasicInfoDTO();
		bDTO.setReg_id(reg_id);
		List<BasicInfoDTO> bList = operateService.getSaveList(bDTO);
		if (bList.size() != 0) {
			for (BasicInfoDTO testDTO : bList) {
				log.info("testDTO.getAgency : " + testDTO.getAgency());
			}
		}
		log.info(this.getClass().getName() + ".getSaveList End");
		model.addAttribute("bList", bList);
		return bList;
	}

	@RequestMapping("/insertOperateSave")
	public String insertOperateSave(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".insertoperateSave Start !!");
		// **********************로그인 유효성 체크*************************************
		if (session.getAttribute("user_name") == null) {
			String url = "/";
			String msg = "로그인을 해주세요.";
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);

			return "/redirect";
		}
		// ************************************************************************
		// **********************유동적 페이지 가져오기***********************************
		BasicInfoPageDTO bDTO = operateService.getBasicInfoPage();
		if (bDTO == null) {
			bDTO = new BasicInfoPageDTO();
		}
		request.setAttribute("bDTO", bDTO);
		bDTO = null;
		// ************************************************************************
		// **********************중간 저장값 가져오기************************************
		String reg_id = CmmUtil.nvl(request.getParameter("reg_id"));
		String openday = CmmUtil.nvl(request.getParameter("openday"));
		String agency = CmmUtil.nvl(request.getParameter("agency"));

		log.info("reg_id : " + reg_id + " | openday : " + openday + " | agency : " + agency);
		BasicInfoDTO basicInfoDTO = new BasicInfoDTO();
		basicInfoDTO.setReg_id(reg_id);
		basicInfoDTO.setOpenday(openday);
		basicInfoDTO.setAgency(agency);
		List<BasicInfoDTO> basicInfoList = operateService.getBasicInfoSave(basicInfoDTO);
		log.info("program_in_out : " + basicInfoList.get(0).getProgram_in_out2());
		log.info("program_in_out size : " + basicInfoList.get(0).getProgram_in_out2().size());
		model.addAttribute("basicInfoList", basicInfoList);
		basicInfoDTO = null;
		// **********************중간 저장값 가져오기 - 지출******************************
		ExpenseDTO eDTO = new ExpenseDTO();
		eDTO.setBasic_info_seq(CmmUtil.nvl(basicInfoList.get(0).getBasic_info_seq()));
		List<ExpenseDTO> expenseList = operateService.getExpenseSave(eDTO);
		Map<String, List<ExpenseDTO>> expenseMap = new HashMap<>();
		String[] typelist = { "강사예정강사비", "강사예정보조강사비", "강사예정교통비", "강사예정식사비", "강사집행강사비", "강사집행보조강사비", "강사집행교통비",
				"강사집행식사비", "고객예정숙박비", "고객예정식사비", "고객예정재료비", "고객예정예비비", "고객집행숙박비", "고객집행식사비", "고객집행재료비", "고객집행기타비" };
		for (String type : typelist) {
			expenseMap.put(type, new ArrayList<ExpenseDTO>());
		}
		for (ExpenseDTO aDTO : expenseList) {
			expenseMap.get(CmmUtil.nvl(aDTO.getType())).add(aDTO);
		}
		model.addAttribute("expenseMap", expenseMap);
		// ************************************************************************
		// **********************중간 저장값 가져오기 - 수입******************************
		IncomeDTO iDTO = new IncomeDTO();
		iDTO.setBasic_info_seq(CmmUtil.nvl(basicInfoList.get(0).getBasic_info_seq()));
		List<IncomeDTO> incomeList = operateService.getImcomeSave(iDTO);
		Map<String, List<IncomeDTO>> incomeMap = new HashMap<>();
		String[] typeIncomeList = { "프로그램", "숙박비", "식사비", "재료비", "기타", "할인율" };
		for (String type : typeIncomeList) {
			incomeMap.put(type, new ArrayList<IncomeDTO>());
		}
		for (IncomeDTO aDTO : incomeList) {
			incomeMap.get(CmmUtil.nvl(aDTO.getType())).add(aDTO);
		}
		model.addAttribute("incomeMap", incomeMap);
		// ************************************************************************
		log.info(this.getClass().getName() + ".insertoperateSave End !!");

		return "/operate/indexSave";
	}

}
