package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.controller.comm.AbstractController;
import poly.dto.CounselInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;
import poly.service.ISafAndEffService;
import poly.util.CmmUtil;
import sun.print.resources.serviceui;

@Controller
public class SafAndEffController extends AbstractController {

	@Resource(name = "SafAndEffService")
	private ISafAndEffService SafAndEffService;

	/*
	 * =============================================================================
	 * =단체별 만족도 및
	 * 효과평가=========================================================================
	 * ==========================================
	 */
	@RequestMapping(value = "SaE/ProgramResult")
	public String seBygroup(HttpServletRequest request, HttpServletResponse reponse) {

		log.info("단체별 만족도 및 효과평가");
		return "/SafAndEff/seBygroup";
	}

	@RequestMapping(value = "SaE/Program")
	public String program(SearchDTO sDTO, ProgramInsertDTO uDTO, Model model, HttpServletRequest request)
			throws Exception {
		log.info("프로그램 만족도");
		log.info("참여단체 : " + uDTO.getAgency());
		List<SearchDTO> ProgramList = SafAndEffService.getProgrmaList(sDTO);
		if (ProgramList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}
		List<SearchDTO> AvgList = SafAndEffService.getProgrmaAvgList(sDTO);
		log.info(ProgramList.get(0).getScore1());
		model.addAttribute("rList", ProgramList);
		model.addAttribute("AvgList", AvgList);
		return "/SafAndEff/Program_chart";
	}

	@RequestMapping(value = "SaE/Facility")
	public String Facility(ServiceInsertDTO uDTO, Model model, HttpServletRequest request) throws Exception {
		log.info("시설서비스만족도");
		log.info("참여단체 : " + uDTO.getAgency());
		List<ServiceInsertDTO> FacilityList = SafAndEffService.getFacilityList(uDTO);

		if (FacilityList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}
		List<ServiceInsertDTO> AVG_FacilityList = SafAndEffService.getAvgFacilityList(uDTO);
		log.info(FacilityList.get(0).getScore1());
		model.addAttribute("rList", FacilityList);
		model.addAttribute("avgList", AVG_FacilityList);
		return "/SafAndEff/Facility_Serchart";
	}

	@RequestMapping(value = "SaE/Prevent")
	public String Prevent(SearchDTO sDTO, Model model, HttpServletRequest request) throws Exception {
		log.info("예방서비스");
		log.info("참여단체 : " + sDTO.getAgency());
		List<SearchDTO> PreventList = SafAndEffService.getPreventList(sDTO);
		if (PreventList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}
		List<SearchDTO> AvgList = SafAndEffService.getAvgPreventList(sDTO);
		model.addAttribute("PreventList", PreventList);
		model.addAttribute("AvgList", AvgList);
		return "/SafAndEff/Prevent_chart";
	}

	@RequestMapping(value = "SaE/Healing")
	public String healing(SearchDTO sDTO, Model model, HttpServletRequest request) throws Exception {
		log.info("힐링서비스 효과평가");
		log.info("참여단체 : " + sDTO.getAgency());
		List<SearchDTO> HealList = SafAndEffService.getHealList(sDTO);
		if (HealList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}
		List<SearchDTO> AvgList = SafAndEffService.getHealAvgList(sDTO);
		model.addAttribute("HealList", HealList);
		model.addAttribute("AvgList", AvgList);
		return "/SafAndEff/Healing_chart2";
	}

	@RequestMapping(value = "SaE/Counseling")
	public String Counseling(SearchDTO sDTO, CounselInsertDTO ciDTO, Model model, HttpServletRequest request)
			throws Exception {
		log.info("상담 서비스 효과평가");
		log.info("참여단체 : " + sDTO.getAgency());
		List<SearchDTO> CounselingList = SafAndEffService.getCoulselList(sDTO);
		List<SearchDTO> AvgList = SafAndEffService.getAvgCoulselList(sDTO);
		if (CounselingList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}

		model.addAttribute("CounselingList", CounselingList);
		model.addAttribute("AvgList", AvgList);

		return "/SafAndEff/Counsel_chart";
	}

	/*
	 * =============================================================================
	 * =주제어별 만족도 및
	 * 효과평가=========================================================================
	 * ==========================================
	 */
	@RequestMapping(value = "SaE/SearchResult")
	public String seBysubject(HttpServletRequest request, HttpServletResponse reponse) {

		log.info("주제어별 만족도 및 효과평가");
		return "/SafAndEff/seBysubject";
	}

