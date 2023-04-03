package poly.controller;

import static poly.util.CmmUtil.convertXSS;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.controller.comm.AbstractController;
import poly.dto.BasicInfoDTO;
import poly.dto.CounselInsertDTO;
import poly.dto.HealingInsertDTO;
import poly.dto.HistoryDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.VibraInsertDTO;
import poly.service.IExcelService;
import poly.service.IHistoryService;
import poly.service.IInsertDataService;
import poly.util.DateUtil;

@Controller
public class CodingController extends AbstractController {

	@Resource(name = "InsertDataService")
	private IInsertDataService insertDataService;

	@Resource(name = "ExcelService")
	private IExcelService excelService;

	@Resource(name = "HistoryService")
	private IHistoryService historyMapper;

	////////////////////////////////////////////////////////////////////////////////////
	// 서비스 만족도 컨트롤러
	@RequestMapping(value = "insertForm/serviceInsertForm")
	public String index(BasicInfoDTO bDTO, HttpServletRequest request, HttpServletResponse reponse,
			HttpSession session) {
		log.info("insertForm/serviceInsertForm start");
		log.info(session.getAttribute("user_name"));
		if (session.getAttribute("user_name") == null) {
			String url = "/";
			String msg = "로그인을 해주세요.";
			request.setAttribute("url", url);
			request.setAttribute("msg", msg);
			return "/redirect";
		}

		log.info("insertForm/serviceInsertForm end");
		return "/insertForm/serviceInsertForm";
	}

