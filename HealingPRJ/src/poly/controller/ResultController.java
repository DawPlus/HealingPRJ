package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.controller.comm.AbstractController;
import poly.dto.BasicInfoDTO;
import poly.dto.ExpenseDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.IncomeDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;
import poly.service.IResultService;

@Controller
public class ResultController extends AbstractController {

	@Resource(name = "ResultService")
	private IResultService resultService;

	// =========================================================단체별 프로그램 결과
	// ===================================================================================
	@RequestMapping(value = "result/ProgramResult")
	public String ProgramResult(HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {

		log.info("프로그램 결과");
		return "result/ProgramResult";
	}

	@RequestMapping(value = "result/ProgramResult_chart")
	public String ProgramResult_chart(BasicInfoDTO biDTO, ServiceInsertDTO siDTO, SearchDTO sDTO,
			ProgramOperationDTO poDTO, IncomeDTO icDTO, ExpenseDTO eDTO, HrvInsertDTO hiDTO,
			HttpServletResponse response, Model model) throws Exception {
		log.info("프로그램 차트 실행");
		sDTO.setOpenday(biDTO.getOpenday());
		hiDTO.setDate(biDTO.getOpenday());
		log.info("참여단체 : " + sDTO.getAgency());
		log.info("참여일자 : " + sDTO.getOpenday());
		log.info("참여단체 : " + poDTO.getAgency());
		log.info("참여일자 : " + poDTO.getOpenday());
		log.info("시설서비스 만족도 평가 시작");
		List<BasicInfoDTO> basicList = resultService.getBasiclist(biDTO);

		List<ServiceInsertDTO> serviceList = resultService.getServicelist(siDTO);
		// 프로그램 운영
		int[] operationList = resultService.getOperationlist(poDTO);
		// 프로그램 만족도
		Double[][] ProgramSaf = resultService.getProgramSaf(sDTO);
		String[][] ProgramName = resultService.getProgramName(sDTO);
		// 프로그램 효과평가
		ArrayList<String> ProgramEffect = resultService.getProgramEffect(sDTO);
		// 자율신경 효과성
		List<IncomeDTO> IncomeList = resultService.getIncomeList(icDTO);
		List<ExpenseDTO> ExpenseList = resultService.getExpenseList(eDTO);
		// hrv 효과성
		List<HrvInsertDTO> HrvList = resultService.getHrvList(hiDTO);
		if (basicList.get(0).getBiz_purpose().equals("수익사업")) {
			model.addAttribute("IncomeList", IncomeList);
		}

		if (ExpenseList.size() != 0) {
			model.addAttribute("ExpenseList", ExpenseList);
		}
		model.addAttribute("basicList", basicList);
		model.addAttribute("HrvList", HrvList);
		model.addAttribute("serviceList", serviceList);
		model.addAttribute("operationList", operationList);
		model.addAttribute("ProgramEffect", ProgramEffect);
		model.addAttribute("ProgramSaf", ProgramSaf);
		model.addAttribute("ProgramName", ProgramName);
		log.info("시설서비스 만족도 평가 종료");
		log.info("프로그램 차트 종료");
		return "result/ProgramResult_chart";
	}
	// =========================================================프로그램 리스트
	// ===================================================================================

	@RequestMapping(value = "result/ProgramList")
	public String ProgramList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		log.info("프로그램 검색 ");
		List<BasicInfoDTO> rList = resultService.getFirstPage();
		model.addAttribute("rList", rList);
		return "result/ProgramList";
	}

	@RequestMapping(value = "result/ProgramList_chart")
	public String ProgramList_chart(BasicInfoDTO bDTO, Model model) throws Exception {
		log.info("프로그램 리스트 시작");
		log.info("프로그램 시작일 : " + bDTO.getOpenday());
		log.info("프로그램 종료일 : " + bDTO.getEndday());
		List<BasicInfoDTO> rList = resultService.getProgrmaList(bDTO);
		log.info(rList.size());
		model.addAttribute("rList", rList);
		log.info("프로그램 차트 종료");
		return "result/ProgramList_chart";
	}

	@RequestMapping(value = "result/ProgramList_chart1")
	public String ProgramList_chart1(BasicInfoDTO bDTO, Model model) throws Exception {

		return "result/ProgramList_chart";
	}
}