	@RequestMapping(value = "SaE/Program_chart")
	public String Program_chart(SearchDTO sDTO, ModelMap model, HttpServletRequest request, HttpServletResponse reponse)
			throws Exception {
		log.info("프로그램 주제어별 차트");
		String s_1 = CmmUtil.nvl(request.getParameter("sub1"));
		String s_2 = CmmUtil.nvl(request.getParameter("sub2"));
		String s_3 = CmmUtil.nvl(request.getParameter("sub3"));
		String c_1 = CmmUtil.nvl(request.getParameter("content1"));
		String c_2 = CmmUtil.nvl(request.getParameter("content2"));
		String c_3 = CmmUtil.nvl(request.getParameter("content3"));
		log.info("s_1 : " + s_1);
		log.info("s_2: " + s_2);
		log.info("s_3 : " + s_3);
		log.info("c_1 : " + c_1);
		log.info("c_2 : " + c_2);
		log.info("c_3 : " + c_3);

		sDTO.setAgency("%%");
		sDTO.setProgram_name("%%");
		sDTO.setAge("%%");
		sDTO.setSex("%%");
		sDTO.setResidence("%%");
		sDTO.setJob("%%");
		sDTO.setTeacher("%%");
		sDTO.setPlace("%%");
		sDTO.setOpenday("%%");
		sDTO.setBunya("%%");

		if (s_1.equals("AGENCY")) {
			sDTO.setAgency(c_1);
		} else if (s_1.equals("PROGRAM_NAME")) {
			sDTO.setProgram_name(c_1);
		} else if (s_1.equals("AGE")) {
			sDTO.setAge(c_1);
		} else if (s_1.equals("SEX")) {
			sDTO.setSex(c_1);
		} else if (s_1.equals("REGIDENCE")) {
			sDTO.setResidence(c_1);
		} else if (s_1.equals("JOB")) {
			sDTO.setJob(c_1);
		} else if (s_1.equals("TEACHER")) {
			sDTO.setTeacher(c_1);
		} else if (s_1.equals("PLACE")) {
			sDTO.setPlace(c_1);
		} else if (s_1.equals("OPENDAY")) {
			sDTO.setOpenday(c_1);
		} else if (s_1.equals("BUNYA")) {
			sDTO.setBunya(c_1);
		}

		if (s_2.equals("AGENCY")) {
			sDTO.setAgency(c_2);
		} else if (s_2.equals("PROGRAM_NAME")) {
			sDTO.setProgram_name(c_2);
		} else if (s_2.equals("AGE")) {
			sDTO.setAge(c_2);
		} else if (s_2.equals("SEX")) {
			sDTO.setSex(c_2);
		} else if (s_2.equals("REGIDENCE")) {
			sDTO.setResidence(c_2);
		} else if (s_2.equals("JOB")) {
			sDTO.setJob(c_2);
		} else if (s_2.equals("TEACHER")) {
			sDTO.setTeacher(c_2);
		} else if (s_2.equals("PLACE")) {
			sDTO.setPlace(c_2);
		} else if (s_2.equals("OPENDAY")) {
			sDTO.setOpenday(c_2);
		} else if (s_2.equals("BUNYA")) {
			sDTO.setBunya(c_2);
		}

		if (s_3.equals("AGENCY")) {
			sDTO.setAgency(c_3);
		} else if (s_3.equals("PROGRAM_NAME")) {
			sDTO.setProgram_name(c_3);
		} else if (s_3.equals("AGE")) {
			sDTO.setAge(c_3);
		} else if (s_3.equals("SEX")) {
			sDTO.setSex(c_3);
		} else if (s_3.equals("REGIDENCE")) {
			sDTO.setResidence(c_3);
		} else if (s_3.equals("JOB")) {
			sDTO.setJob(c_3);
		} else if (s_3.equals("TEACHER")) {
			sDTO.setTeacher(c_3);
		} else if (s_3.equals("PLACE")) {
			sDTO.setPlace(c_3);
		} else if (s_3.equals("OPENDAY")) {
			sDTO.setOpenday(c_3);
		} else if (s_3.equals("BUNYA")) {
			sDTO.setBunya(c_3);
		}
		log.info(sDTO.getAgency());
		log.info(sDTO.getProgram_name());
		log.info(sDTO.getAge());
		log.info(sDTO.getSex());
		log.info(sDTO.getResidence());
		log.info(sDTO.getJob());
		log.info(sDTO.getTeacher());
		log.info(sDTO.getPlace());
		log.info(sDTO.getOpenday());
		log.info(sDTO.getBunya());

		List<SearchDTO> rList = SafAndEffService.getSer_Program(sDTO);
		if (rList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}

		List<SearchDTO> AvgList = SafAndEffService.getSer_AvgProgram(sDTO);
		model.addAttribute("rList", rList);
		model.addAttribute("AvgList", AvgList);
		model.addAttribute("c_1", c_1);
		model.addAttribute("c_2", c_2);
		model.addAttribute("c_3", c_3);
		return "/SafAndEff/Program_chart_search";
	}

