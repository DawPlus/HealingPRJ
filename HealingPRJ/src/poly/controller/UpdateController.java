package poly.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.controller.comm.AbstractController;
import poly.dto.BasicInfoDTO;
import poly.dto.BasicInfoPageDTO;
import poly.dto.CounselInsertDTO;
import poly.dto.ExpenseDTO;
import poly.dto.HealingInsertDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.IncomeDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.UpdateListDTO;
import poly.dto.VibraInsertDTO;
import poly.service.IOperateService;
import poly.service.IUpdateService;
import poly.util.CmmUtil;

@Controller
public class UpdateController extends AbstractController {

	@Resource(name = "UpdateService")
	private IUpdateService updateService;

	@Resource(name = "OperateService")
	private IOperateService operateService;

	// 수정하기 ajax 리스트 불러오기
	@RequestMapping(value = "updateForm/getList", method = RequestMethod.POST)
	@ResponseBody
	public List<UpdateListDTO> getList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + ".getList.do Start !!");

		String table_name = request.getParameter("table_name");

		UpdateListDTO uDTO = new UpdateListDTO();
		uDTO.setTable_name(table_name);

		List<UpdateListDTO> uList = updateService.getList(uDTO);

		log.info(this.getClass().getName() + ".getList.do End !!");
		return uList;
	}

	// 삭제하기
	@RequestMapping(value = "updateForm/deleteForm")
	public String deleteForm(HttpServletResponse response, HttpServletRequest request) throws Exception {
		log.info(this.getClass().getName() + ".deleteForm.do Start !!");

		String table_name = CmmUtil.nvl(request.getParameter("table_name"));
		String agency = CmmUtil.nvl(request.getParameter("agency"));
		String openday = CmmUtil.nvl(request.getParameter("openday"));

		UpdateListDTO uDTO = new UpdateListDTO();
		uDTO.setTable_name(table_name);
		uDTO.setAgency(agency);
		uDTO.setOpenday(openday);

		if (table_name.equals("counsel_service") || table_name.equals("healing_service")
				|| table_name.equals("prevent_service") || table_name.equals("hrv_service")
				|| table_name.equals("vibra_service")) {
			String pv = CmmUtil.nvl(request.getParameter("pv"));
			if (pv.equals("종결")) {
				pv = "사후";
			}
			uDTO.setPv(pv);
			log.info("pv : " + pv);
		} else if (table_name.equals("program_satisfaction")) {
			String program_name = CmmUtil.nvl(request.getParameter("program_name"));
			uDTO.setProgram_name(program_name);
		}

		int result = updateService.deleteForm(uDTO);

		if (result > 0) {
			String url = "/updateForm/updateList.do";
			String msg = "삭제 성공";
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);
			log.info(this.getClass().getName() + ".deleteForm.do End !!");
			return "/redirect";

		} else {
			String url = "/updateForm/updateList.do";
			String msg = "삭제에 실패했습니다. 관리자에게 문의하세요";
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);
			log.info(this.getClass().getName() + ".deleteForm.do End !!");
			return "/redirect";
		}
	}

	// 수정페이지 이동
	@RequestMapping(value = "updateForm/updateDetail")
	public String updateDetail(HttpServletResponse response, HttpServletRequest request, ModelMap model)
			throws Exception {
		log.info(this.getClass().getName() + ".updateDetail.do Start !!");
		String table_name = CmmUtil.nvl(request.getParameter("table_name"));
		String agency = CmmUtil.nvl(request.getParameter("agency"));
		String openday = CmmUtil.nvl(request.getParameter("openday"));

		UpdateListDTO uDTO = new UpdateListDTO();
		uDTO.setTable_name(table_name);
		uDTO.setAgency(agency);
		uDTO.setOpenday(openday);
		log.info("table_name : " + table_name);
		log.info("agency : " + agency);
		log.info("openday : " + openday);

		if (table_name.equals("counsel_service") || table_name.equals("healing_service")
				|| table_name.equals("prevent_service") || table_name.equals("hrv_service")
				|| table_name.equals("vibra_service")) {
			String pv = CmmUtil.nvl(request.getParameter("pv"));
			uDTO.setPv(pv);
			log.info("pv : " + pv);
		} else if (table_name.equals("program_satisfaction")) {
			String program_name = CmmUtil.nvl(request.getParameter("program_name"));
			uDTO.setProgram_name(program_name);
		}
		// 8가지 페이지 이동 한 로직에서 처리하려고 switch case문 사용
		String jspFile = "";
		switch (table_name) {
		case "basic_info":
			BasicInfoDTO bDTO = updateService.basicInfoUpdateForm(uDTO);
			log.info("agency : " + bDTO.getAge_type());
			List<BasicInfoDTO> basicInfoList = updateService.getBasicInfoUpdate(bDTO);

			model.addAttribute("bDTO", bDTO);
			model.addAttribute("basicInfoList", basicInfoList);
			// **********************유동적 페이지 가져오기***********************************
			BasicInfoPageDTO bpDTO = operateService.getBasicInfoPage();
			if (bpDTO == null) {
				bpDTO = new BasicInfoPageDTO();
			}

			request.setAttribute("bpDTO", bpDTO);
			bpDTO = null;
			// **********************중간 저장값 가져오기 - 지출******************************
			ExpenseDTO eDTO = new ExpenseDTO();
			eDTO.setBasic_info_seq(CmmUtil.nvl(basicInfoList.get(0).getBasic_info_seq()));
			log.info("Basic_info_seq : " + eDTO.getBasic_info_seq());
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
			jspFile = "/updateForm/index";
			break;
		case "counsel_service":
			log.info("table_name : " + uDTO.getTable_name());
			log.info("table_name : " + uDTO.getAgency());
			log.info("table_name : " + uDTO.getOpenday());
			log.info("table_name : " + uDTO.getPv());
			List<CounselInsertDTO> counselList = updateService.counselUpdateForm(uDTO);
			for (CounselInsertDTO cDTO : counselList) {
				log.info("agency : " + cDTO.getAgency());
			}
			log.info("agency : " + counselList.get(0).getSession());

			model.addAttribute("counselList", counselList);
			jspFile = "/updateForm/counselInsertForm";
			break;
		case "healing_service":
			List<HealingInsertDTO> healingList = updateService.healingUpdateForm(uDTO);
			for (HealingInsertDTO cDTO : healingList) {
				log.info("agency : " + cDTO.getAgency());
			}
			model.addAttribute("healingList", healingList);
			jspFile = "/updateForm/healingInsertForm";
			break;
		case "hrv_service":
			List<HrvInsertDTO> hrvList = updateService.hrvUpdateForm(uDTO);
			for (HrvInsertDTO cDTO : hrvList) {
				log.info("agency : " + cDTO.getAgency());
			}
			model.addAttribute("hrvList", hrvList);
			jspFile = "/updateForm/hrvInsertForm";
			break;
		case "prevent_service":
			List<PreventInsertDTO> preventList = updateService.preventUpdateForm(uDTO);
			for (PreventInsertDTO cDTO : preventList) {
				log.info("agency : " + cDTO.getAgency());
			}
			model.addAttribute("preventList", preventList);
			jspFile = "/updateForm/preventInsertForm";
			break;
		case "program_satisfaction":
			List<ProgramInsertDTO> programList = updateService.programUpdateForm(uDTO);
			for (ProgramInsertDTO cDTO : programList) {
				log.info("agency : " + cDTO.getAgency());
			}
			log.info("agency : " + programList.get(0).getScoreString2List());
			model.addAttribute("programList", programList);
			jspFile = "/updateForm/programInsertForm";
			break;
		case "service_env_satisfaction":
			List<ServiceInsertDTO> serviceList = updateService.serviceUpdateForm(uDTO);
			for (ServiceInsertDTO cDTO : serviceList) {
				log.info("agency : " + cDTO.getAgency());
			}
			model.addAttribute("serviceList", serviceList);
			jspFile = "/updateForm/serviceInsertForm";
			break;
		case "vibra_service":
			List<VibraInsertDTO> vibraList = updateService.vibraUpdateForm(uDTO);
			for (VibraInsertDTO cDTO : vibraList) {
				log.info("agency : " + cDTO.getAgency());
			}
			log.info("agency : " + vibraList.get(0).getAgency());
			log.info("num : " + vibraList.get(0).getScoreString2List());
			model.addAttribute("vibraList", vibraList);
			jspFile = "/updateForm/vibraInsertForm";
			break;

		default:
			jspFile = "/";
			break;
		}
		log.info(this.getClass().getName() + ".updateDetail.do End !!");
		return jspFile;
	}

	// 기관명 조회
	@RequestMapping(value = "updateForm/getAgencyList", method = RequestMethod.POST)
	@ResponseBody
	public List<UpdateListDTO> getAgencyList(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		log.info(this.getClass().getName() + ".getAgencyList.do Start !!");

		String table_name = request.getParameter("table_name");
		String agency = request.getParameter("agency");

		log.info("table_name : " + table_name);
		log.info("agency : " + agency);
		UpdateListDTO uDTO = new UpdateListDTO();
		uDTO.setTable_name(table_name);
		uDTO.setAgency(agency);

		List<UpdateListDTO> uList = updateService.getAgencyList(uDTO);

		log.info(this.getClass().getName() + ".getAgencyList.do End !!");
		return uList;
	}

	// 중간저장 서식 불러와서 수정 - update 쿼리 사용
	@RequestMapping(value = "updateOperateResultProc", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public @ResponseBody String updateOperateResultProc(@ModelAttribute BasicInfoDTO bDTO, HttpServletRequest request,
			HttpServletResponse reponse, Model model, HttpSession session) throws Exception {
		log.info(this.getClass() + ".updateOperateResultProc in");

		String agency = bDTO.getAgency();
		log.info("agency : " + agency);
		String openday = bDTO.getOpenday();
		log.info("openday : " + openday);
		log.info("program_in_out : " + bDTO.getProgram_in_out().get(0).getBunya());

		int result = updateService.updateOperateResultProc(bDTO);
		log.info("basic + expense + income = " + result);

		log.info(this.getClass() + ".updateOperateResultProc out");
		if (result > 0) {
			session.setAttribute("basic_end", true);
			session.setAttribute("agency", bDTO.getAgency());
			session.setAttribute("openday", bDTO.getOpenday());
			return "success,확인을 눌러주세요.";
		}
		return "warning,올바른 정보인지 확인해주십시오.";
	}
}
