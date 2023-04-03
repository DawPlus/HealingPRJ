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
import poly.dto.ResidenceDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.YearResultDTO;
import poly.service.IYearResultService;

@Controller
public class YearResultController extends AbstractController  {

	@Resource(name = "YearResultService")
	private IYearResultService yearresultService;
	
	// =========================================================연월 프로그램 결과 ===================================================================================
	@RequestMapping(value ="result/YearMonthResult")
	public String resultProgram(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("연월 프로그램 결과");
		return "result/YearMonthResult";
	}
	
	@RequestMapping(value ="result/YearMonthResult_chart")
	public String YearMonthResult_chart(BasicInfoDTO bDTO, ResidenceDTO uDTO,SearchDTO sDTO, YearResultDTO yrDTO, ProgramOperationDTO poDTO,ServiceInsertDTO siDTO,ExpenseDTO eDTO,
								IncomeDTO iDTO, HrvInsertDTO hiDTO,HttpServletResponse response,Model model) throws Exception {
		log.info("연월 프로그램 차트 실행");
		log.info("연령대 배열");
		hiDTO.setDate(sDTO.getOpenday());
		hiDTO.setDate_1(sDTO.getEndday());
		int[][]ageList = yearresultService.getAgeList(yrDTO);
		List<BasicInfoDTO> basicList = yearresultService.getBasicList(bDTO);
		 if(basicList.size() == 0) {
				String msg = "기간내에 참여한 단체가 없습니다.";
				String url = "SearchResult.do";
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				return "/SafAndEff/redirect";
			}
		log.info("참가자유형 배열");
		int[][] partList = yearresultService.getPartList(yrDTO);
		int[][] incomeList = yearresultService.getIncomeList(yrDTO);
		int[][] residenceList = yearresultService.getResidenceList(uDTO);
		int[] bizList = yearresultService.getBizList(yrDTO);
		List<BasicInfoDTO> roomList = yearresultService.getRoomList(bDTO);
		int[] operating_progrma = yearresultService.getOp_program(poDTO);
		List<ServiceInsertDTO> serviceList =yearresultService.getSerList(siDTO);
		double[][] programList =yearresultService.getProgramList(sDTO);
		int[][] supportList = yearresultService.getSupportList(yrDTO);
		int[][] servicetype = yearresultService.getServiceType(yrDTO);
		int[][] peoplecount = yearresultService.getPeapleCount(yrDTO);
		ArrayList<String> ProgramEffect = yearresultService.getProgramEffect(sDTO);
		double[] ExpenseList = yearresultService.getExpenseList(eDTO);
		int[] IncomeSumList = yearresultService.getIncomeSumList(iDTO);
		List<HrvInsertDTO> HrvList = yearresultService.getHrvList(hiDTO);
				
		model.addAttribute("openday",yrDTO.getOpenday());
		model.addAttribute("endday", yrDTO.getEndday());
		model.addAttribute("partList", partList);
		model.addAttribute("ageList", ageList);
		model.addAttribute("incomeList", incomeList);
		model.addAttribute("operating_progrma", operating_progrma);
		model.addAttribute("roomList", roomList);
		model.addAttribute("serviceList", serviceList);
		model.addAttribute("bizList", bizList);
		model.addAttribute("residenceList", residenceList);
		model.addAttribute("supportList", supportList);
		model.addAttribute("servicetype", servicetype);
		model.addAttribute("peoplecount", peoplecount);
		model.addAttribute("HrvList", HrvList);
		model.addAttribute("ProgramEffect", ProgramEffect);
		model.addAttribute("programList", programList);
		model.addAttribute("ExpenseList", ExpenseList);
		model.addAttribute("IncomeSumList", IncomeSumList);
		log.info("연월 프로그램 차트 실행 종료");
		return "result/YearMonthResult_chart";
	}
	
} 