	@RequestMapping(value = "SaE/Facility_chart")
	public String Facility_chart(SearchDTO sDTO, HttpServletRequest request, HttpServletResponse reponse,
			ModelMap model) throws Exception {
		log.info("시설만족도 주제어별 차트");
		String s_1 = CmmUtil.nvl(request.getParameter("sub1"));
		String s_2 = CmmUtil.nvl(request.getParameter("sub2"));
		String s_3 = CmmUtil.nvl(request.getParameter("sub3"));
		String c_1 = CmmUtil.nvl(request.getParameter("content1"));
		String c_2 = CmmUtil.nvl(request.getParameter("content2"));
		String c_3 = CmmUtil.nvl(request.getParameter("content3"));

		sDTO.setAgency("%%");
		sDTO.setAge("%%");
		sDTO.setSex("%%");
		sDTO.setResidence("%%");
		sDTO.setOpenday("%%");
		sDTO.setJob("%%");

		if (s_1.equals("AGENCY")) {
			sDTO.setAgency(c_1);
		} else if (s_1.equals("AGE")) {
			sDTO.setAge(c_1);
		} else if (s_1.equals("SEX")) {
			sDTO.setSex(c_1);
		} else if (s_1.equals("REGIDENCE")) {
			sDTO.setResidence(c_1);
		} else if (s_1.equals("JOB")) {
			sDTO.setJob(c_1);
		} else if (s_1.equals("OPENDAY")) {
			sDTO.setOpenday(c_1);
		}

		if (s_2.equals("AGENCY")) {
			sDTO.setAgency(c_2);
		} else if (s_1.equals("PROGRAM_NAME")) {
			sDTO.setProgram_name(c_2);
		} else if (s_2.equals("AGE")) {
			sDTO.setAge(c_2);
		} else if (s_2.equals("SEX")) {
			sDTO.setSex(c_2);
		} else if (s_2.equals("REGIDENCE")) {
			sDTO.setResidence(c_2);
		} else if (s_2.equals("JOB")) {
			sDTO.setJob(c_2);
		} else if (s_2.equals("OPENDAY")) {
			sDTO.setOpenday(c_2);
		}

		if (s_3.equals("AGENCY")) {
			sDTO.setAgency(c_3);
		} else if (s_3.equals("AGE")) {
			sDTO.setAge(c_3);
		} else if (s_3.equals("SEX")) {
			sDTO.setSex(c_3);
		} else if (s_3.equals("REGIDENCE")) {
			sDTO.setResidence(c_3);
		} else if (s_3.equals("JOB")) {
			sDTO.setJob(c_3);
		} else if (s_3.equals("OPENDAY")) {
			sDTO.setOpenday(c_3);
		}

		log.info("주제어별 만족도 및 효과평가");
		List<SearchDTO> rList = SafAndEffService.getSer_Service(sDTO);
		if (rList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}
		List<SearchDTO> avgList = SafAndEffService.getSer_Avg_Service(sDTO);
		model.addAttribute("rList", rList);
		model.addAttribute("avgList", avgList);
		model.addAttribute("c_1", c_1);
		model.addAttribute("c_2", c_2);
		model.addAttribute("c_3", c_3);
		return "/SafAndEff/Facility_chart_search";
	}