	@RequestMapping(value = "insertForm/serviceInsertForm/insertData")
	@ResponseBody
	public String serviceInsertData(@ModelAttribute ServiceInsertDTO serviceDtoList, HttpServletResponse response,
			HttpSession session) throws Exception {

		log.info("insertForm/serviceInsertForm/insertData start");

		try {
			// log 찍어보기
			for (int i = 0; i < serviceDtoList.getServiceDtoList().size(); i++) {
				serviceDtoList.getServiceDtoList().get(i)
						.setAgency(convertXSS(serviceDtoList.getServiceDtoList().get(i).getAgency()));
			}
		} catch (NullPointerException e) {
			log.info(e);
			return "fail";
		}

		// 엑셀파일 내려받기 (컨텐츠 타입과 파일명 지정)
		log.info("excelService.excelDownload start!");
		XSSFWorkbook wb = excelService.excelDownload(serviceDtoList);
		log.info("excelService.excelDownload end!");
		// 컨텐츠 타입과 파일명 지정
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		OutputStream out = response.getOutputStream();
		wb.write(out);
		out.flush();

		// 엑셀 출력
		String projectPath = System.getProperty("user.home");
		log.info(projectPath);
		String name = "_서비스만족도";
		String date = serviceDtoList.getServiceDtoList().get(0).getOpenday();
		String agency = serviceDtoList.getServiceDtoList().get(0).getAgency();
		log.info(date);

		// C드라이브 밑에 excel 폴더 확인
		String checkFolder = "C:\\excel";
		File Folder = new File(checkFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		// 폴더 구별해주기
		String detailFolder = checkFolder + "\\" + date + "_" + agency;
		Folder = new File(detailFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		String localFile = detailFolder + "\\" + date + "_" + agency + name + ".xlsx";
		File file = new File(localFile);

		FileOutputStream fos = null;
		fos = new FileOutputStream(file);
		wb.write(fos);
		wb.close();
		log.info("excelDown end");
		// ***************************************************

		// 데이터 저장하기
		int result = insertDataService.serviceInsertData(serviceDtoList);

		// history 기록 남기기
		HistoryDTO hDTO = new HistoryDTO();
		hDTO.setDescription("서비스환경 만족도 입력");
		hDTO.setReg_id((String) session.getAttribute("user_name"));
		hDTO.setDate(DateUtil.getDateTime());

		int historyResult = historyMapper.InsertHistory(hDTO);
		if (historyResult == 1) {
			log.info("history Insert");
		} else {
			log.info("history Insert Fail");
		}
		// history 기록 끝

		if (result != 0) {
			log.info("insert success");
		} else {
			log.info("insert fail");
		}
		// 프로그램 결과 입력에서 전달 받은 세션 정보를 사용한 후 false 값으로 초기화 시킨다.
		session.setAttribute("basic_end", false);
		log.info("insertForm/serviceInsertForm/insertData end");
		return "success";
	}
	// 서비스 만족도 END ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////
	// 프로그램 만족도 컨트롤러
	@RequestMapping(value = "insertForm/programInsertForm")
	public String programInsertForm(HttpServletRequest request, HttpServletResponse reponse) {

		log.info(this.getClass().getName() + ".programInsertForm");

		return "/insertForm/programInsertForm";
	}

	@RequestMapping(value = "insertForm/programInsertForm/insertData")
	@ResponseBody
	public String programInsertData(@ModelAttribute ProgramInsertDTO programDtoList, HttpServletResponse response,
			HttpSession session) throws Exception {

		log.info("insertForm/programInsertForm/insertData start");
		// log 찍어보기

		try {
			for (int i = 0; i < programDtoList.getProgramDtoList().size(); i++) {
				programDtoList.getProgramDtoList().get(i)
						.setAgency(convertXSS(programDtoList.getProgramDtoList().get(i).getAgency()));
			}

		} catch (NullPointerException e) {
			log.info(e);
			return "fail";
		}

		// 엑셀파일 내려받기 (컨텐츠 타입과 파일명 지정)
		log.info("excelService.excelDownload start!");
		XSSFWorkbook wb = excelService.excelDownload(programDtoList);
		log.info("excelService.excelDownload end!");
		// 컨텐츠 타입과 파일명 지정
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		OutputStream out = response.getOutputStream();
		wb.write(out);
		out.flush();

		// 엑셀 출력
		String projectPath = System.getProperty("user.home");
		log.info(projectPath);
		String name = "_프로그램만족도";
		String date = programDtoList.getProgramDtoList().get(0).getOpenday();
		String agency = programDtoList.getProgramDtoList().get(0).getAgency();
		String program_name = programDtoList.getProgramDtoList().get(0).getProgram_name();
		log.info(date);
		// C드라이브 밑에 excel 폴더 확인
		String checkFolder = "C:\\excel";
		File Folder = new File(checkFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		// 폴더 구별해주기
		String detailFolder = checkFolder + "\\" + date + "_" + agency;
		Folder = new File(detailFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		String localFile = detailFolder + "\\" + date + "_" + agency + "_" + program_name + name + ".xlsx";
		File file = new File(localFile);
		FileOutputStream fos = null;
		fos = new FileOutputStream(file);
		wb.write(fos);
		wb.close();
		log.info("excelDown end");
		// ***************************************************

		int result = insertDataService.programInsertData(programDtoList);

		// history 기록 남기기
		HistoryDTO hDTO = new HistoryDTO();
		hDTO.setDescription("프로그램 만족도 입력");
		hDTO.setReg_id((String) session.getAttribute("user_name"));
		hDTO.setDate(DateUtil.getDateTime());

		int historyResult = historyMapper.InsertHistory(hDTO);
		if (historyResult == 1) {
			log.info("history Insert");
		} else {
			log.info("history Insert Fail");
		}
		// history 기록 끝

		if (result != 0) {
			log.info("insert success");
			log.info("result : " + result);
		} else {
			log.info("insert fail");
			log.info("result : " + result);
		}
		// 프로그램 결과 입력에서 전달 받은 세션 정보를 사용한 후 false 값으로 초기화 시킨다.
		session.setAttribute("basic_end", false);
		log.info("insertForm/programInsertForm/insertData end");
		return "success";
	}
	// 프로그램 만족도 끝.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`
	////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////
	// 상담&치유 서비스 효과평가 컨트롤러
	@RequestMapping(value = "insertForm/counselInsertForm")
	public String counselInsertForm(HttpServletRequest request, HttpServletResponse reponse) {

		log.info(this.getClass().getName() + ".counselInsertForm");

		return "/insertForm/counselInsertForm";
	}

	@RequestMapping(value = "insertForm/counselInsertForm/insertData", method = RequestMethod.POST)
	public @ResponseBody String counselInsertData(@ModelAttribute CounselInsertDTO counselDtoList,
			HttpServletResponse response, HttpSession session) throws Exception {

		log.info("insertForm/counselInsertForm/counselinsertData start");
		try {
			if (counselDtoList.getCounselDtoList().get(0).getPv().equals("종결")) {
				for (int i = 0; i < counselDtoList.getCounselDtoList().size(); i++) {
					counselDtoList.getCounselDtoList().get(i).setPv("사후");
					counselDtoList.getCounselDtoList().get(i)
							.setAgency(convertXSS(counselDtoList.getCounselDtoList().get(i).getAgency()));
				}
			}
		} catch (NullPointerException e) {
			log.info(e);
			return "fail";
		}

		// 엑셀파일 내려받기 (컨텐츠 타입과 파일명 지정)
		log.info("excelService.excelDownload start!");
		XSSFWorkbook wb = excelService.excelDownload(counselDtoList);
		log.info("excelService.excelDownload end!");
		// 컨텐츠 타입과 파일명 지정
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		OutputStream out = response.getOutputStream();
		wb.write(out);
		out.flush();

		// 엑셀 출력
		String projectPath = System.getProperty("user.home");
		log.info(projectPath);
		// 21.05.13_폴리텍
		String name = "_상담치유서비스효과평가";
		String date = counselDtoList.getCounselDtoList().get(0).getOpenday();
		String agency = counselDtoList.getCounselDtoList().get(0).getAgency();
		String pv = "_" + counselDtoList.getCounselDtoList().get(0).getPv();
		log.info(date);

		// C드라이브 밑에 excel 폴더 확인
		String checkFolder = "C:\\excel";
		File Folder = new File(checkFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		// 폴더 구별해주기
		String detailFolder = checkFolder + "\\" + date + "_" + agency;
		Folder = new File(detailFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		String localFile = detailFolder + "\\" + date + "_" + agency + name + pv + ".xlsx";
		File file = new File(localFile);

		FileOutputStream fos = null;
		fos = new FileOutputStream(file);
		wb.write(fos);
		wb.close();
		log.info("excelDown end");
		// ***************************************************

		int result = insertDataService.counselInsertData(counselDtoList);
		// history 기록 남기기
		HistoryDTO hDTO = new HistoryDTO();
		hDTO.setDescription("상담&치유서비스 효과평가 입력");
		hDTO.setReg_id((String) session.getAttribute("user_name"));
		hDTO.setDate(DateUtil.getDateTime());

		int historyResult = historyMapper.InsertHistory(hDTO);
		if (historyResult == 1) {
			log.info("history Insert");
		} else {
			log.info("history Insert Fail");
		}
		// history 기록 끝

		if (result != 0) {
			log.info("insert success");
		} else {
			log.info("insert fail");
		}
		// 프로그램 결과 입력에서 전달 받은 세션 정보를 사용한 후 false 값으로 초기화 시킨다.
		session.setAttribute("basic_end", false);
		log.info("insertForm/counselInsertForm/counselinsertData end");
		return "success";
	}

	// 상담&치유 접수면접 서비스 효과평가 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////
	// 예방서비스 효과평가 컨트롤러
	@RequestMapping(value = "insertForm/preventInsertForm")
	public String preventInsertForm(HttpServletRequest request, HttpServletResponse reponse) {

		log.info(this.getClass().getName() + ".preventInsertForm");

		return "/insertForm/preventInsertForm";
	}

	@RequestMapping(value = "insertForm/preventInsertForm/insertData", method = RequestMethod.POST)
	@ResponseBody
	public String preventInsertData(@ModelAttribute PreventInsertDTO preventDtoList, HttpServletResponse response,
			HttpSession session) throws Exception {

		log.info("insertForm/preventInsertData/insertData start");
		try {
			// log 찍어보기
			for (int i = 0; i < preventDtoList.getPreventDtoList().size(); i++) {
				preventDtoList.getPreventDtoList().get(i)
						.setAgency(convertXSS(preventDtoList.getPreventDtoList().get(i).getAgency()));
			}
		} catch (NullPointerException e) {
			log.info(e);
			return "fail";
		}

		// 컨텐츠 타입과 파일명 지정
		// 엑셀파일 내려받기 (컨텐츠 타입과 파일명 지정)
		log.info("excelService.excelDownload start!");
		XSSFWorkbook wb = excelService.excelDownload(preventDtoList);
		log.info("excelService.excelDownload end!");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		OutputStream out = response.getOutputStream();
		wb.write(out);
		out.flush();

		// 엑셀 출력
		String projectPath = System.getProperty("user.home");
		log.info(projectPath);
		String name = "_예방서비스효과평가";
		String date = preventDtoList.getPreventDtoList().get(0).getOpenday();
		String agency = preventDtoList.getPreventDtoList().get(0).getAgency();
		String pv = "_" + preventDtoList.getPreventDtoList().get(0).getPv();
		log.info(date);

		// C드라이브 밑에 excel 폴더 확인
		String checkFolder = "C:\\excel";
		File Folder = new File(checkFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		// 폴더 구별해주기
		String detailFolder = checkFolder + "\\" + date + "_" + agency;
		Folder = new File(detailFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		String localFile = detailFolder + "\\" + date + "_" + agency + name + pv + ".xlsx";
		File file = new File(localFile);

		FileOutputStream fos = null;
		fos = new FileOutputStream(file);
		wb.write(fos);
		wb.close();
		log.info("excelDown end");
		// ***************************************************

		int result = insertDataService.preventInsertData(preventDtoList);

		// history 기록 남기기
		HistoryDTO hDTO = new HistoryDTO();
		hDTO.setDescription("예방서비스 효과평가 입력");
		hDTO.setReg_id((String) session.getAttribute("user_name"));
		hDTO.setDate(DateUtil.getDateTime());

		int historyResult = historyMapper.InsertHistory(hDTO);
		if (historyResult == 1) {
			log.info("history Insert");
		} else {
			log.info("history Insert Fail");
		}
		// history 기록 끝

		if (result != 0) {
			log.info("insert success");
		} else {
			log.info("insert fail");
		}
		// 프로그램 결과 입력에서 전달 받은 세션 정보를 사용한 후 false 값으로 초기화 시킨다.
		session.setAttribute("basic_end", false);
		log.info("insertForm/preventInsertData/insertData end");
		return "success";
	}
	// 예방 서비스 효과평가 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////////////////////////////////////////////////////
	// 힐링서비스 효과평가 컨트롤러
	@RequestMapping(value = "insertForm/healingInsertForm")
	public String healingInsertForm(HttpServletRequest request, HttpServletResponse reponse) {

		log.info(this.getClass().getName() + ".healingInsertForm");

		return "/insertForm/healingInsertForm";
	}

	@RequestMapping(value = "insertForm/healingInsertForm/insertData", method = RequestMethod.POST)
	@ResponseBody
	public String healinInsertData(@ModelAttribute HealingInsertDTO healingDtoList, HttpServletResponse response,
			HttpSession session) throws Exception {

		log.info("insertForm/preventInsertData/insertData start");

		try {
			// log 찍어보기
			for (int i = 0; i < healingDtoList.getHealingDtoList().size(); i++) {
				healingDtoList.getHealingDtoList().get(i)
						.setAgency(convertXSS(healingDtoList.getHealingDtoList().get(i).getAgency()));
			}
		} catch (NullPointerException e) {
			log.info(e);
			return "fail";
		}

		// 컨텐츠 타입과 파일명 지정
		// 엑셀파일 내려받기 (컨텐츠 타입과 파일명 지정)
		log.info("excelService.excelDownload start!");
		XSSFWorkbook wb = excelService.excelDownload(healingDtoList);
		log.info("excelService.excelDownload end!");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		OutputStream out = response.getOutputStream();
		wb.write(out);
		out.flush();

		// 엑셀 출력
		String projectPath = System.getProperty("user.home");
		log.info(projectPath);
		String name = "_힐링서비스효과평가";
		String date = healingDtoList.getHealingDtoList().get(0).getOpenday();
		String agency = healingDtoList.getHealingDtoList().get(0).getAgency();
		String pv = "_" + healingDtoList.getHealingDtoList().get(0).getPv();
		log.info(date);

		// C드라이브 밑에 excel 폴더 확인
		String checkFolder = "C:\\excel";
		File Folder = new File(checkFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		// 폴더 구별해주기
		String detailFolder = checkFolder + "\\" + date + "_" + agency;
		Folder = new File(detailFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		String localFile = detailFolder + "\\" + date + "_" + agency + name + pv + ".xlsx";
		File file = new File(localFile);

		FileOutputStream fos = null;
		fos = new FileOutputStream(file);
		wb.write(fos);
		wb.close();
		log.info("excelDown end");
		// ***************************************************

		int result = insertDataService.healingInsertData(healingDtoList);

		// history 기록 남기기
		HistoryDTO hDTO = new HistoryDTO();
		hDTO.setDescription("힐링서비스 효과평가 입력");
		hDTO.setReg_id((String) session.getAttribute("user_name"));
		hDTO.setDate(DateUtil.getDateTime());

		int historyResult = historyMapper.InsertHistory(hDTO);
		if (historyResult == 1) {
			log.info("history Insert");
		} else {
			log.info("history Insert Fail");
		}
		// history 기록 끝

		if (result != 0) {
			log.info("insert success");
		} else {
			log.info("insert fail");
		}
		// 프로그램 결과 입력에서 전달 받은 세션 정보를 사용한 후 false 값으로 초기화 시킨다.
		session.setAttribute("basic_end", false);
		log.info("insertForm/preventInsertData/insertData end");
		return "success";
	}

	// start 홍두표
	// ////////////////////////////////////////////////////////////////////////////////////
	// 힐링 서비스 - ajax 기관명과 시작일자를 DB에서 조회한 후 사전 기록이 존재하면 불러와서 화면에 출력
	@RequestMapping(value = "insertForm/healingInsertForm/getPreviousHealingList")
	public String getPreviousHealingList(@ModelAttribute HealingInsertDTO hiDTO, Model model) throws Exception {
		log.info(this.getClass() + ".getPreviousHealingList Controller start");
		log.info("agency : " + hiDTO.getAgency() + ", openday : " + hiDTO.getOpenday());
		List<HealingInsertDTO> hList = insertDataService.getPreviousHealingList(hiDTO); // 사전 데이터가 존재하면 불러온다
		if (hList.size() == 0) {
			hList = new ArrayList<HealingInsertDTO>();
			log.info("no size");
			return "/insertForm/binpage";
		}
		model.addAttribute("hList", hList);
		log.info("total_size : " + hList.size());
		log.info(this.getClass() + ".getPreviousHealingList Controller end");

		return "/insertForm/healingRow";
	}

	// 예방 서비스 - ajax 기관명과 시작일자를 DB에서 조회한 후 사전 기록이 존재하면 불러와서 화면에 출력
	@RequestMapping(value = "insertForm/preventInsertForm/getPreviousPreventList")
	public String getPreviousPreventList(@ModelAttribute PreventInsertDTO piDTO, Model model) throws Exception {
		log.info(this.getClass() + ".getPreviousPreventList Controller start");
		log.info("agency : " + piDTO.getAgency() + ", openday : " + piDTO.getOpenday());
		List<PreventInsertDTO> pList = insertDataService.getPreviousPreventList(piDTO); // 사전 데이터가 존재하면 불러온다
		if (pList.size() == 0) {
			pList = new ArrayList<PreventInsertDTO>();
			log.info("no size");
			return "/insertForm/binpage";
		}
		model.addAttribute("pList", pList);
		log.info("total_size : " + pList.size());
		log.info(this.getClass() + ".getPreviousPreventList Controller end");

		return "/insertForm/preventRow";
	}

	// 상담&치유 서비스 - ajax 기관명과 시작일자를 DB에서 조회한 후 사전 기록이 존재하면 불러와서 화면에 출력
	@RequestMapping(value = "insertForm/counselInsertForm/getPreviousCounselList")
	public String getPreviousCounselList(@ModelAttribute CounselInsertDTO ciDTO, Model model) throws Exception {
		log.info(this.getClass() + ".getPreviousCounselList Controller start");
		log.info("agency: " + ciDTO.getAgency() + ", openday: " + ciDTO.getOpenday());
		List<CounselInsertDTO> cList = insertDataService.getPreviousCounselList(ciDTO); // 사전 데이터가 존재하면 불러온다
		if (cList.size() == 0) {
			cList = new ArrayList<CounselInsertDTO>();
			log.info("no size");
			return "/insertForm/binpage";
		}
		model.addAttribute("cList", cList);
		log.info("total_size : " + cList.size());
		log.info(this.getClass() + ".getPreviousCounselList Controller end");

		return "/insertForm/counselRow";
	}

	// 프로그램 만족도 - ajax 기관명과 시작일자를 DB에서 조회한 후 사전 기록이 존재하면 불러와서 화면에 출력
	@RequestMapping(value = "insertForm/programInsertForm/getPreviousProgramList")
	public String getPreviousProgramList(@ModelAttribute ProgramInsertDTO priDTO, Model model) throws Exception {
		log.info(this.getClass() + ".getPreviousProgramList Controller start");
		log.info("agency: " + priDTO.getAgency() + ", openday: " + priDTO.getOpenday());
		int programCnt = insertDataService.getProgramCount(priDTO);
		if (programCnt >= 7) {
			log.info("program cnt exceed");
			return "/insertForm/exceed";
		}
		List<ProgramInsertDTO> prList = insertDataService.getPreviousProgramList(priDTO); // 사전 데이터가 존재하면 불러온다
		if (prList.size() == 0) {
			prList = new ArrayList<ProgramInsertDTO>();
			log.info("no size");
			return "/insertForm/binpage";
		}
		model.addAttribute("prList", prList);
		log.info("total_size : " + prList.size());
		log.info(this.getClass() + ".getPreviousProgramList Controller end");

		return "/insertForm/programRow";
	}

	// 서비스환경 만족도 - ajax 기관명과 시작일자를 DB에서 조회한 후 사전 기록이 존재하면 불러와서 화면에 출력
	@RequestMapping(value = "insertForm/serviceInsertForm/getPreviousServiceList")
	public String getPreviousServiceList(@ModelAttribute ServiceInsertDTO siDTO, Model model) throws Exception {
		log.info(this.getClass() + ".getPreviousServiceList Controller start");
		log.info("agency: " + siDTO.getAgency() + ", openday: " + siDTO.getOpenday());
		List<ServiceInsertDTO> sList = insertDataService.getPreviousServiceList(siDTO); // 사전 데이터가 존재하면 불러온다
		if (sList.size() == 0) {
			sList = new ArrayList<ServiceInsertDTO>();
			log.info("no size");
			return "/insertForm/binpage";
		}
		model.addAttribute("sList", sList);
		log.info("total_size : " + sList.size());
		log.info(this.getClass() + ".getPreviousServiceList Controller end");

		return "/insertForm/serviceRow";
	}

	// hrv 만족도 - ajax 기관명과 시작일자를 DB에서 조회한 후 사전 기록이 존재하면 불러와서 화면에 출력
	@RequestMapping(value = "insertForm/hrvInsertForm/getPreviousHrvList")
	public String getPreviousHrvList(@ModelAttribute HrvInsertDTO hrviDTO, Model model) throws Exception {
		log.info(this.getClass() + ".getPreviousHrvList Controller start");
		log.info("agency: " + hrviDTO.getAgency() + ", PV: " + hrviDTO.getPv());
		List<HrvInsertDTO> hrvList = insertDataService.getPreviousHrvList(hrviDTO); // 사전 데이터가 존재하면 불러온다
		if (hrvList.size() == 0) {
			hrvList = new ArrayList<HrvInsertDTO>();
			log.info("no size");
			return "/insertForm/binpage";
		}
		model.addAttribute("hrvList", hrvList);
		log.info("total_size : " + hrvList.size());
		log.info(this.getClass() + ".getPreviousHrvList Controller end");

		return "/insertForm/hrvRow";
	}

	// 바이브라 만족도 - ajax 기관명과 시작일자를 DB에서 조회한 후 사전 기록이 존재하면 불러와서 화면에 출력
	@RequestMapping(value = "insertForm/vibraInsertForm/getPreviousVibraList")
	public String getPreviousVibraList(@ModelAttribute VibraInsertDTO viDTO, Model model) throws Exception {
		log.info(this.getClass() + ".getPreviousVibraList Controller start");
		log.info("agency: " + viDTO.getAgency() + ", PV: " + viDTO.getPv());
		List<VibraInsertDTO> vList = insertDataService.getPreviousVibraList(viDTO); // 사전 데이터가 존재하면 불러온다
		if (vList.size() == 0) {
			vList = new ArrayList<VibraInsertDTO>();
			log.info("no size");
			return "/insertForm/binpage";
		}
		model.addAttribute("vList", vList);
		log.info("total_size : " + vList.size());
		log.info(this.getClass() + ".getPreviousVibraList Controller end");

		return "/insertForm/vibraRow";
	}

	// 에러 페이지 테스트
	@RequestMapping(value = "returnError")
	public String returnError(@ModelAttribute VibraInsertDTO viDTO, Model model) throws Exception {
		log.info(this.getClass() + ".returnError Controller start");
		log.info(this.getClass() + ".returnError Controller end");

		return "/common/error";
	}

	// 홍두표
	// end////////////////////////////////////////////////////////////////////////////////////

	// 힐링 서비스 효과평가 끝 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	////////////////////////////////////////////////////////////////////////////////////

	// 자율신경계
	@RequestMapping(value = "insertForm/hrvInsertForm")
	public String hrvInsertForm(HttpServletRequest request, HttpServletResponse reponse) {

		log.info(this.getClass().getName() + ".hrvInsertForm");

		return "/insertForm/hrvInsertForm";
	}

	@RequestMapping(value = "insertForm/hrvInsertForm/insertData", method = RequestMethod.POST)
	@ResponseBody
	public String hrvInsertData(@ModelAttribute HrvInsertDTO hrvDtoList, HttpServletResponse response,
			HttpSession session) throws Exception {

		try {
			log.info(this.getClass().getName() + ".hrvInsertData Start!!");
			// log 찍어보기
			for (int i = 0; i < hrvDtoList.getHrvDtoList().size(); i++) {
				hrvDtoList.getHrvDtoList().get(i).setAgency(convertXSS(hrvDtoList.getHrvDtoList().get(i).getAgency()));
			}
		} catch (Exception e) {
			log.info(e);
			return " ";
		}

		// 컨텐츠 타입과 파일명 지정
		// 엑셀파일 내려받기 (컨텐츠 타입과 파일명 지정)
		log.info("excelService.excelDownload start!");
		XSSFWorkbook wb = excelService.excelDownload(hrvDtoList);
		log.info("excelService.excelDownload end!");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		OutputStream out = response.getOutputStream();
		wb.write(out);
		out.flush();

		// 엑셀 출력
		String projectPath = System.getProperty("user.home");
		log.info(projectPath);
		String name = "_HRV측정검사";
		String date = hrvDtoList.getHrvDtoList().get(0).getDate();
		String agency = hrvDtoList.getHrvDtoList().get(0).getAgency();
		String pv = "_" + hrvDtoList.getHrvDtoList().get(0).getPv();
		log.info(date);

		// C드라이브 밑에 excel 폴더 확인
		String checkFolder = "C:\\excel";
		File Folder = new File(checkFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		// 폴더 구별해주기
		String detailFolder = checkFolder + "\\" + date + "_" + agency;
		Folder = new File(detailFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		String localFile = detailFolder + "\\" + date + "_" + agency + name + pv + ".xlsx";
		File file = new File(localFile);

		FileOutputStream fos = null;
		fos = new FileOutputStream(file);
		wb.write(fos);
		wb.close();
		log.info("excelDown end");
		// ***************************************************

		int result = insertDataService.hrvInsertData(hrvDtoList);

		// history 기록 남기기
		HistoryDTO hDTO = new HistoryDTO();
		hDTO.setDescription("HRV 측정검사 입력");
		hDTO.setReg_id((String) session.getAttribute("user_name"));
		hDTO.setDate(DateUtil.getDateTime());

		int historyResult = historyMapper.InsertHistory(hDTO);
		if (historyResult == 1) {
			log.info("history Insert");
		} else {
			log.info("history Insert Fail");
		}
		// history 기록 끝

		if (result != 0) {
			log.info("insert success");
		} else {
			log.info("insert fail");
		}

		// 프로그램 결과 입력에서 전달 받은 세션 정보를 사용한 후 false 값으로 초기화 시킨다.
		session.setAttribute("basic_end", false);
		log.info(this.getClass().getName() + ".hrvInsertData End!!");
		return "success";
	}

	// 바이브라 화면
	@RequestMapping(value = "insertForm/vibraInsertForm")
	public String vibraInserForm() {
		log.info(this.getClass().getName() + ".vibraInsertForm.do Start !!");
		log.info(this.getClass().getName() + ".vibraInsertForm.do End !!");

		return "/insertForm/vibraInsertForm";
	}

	@RequestMapping(value = "insertForm/vibraInsertForm/insertData", method = RequestMethod.POST)
	@ResponseBody
	public String vibraInsertData(@ModelAttribute VibraInsertDTO vibraDtoList, HttpServletResponse response,
			HttpSession session) throws Exception {

		log.info(this.getClass().getName() + ".vibraInsertData Start!!");
		try {
			// log 찍어보기
			for (int i = 0; i < vibraDtoList.getVibraDtoList().size(); i++) {
				vibraDtoList.getVibraDtoList().get(i)
						.setAgency(convertXSS(vibraDtoList.getVibraDtoList().get(i).getAgency()));
			}

		} catch (NullPointerException e) {
			log.info(e);
			return " ";
		}

		// 컨텐츠 타입과 파일명 지정
		// 엑셀파일 내려받기 (컨텐츠 타입과 파일명 지정)
		log.info("excelService.excelDownload start!");
		XSSFWorkbook wb = excelService.excelDownload(vibraDtoList);
		log.info("excelService.excelDownload end!");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=test.xlsx");
		OutputStream out = response.getOutputStream();
		wb.write(out);
		out.flush();

		// 엑셀 출력
		String projectPath = System.getProperty("user.home");
		log.info(projectPath);
		String name = "_바이브라측정검사";
		String date = vibraDtoList.getVibraDtoList().get(0).getDate();
		String agency = vibraDtoList.getVibraDtoList().get(0).getAgency();
		String pv = "_" + vibraDtoList.getVibraDtoList().get(0).getPv();
		log.info(date);

		// C드라이브 밑에 excel 폴더 확인
		String checkFolder = "C:\\excel";
		File Folder = new File(checkFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		// 폴더 구별해주기
		String detailFolder = checkFolder + "\\" + date + "_" + agency;
		Folder = new File(detailFolder);
		if (!Folder.exists()) {
			Folder.mkdir();
			Folder = null;
		}
		String localFile = detailFolder + "\\" + date + "_" + agency + name + pv + ".xlsx";
		File file = new File(localFile);

		FileOutputStream fos = null;
		fos = new FileOutputStream(file);
		wb.write(fos);
		wb.close();
		log.info("excelDown end");
		// ***************************************************
		int result = insertDataService.vibraInsertData(vibraDtoList);

		// history 기록 남기기
		HistoryDTO hDTO = new HistoryDTO();
		hDTO.setDescription("바이브라 측정검사 입력");
		hDTO.setReg_id((String) session.getAttribute("user_name"));
		hDTO.setDate(DateUtil.getDateTime());

		int historyResult = historyMapper.InsertHistory(hDTO);
		if (historyResult == 1) {
			log.info("history Insert");
		} else {
			log.info("history Insert Fail");
		}
		// history 기록 끝

		if (result != 0) {
			log.info("insert success");
		} else {
			log.info("insert fail");
		}
		// 프로그램 결과 입력에서 전달 받은 세션 정보를 사용한 후 false 값으로 초기화 시킨다.
		session.setAttribute("basic_end", false);
		log.info(this.getClass().getName() + ".vibraInsertData End!!");
		return "1";
	}

	// 수정하기 화면
	@RequestMapping(value = "updateForm/updateList")
	public String updateList() throws Exception {
		log.info(this.getClass().getName() + ".updateList.do Start !!");
		log.info(this.getClass().getName() + ".updateList.do End !!");
		return "/updateForm/updateList";
	}

}
