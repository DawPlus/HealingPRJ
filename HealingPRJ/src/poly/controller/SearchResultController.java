package poly.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.controller.comm.AbstractController;
import poly.dto.BasicInfoDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.SearchDTO;
import poly.service.ISearchResultService;
import poly.util.CmmUtil;

@Controller
public class SearchResultController extends AbstractController {

	@Resource(name = "SearchResultService")
	private ISearchResultService SearchResultService;

	@RequestMapping(value = "searchResult/search")
	public String Search(HttpServletRequest request, HttpServletResponse reponse, HttpSession session)
			throws Exception {
		log.info("통계 검색 페이지 on~");

		return "/result/SearchResult";
	}

	@RequestMapping(value = "searchResult/SearchResult_chart")
	public String SearchResult_chart(BasicInfoDTO bDTO, SearchDTO sDTO, ProgramOperationDTO poDTO,
			HttpServletRequest request, HttpServletResponse reponse, HttpSession session, ModelMap model)
			throws Exception {
		log.info("통계 페이지 시작 ");
		String s_1 = CmmUtil.nvl(request.getParameter("sub1"));
		String s_2 = CmmUtil.nvl(request.getParameter("sub2"));
		String s_3 = CmmUtil.nvl(request.getParameter("sub3"));
		String c_1 = CmmUtil.nvl(request.getParameter("content1"));
		String c_2 = CmmUtil.nvl(request.getParameter("content2"));
		String c_3 = CmmUtil.nvl(request.getParameter("content3"));

		bDTO.setAgency("%%");
		bDTO.setOm("%%");
		bDTO.setDays_to_stay("%%");
		bDTO.setResidence("%%");
		;
		bDTO.setSupport("%%");
		bDTO.setBiz_purpose("%%");// 사회공헌, 수익사업
		bDTO.setAge_type("%%");
		bDTO.setPart_type("%%");
		bDTO.setIncome_type("%%"); // 녹색자금, 산림복지, 기타
		bDTO.setService_type("%%");

		if (s_1.equals("AGENCY")) {
			bDTO.setAgency(c_1);
		} else if (s_1.equals("OM")) {
			bDTO.setOm(c_1);
		} else if (s_1.equals("DAYS_TO_STAY")) {
			bDTO.setDays_to_stay(c_1);
		} else if (s_1.equals("REGIDENCE")) {
			bDTO.setResidence(c_1);
		} else if (s_1.equals("%SUPPORT%")) {
			bDTO.setSupport(c_1);
		} else if (s_1.equals("BIZ_PURPOSE")) {
			bDTO.setBiz_purpose(c_1);
		} else if (s_1.equals("PART_TYPE")) {
			bDTO.setPart_type(c_1);
		} else if (s_1.equals("AGE_TYPE")) {
			bDTO.setAge_type(c_1);
		} else if (s_1.equals("INCOME_TYPE")) {
			bDTO.setIncome_type(c_1);
		} else if (s_1.equals("SERVICE_TYPE")) {
			bDTO.setService_type(c_1);
		}

		if (s_2.equals("AGENCY")) {
			bDTO.setAgency(c_2);
		} else if (s_2.equals("OM")) {
			bDTO.setOm(c_2);
		} else if (s_2.equals("DAYS_TO_STAY")) {
			bDTO.setDays_to_stay(c_2);
		} else if (s_2.equals("REGIDENCE")) {
			bDTO.setResidence(c_2);
		} else if (s_2.equals("%SUPPORT%")) {
			bDTO.setSupport(c_2);
		} else if (s_2.equals("BIZ_PURPOSE")) {
			bDTO.setBiz_purpose(c_2);
		} else if (s_2.equals("PART_TYPE")) {
			bDTO.setPart_type(c_2);
		} else if (s_2.equals("AGE_TYPE")) {
			bDTO.setAge_type(c_2);
		} else if (s_2.equals("INCOME_TYPE")) {
			bDTO.setIncome_type(c_2);
		} else if (s_2.equals("SERVICE_TYPE")) {
			bDTO.setService_type(c_2);
		}

		if (s_3.equals("AGENCY")) {
			bDTO.setAgency(c_3);
		} else if (s_3.equals("OM")) {
			bDTO.setOm(c_3);
		} else if (s_3.equals("DAYS_TO_STAY")) {
			bDTO.setDays_to_stay(c_3);
		} else if (s_3.equals("REGIDENCE")) {
			bDTO.setResidence(c_3);
		} else if (s_3.equals("%SUPPORT%")) {
			bDTO.setSupport(c_3);
		} else if (s_3.equals("BIZ_PURPOSE")) {
			bDTO.setBiz_purpose(c_3);
		} else if (s_3.equals("PART_TYPE")) {
			bDTO.setPart_type(c_3);
		} else if (s_3.equals("AGE_TYPE")) {
			bDTO.setAge_type(c_3);
		} else if (s_3.equals("INCOME_TYPE")) {
			bDTO.setIncome_type(c_3);
		} else if (s_3.equals("SERVICE_TYPE")) {
			bDTO.setService_type(c_3);
		}

		HashMap<String, String> residenceCountMap = SearchResultService.getResidenceCountMap(bDTO);
		List<BasicInfoDTO> basicList = SearchResultService.getBasicList(bDTO);
		if (basicList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다. .";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";

		}

		HashMap<String, String> residenceSumMap = SearchResultService.getResidenceSumMap(bDTO);

		HashMap<String, String> partCountMap = SearchResultService.getPartCountMap(bDTO);

		HashMap<String, String> partSumMap = SearchResultService.getPartSumMap(bDTO);

		HashMap<String, String> bizCountMap = SearchResultService.getBizCountMap(bDTO);

		HashMap<String, String> bizSumMap = SearchResultService.getBizSumMap(bDTO);
		// 프로그램 만족도 점수
		HashMap<String, List> proAvgMap = SearchResultService.getProAvgMap(bDTO);
		// 프로그램 갯수
		String[] proCountMap = SearchResultService.getProCountMap(bDTO);
		// 시설서비스 만족도
		List<SearchDTO> serEnvList = SearchResultService.getSerEnvList(bDTO);

		List<SearchDTO> HrvList = SearchResultService.getHrvList(bDTO);
		// 효과성 분석
		HashMap<String, String> effectMap = SearchResultService.getEffectMap(bDTO);
		model.addAttribute("residenceCountMap", residenceCountMap);
		model.addAttribute("residenceSumMap", residenceSumMap);
		model.addAttribute("partCountMap", partCountMap);
		model.addAttribute("partSumMap", partSumMap);
		model.addAttribute("bizCountMap", bizCountMap);
		model.addAttribute("bizSumMap", bizSumMap);
		model.addAttribute("proAvgMap", proAvgMap);
		model.addAttribute("serEnvList", serEnvList);
		model.addAttribute("effectMap", effectMap);
		model.addAttribute("proCountMap", proCountMap);
		model.addAttribute("HrvList", HrvList);

		log.info("통계 페이지 종료");

		return "/result/SearchResult_chart";
	}

}