	@RequestMapping(value = "SaE/Prevent_chart")
	public String Prevent_chart(SearchDTO sDTO, HttpServletRequest request, HttpServletResponse reponse, ModelMap model)
			throws Exception {
		log.info("주제어별 예방 효과평가");
		String s_1 = CmmUtil.nvl(request.getParameter("sub1"));
		String s_2 = CmmUtil.nvl(request.getParameter("sub2"));
		String s_3 = CmmUtil.nvl(request.getParameter("sub3"));
		String c_1 = CmmUtil.nvl(request.getParameter("content1"));
		String c_2 = CmmUtil.nvl(request.getParameter("content2"));
		String c_3 = CmmUtil.nvl(request.getParameter("content3"));

		sDTO.setAgency("%%");
		sDTO.setAge("%%");
		sDTO.setSex("%%");
		sDTO.setResidence("%%");
		sDTO.setOpenday("%%");
		sDTO.setJob("%%");

		if (s_1.equals("AGENCY")) {
			sDTO.setAgency(c_1);
		} else if (s_1.equals("AGE")) {
			sDTO.setAge(c_1);
		} else if (s_1.equals("SEX")) {
			sDTO.setSex(c_1);
		} else if (s_1.equals("REGIDENCE")) {
			sDTO.setResidence(c_1);
		} else if (s_1.equals("JOB")) {
			sDTO.setJob(c_1);
		} else if (s_1.equals("OPENDAY")) {
			sDTO.setOpenday(c_1);
		}

		if (s_2.equals("AGENCY")) {
			sDTO.setAgency(c_2);
		} else if (s_2.equals("AGE")) {
			sDTO.setAge(c_2);
		} else if (s_2.equals("SEX")) {
			sDTO.setSex(c_2);
		} else if (s_2.equals("REGIDENCE")) {
			sDTO.setResidence(c_2);
		} else if (s_2.equals("JOB")) {
			sDTO.setJob(c_2);
		} else if (s_2.equals("OPENDAY")) {
			sDTO.setOpenday(c_2);
		}

		if (s_3.equals("AGENCY")) {
			sDTO.setAgency(c_3);
		} else if (s_3.equals("AGE")) {
			sDTO.setAge(c_3);
		} else if (s_3.equals("SEX")) {
			sDTO.setSex(c_3);
		} else if (s_3.equals("REGIDENCE")) {
			sDTO.setResidence(c_3);
		} else if (s_3.equals("JOB")) {
			sDTO.setJob(c_3);
		} else if (s_3.equals("OPENDAY")) {
			sDTO.setOpenday(c_3);
		}

		log.info(sDTO.getAgency());
		log.info(sDTO.getAge());
		log.info(sDTO.getSex());
		log.info(sDTO.getResidence());
		log.info(sDTO.getJob());
		log.info(sDTO.getOpenday());

		List<SearchDTO> PreventList = SafAndEffService.getSer_Prevent(sDTO);

		if (PreventList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}
		List<SearchDTO> AvgList = SafAndEffService.getSer_Avg_Prevent(sDTO);
		model.addAttribute("PreventList", PreventList);
		model.addAttribute("AvgList", AvgList);
		model.addAttribute("c_1", c_1);
		model.addAttribute("c_2", c_2);
		model.addAttribute("c_3", c_3);

		return "/SafAndEff/Prevent_chart_search";
	}

	@RequestMapping(value = "SaE/Counseling_chart")
	public String Counseling_chart(SearchDTO sDTO, HttpServletRequest request, HttpServletResponse reponse,
			ModelMap model) throws Exception {
		log.info("주제어별 상담 효과평가");
		String s_1 = CmmUtil.nvl(request.getParameter("sub1"));
		String s_2 = CmmUtil.nvl(request.getParameter("sub2"));
		String s_3 = CmmUtil.nvl(request.getParameter("sub3"));
		String c_1 = CmmUtil.nvl(request.getParameter("content1"));
		String c_2 = CmmUtil.nvl(request.getParameter("content2"));
		String c_3 = CmmUtil.nvl(request.getParameter("content3"));

		sDTO.setAgency("%%");
		sDTO.setAge("%%");
		sDTO.setSex("%%");
		sDTO.setResidence("%%");
		sDTO.setOpenday("%%");
		sDTO.setJob("%%");

		if (s_1.equals("AGENCY")) {
			sDTO.setAgency(c_1);
		} else if (s_1.equals("AGE")) {
			sDTO.setAge(c_1);
		} else if (s_1.equals("SEX")) {
			sDTO.setSex(c_1);
		} else if (s_1.equals("REGIDENCE")) {
			sDTO.setResidence(c_1);
		} else if (s_1.equals("JOB")) {
			sDTO.setJob(c_1);
		} else if (s_1.equals("OPENDAY")) {
			sDTO.setOpenday(c_1);
		}

		if (s_2.equals("AGENCY")) {
			sDTO.setAgency(c_2);
		} else if (s_1.equals("PROGRAM_NAME")) {
			sDTO.setProgram_name(c_2);
		} else if (s_2.equals("AGE")) {
			sDTO.setAge(c_2);
		} else if (s_2.equals("SEX")) {
			sDTO.setSex(c_2);
		} else if (s_2.equals("REGIDENCE")) {
			sDTO.setResidence(c_2);
		} else if (s_2.equals("JOB")) {
			sDTO.setJob(c_2);
		} else if (s_2.equals("OPENDAY")) {
			sDTO.setOpenday(c_2);
		}

		if (s_3.equals("AGENCY")) {
			sDTO.setAgency(c_3);
		} else if (s_3.equals("AGE")) {
			sDTO.setAge(c_3);
		} else if (s_3.equals("SEX")) {
			sDTO.setSex(c_3);
		} else if (s_3.equals("REGIDENCE")) {
			sDTO.setResidence(c_3);
		} else if (s_3.equals("JOB")) {
			sDTO.setJob(c_3);
		} else if (s_3.equals("OPENDAY")) {
			sDTO.setOpenday(c_3);
		}
		List<SearchDTO> rList = SafAndEffService.getSer_Counsel(sDTO);
		List<SearchDTO> AvgList = SafAndEffService.getSer_Avg_Counsel(sDTO);
		if (rList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}
		model.addAttribute("rList", rList);
		model.addAttribute("AvgList", AvgList);
		model.addAttribute("c_1", c_1);
		model.addAttribute("c_2", c_2);
		model.addAttribute("c_3", c_3);
		return "/SafAndEff/Counsel_chart_search";
	}

	@RequestMapping(value = "SaE/Healing_chart")
	public String Healing_chart(SearchDTO sDTO, HttpServletRequest request, HttpServletResponse reponse, ModelMap model)
			throws Exception {
		log.info("주제어별  힐링  효과평가");
		String s_1 = CmmUtil.nvl(request.getParameter("sub1"));
		String s_2 = CmmUtil.nvl(request.getParameter("sub2"));
		String s_3 = CmmUtil.nvl(request.getParameter("sub3"));
		String c_1 = CmmUtil.nvl(request.getParameter("content1"));
		String c_2 = CmmUtil.nvl(request.getParameter("content2"));
		String c_3 = CmmUtil.nvl(request.getParameter("content3"));

		sDTO.setAgency("%%");
		sDTO.setAge("%%");
		sDTO.setSex("%%");
		sDTO.setResidence("%%");
		sDTO.setOpenday("%%");
		sDTO.setJob("%%");

		if (s_1.equals("AGENCY")) {
			sDTO.setAgency(c_1);
		} else if (s_1.equals("AGE")) {
			sDTO.setAge(c_1);
		} else if (s_1.equals("SEX")) {
			sDTO.setSex(c_1);
		} else if (s_1.equals("REGIDENCE")) {
			sDTO.setResidence(c_1);
		} else if (s_1.equals("JOB")) {
			sDTO.setJob(c_1);
		} else if (s_1.equals("OPENDAY")) {
			sDTO.setOpenday(c_1);
		}

		if (s_2.equals("AGENCY")) {
			sDTO.setAgency(c_2);
		} else if (s_1.equals("PROGRAM_NAME")) {
			sDTO.setProgram_name(c_2);
		} else if (s_2.equals("AGE")) {
			sDTO.setAge(c_2);
		} else if (s_2.equals("SEX")) {
			sDTO.setSex(c_2);
		} else if (s_2.equals("REGIDENCE")) {
			sDTO.setResidence(c_2);
		} else if (s_2.equals("JOB")) {
			sDTO.setJob(c_2);
		} else if (s_2.equals("OPENDAY")) {
			sDTO.setOpenday(c_2);
		}

		if (s_3.equals("AGENCY")) {
			sDTO.setAgency(c_3);
		} else if (s_3.equals("AGE")) {
			sDTO.setAge(c_3);
		} else if (s_3.equals("SEX")) {
			sDTO.setSex(c_3);
		} else if (s_3.equals("REGIDENCE")) {
			sDTO.setResidence(c_3);
		} else if (s_3.equals("JOB")) {
			sDTO.setJob(c_3);
		} else if (s_3.equals("OPENDAY")) {
			sDTO.setOpenday(c_3);
		}
		log.info(sDTO.getAgency());
		log.info(sDTO.getAge());
		log.info(sDTO.getSex());
		log.info(sDTO.getResidence());
		log.info(sDTO.getJob());
		log.info(sDTO.getOpenday());
		List<SearchDTO> rList = SafAndEffService.getSer_Healing(sDTO);
		if (rList.size() == 0) {
			String msg = "조건에 맞는 데이터가 없습니다.";
			String url = "SearchResult.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "/SafAndEff/redirect";
		}
		List<SearchDTO> AvgList = SafAndEffService.getSer_Avg_Healing(sDTO);
		model.addAttribute("rList", rList);
		model.addAttribute("AvgList", AvgList);
		model.addAttribute("c_1", c_1);
		model.addAttribute("c_2", c_2);
		model.addAttribute("c_3", c_3);
		return "/SafAndEff/Healing_chart_search";
	}

}
