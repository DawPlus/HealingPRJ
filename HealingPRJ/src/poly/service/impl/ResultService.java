package poly.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BasicInfoDTO;
import poly.dto.ExpenseDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.IncomeDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;
import poly.persistance.mapper.IResultMapper;
import poly.service.IResultService;
import poly.service.comm.AbstractService;

@Service("ResultService")
public class ResultService extends AbstractService implements IResultService {

	@Resource(name = "ResultMapper")
	private IResultMapper resultMapper;

	@Override
	public List<BasicInfoDTO> getBasiclist(BasicInfoDTO bDTO) throws Exception {
		log.info("시비스 단 실행 시작");
		log.info("서비스 단에서의 기업명  : " + bDTO.getAgency());
		log.info("서비스 단에서의 기업명  : " + bDTO.getOpenday());
		List<BasicInfoDTO> basicInfo = resultMapper.getBasicInfo(bDTO);
		log.info("서비스 단 종료 ");
		return basicInfo;
	}

	@Override
	public List<BasicInfoDTO> getProgrmaList(BasicInfoDTO bDTO) throws Exception {
		log.info("서비스 단 프로그램 리스트 가져오기 시작");
		List<BasicInfoDTO> rList = resultMapper.getProgramList(bDTO);

		return rList;
	}

	@Override
	public List<ServiceInsertDTO> getServicelist(ServiceInsertDTO uDTO) throws Exception {
		log.info("시설서비스 만족도 ");
		List<ServiceInsertDTO> rList = resultMapper.getServicelist(uDTO);
		return rList;
	}

	@Override
	public ArrayList<String> getPre_PreList(SearchDTO sDTO) throws Exception {
		log.info("예방 서비스 효과평가");
		ArrayList<String> rlist = new ArrayList<String>();
		List<SearchDTO> Pre_PreList = resultMapper.getPre_PreList(sDTO);
		List<SearchDTO> Af_PreList = resultMapper.getAf_PreList(sDTO);
		rlist.add(Pre_PreList.get(0).getSum1());
		rlist.add(Af_PreList.get(0).getSum2());
		rlist.add(Pre_PreList.get(0).getAvg1());
		rlist.add(Af_PreList.get(0).getAvg2());
		return rlist;
	}

	@Override
	public ArrayList<String> getPre_CounselList(SearchDTO sDTO) throws Exception {
		log.info("상담 서비스 효과평가");
		ArrayList<String> rlist = new ArrayList<String>();
		List<SearchDTO> Pre_CounselList = resultMapper.getPre_CounselList(sDTO);
		List<SearchDTO> Af_CounselList = resultMapper.getAf_CounselList(sDTO);
		rlist.add(Pre_CounselList.get(0).getSum1());
		rlist.add(Af_CounselList.get(0).getSum2());
		rlist.add(Pre_CounselList.get(0).getAvg1());
		rlist.add(Af_CounselList.get(0).getAvg2());
		return rlist;
	}

	@Override
	public ArrayList<String> getPre_HealingList(SearchDTO sDTO) throws Exception {
		log.info("힐링 서비스 효과평가");
		ArrayList<String> rlist = new ArrayList<String>();
		List<SearchDTO> Pre_HealingList = resultMapper.getPre_HealingList(sDTO);
		List<SearchDTO> Af_HealingList = resultMapper.getAf_HealingList(sDTO);
		rlist.add(Pre_HealingList.get(0).getSum1());
		rlist.add(Af_HealingList.get(0).getSum2());
		rlist.add(Pre_HealingList.get(0).getAvg1());
		rlist.add(Af_HealingList.get(0).getAvg2());
		return rlist;
	}

	@Override
	public ArrayList<String> getProgramEffect(SearchDTO sDTO) throws Exception {
		ArrayList<String> rlist = new ArrayList<String>();
		List<SearchDTO> Pre_PreList = resultMapper.getPre_PreList(sDTO);
		List<SearchDTO> Af_PreList = resultMapper.getAf_PreList(sDTO);
		List<SearchDTO> Pre_CounselList = resultMapper.getPre_CounselList(sDTO);
		List<SearchDTO> Af_CounselList = resultMapper.getAf_CounselList(sDTO);
		List<SearchDTO> Pre_HealingList = resultMapper.getPre_HealingList(sDTO);
		List<SearchDTO> Af_HealingList = resultMapper.getAf_HealingList(sDTO);
		rlist.add(Pre_PreList.get(0).getSum1());
		rlist.add(Af_PreList.get(0).getSum2());
		rlist.add(Pre_PreList.get(0).getAvg1());
		rlist.add(Af_PreList.get(0).getAvg2());
		rlist.add(Pre_CounselList.get(0).getSum1());
		rlist.add(Af_CounselList.get(0).getSum2());
		rlist.add(Pre_CounselList.get(0).getAvg1());
		rlist.add(Af_CounselList.get(0).getAvg2());
		rlist.add(Pre_HealingList.get(0).getSum1());
		rlist.add(Af_HealingList.get(0).getSum2());
		rlist.add(Pre_HealingList.get(0).getAvg1());
		rlist.add(Af_HealingList.get(0).getAvg2());
		return rlist;
	}

	@Override
	public int[] getOperationlist(ProgramOperationDTO poDTO) throws Exception {
		log.info("프로그램 운영");
		int[] array = new int[39];
		List<ProgramOperationDTO> operationList = resultMapper.getoperationList(poDTO);
		for (int i = 0; i < 39; i++) {
			array[i] = 0;
		}
		log.info(operationList.get(0).getProgram_in_out2().size());
		int a = 5;
		for (int j = 0; j < operationList.get(0).getProgram_in_out2().size() / 5; j++) {
			int k = a * j;
			if (operationList.get(0).getProgram_in_out2().get(k + 1).equals("산림교육")) {
				array[0]++;
				array[1] = array[1] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 3));
				array[2] = array[2] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 4));

			} else if (operationList.get(0).getProgram_in_out2().get(k + 1).equals("예방교육")) {
				array[3]++;
				array[4] = array[4] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 3));
				array[5] = array[5] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 4));

			} else if (operationList.get(0).getProgram_in_out2().get(k + 1).equals("산림치유")) {
				array[6]++;
				array[7] = array[7] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 3));
				array[8] = array[8] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 4));

			} else if (operationList.get(0).getProgram_in_out2().get(k + 1).equals("에너제틱")) {
				array[9]++;
				array[10] = array[10] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 3));
				array[11] = array[11] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 4));

			} else if (operationList.get(0).getProgram_in_out2().get(k + 1).equals("아트")) {
				array[12]++;
				array[13] = array[13] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 3));
				array[14] = array[14] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 4));

			} else if (operationList.get(0).getProgram_in_out2().get(k + 1).equals("쿠킹")) {
				array[15]++;
				array[16] = array[16] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 3));
				array[17] = array[17] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 4));

			} else if (operationList.get(0).getProgram_in_out2().get(k + 1).equals("이벤트")) {
				array[18]++;
				array[19] = array[19] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 3));
				array[20] = array[20] + Integer.parseInt(operationList.get(0).getProgram_in_out2().get(k + 4));
			}
		}
		return array;
	}

	@Override
	public Double[][] getProgramSaf(SearchDTO sDTO) throws Exception {
		log.info("프로그램 만족도 _점수");
		List<SearchDTO> Part_Saf = resultMapper.getPart_Saf(sDTO);
		List<SearchDTO> Lead_Saf = resultMapper.getLead_Saf(sDTO);
		List<SearchDTO> Programlist = resultMapper.getList(sDTO);
		Double[][] program_saf = new Double[14][9];
		log.info(Part_Saf.size());

		for (int i = 0; i < 14; i++) {
			for (int j = 0; j < 9; j++) {
				program_saf[i][j] = 0.0;
			}
		}
		// 참여자 위치 찾아 값넣기
		for (int i = 0; i < Programlist.size(); i++) {
			for (int j = 0; j < Part_Saf.size(); j++) {
				if (Programlist.get(i).getProgram_name().equals(Part_Saf.get(j).getProgram_name())
						&& Programlist.get(i).getTeacher().equals(Part_Saf.get(j).getTeacher())) {
					program_saf[i * 2][0] = Double.parseDouble(Part_Saf.get(j).getScore1());
					program_saf[i * 2][1] = Double.parseDouble(Part_Saf.get(j).getScore2());
					program_saf[i * 2][2] = Double.parseDouble(Part_Saf.get(j).getScore3());
					program_saf[i * 2][3] = Double.parseDouble(Part_Saf.get(j).getScore4());
					program_saf[i * 2][4] = Double.parseDouble(Part_Saf.get(j).getScore5());
					program_saf[i * 2][5] = Double.parseDouble(Part_Saf.get(j).getScore6());
					program_saf[i * 2][6] = Double.parseDouble(Part_Saf.get(j).getScore7());
					program_saf[i * 2][7] = Double.parseDouble(Part_Saf.get(j).getScore8());
					program_saf[i * 2][8] = Double.parseDouble(Part_Saf.get(j).getScore9());
					break;
				}
			}
		}
		// 인솔자 위치 찾아 값넣기
		for (int i = 0; i < Programlist.size(); i++) {
			for (int j = 0; j < Lead_Saf.size(); j++) {
				if (Programlist.get(i).getProgram_name().equals(Lead_Saf.get(j).getProgram_name())
						&& Programlist.get(i).getTeacher().equals(Lead_Saf.get(j).getTeacher())) {
					program_saf[1 + i * 2][0] = Double.parseDouble(Lead_Saf.get(j).getScore1());
					program_saf[1 + i * 2][1] = Double.parseDouble(Lead_Saf.get(j).getScore2());
					program_saf[1 + i * 2][2] = Double.parseDouble(Lead_Saf.get(j).getScore3());
					program_saf[1 + i * 2][3] = Double.parseDouble(Lead_Saf.get(j).getScore4());
					program_saf[1 + i * 2][4] = Double.parseDouble(Lead_Saf.get(j).getScore5());
					program_saf[1 + i * 2][5] = Double.parseDouble(Lead_Saf.get(j).getScore6());
					program_saf[1 + i * 2][6] = Double.parseDouble(Lead_Saf.get(j).getScore7());
					program_saf[1 + i * 2][7] = Double.parseDouble(Lead_Saf.get(j).getScore8());
					program_saf[1 + i * 2][8] = Double.parseDouble(Lead_Saf.get(j).getScore9());
					break;
				}
			}
		}
		return program_saf;
	}

	@Override
	public String[][] getProgramName(SearchDTO sDTO) throws Exception {
		log.info("프로그램 만족도 분야, 프로그램명 강사명");
		List<SearchDTO> list = resultMapper.getList(sDTO);
		String[][] program_name = new String[7][3];
		for (int i = 0; i < 7; i++) {
			for (int j = 0; j < 3; j++) {
				program_name[i][j] = " ";
			}
		}
		for (int i = 0; i < list.size(); i++) {
			sDTO.setProgram_name(list.get(i).getProgram_name());
			sDTO.setTeacher(list.get(i).getTeacher());
			program_name[i][0] = list.get(i).getBunya();
			program_name[i][1] = list.get(i).getProgram_name();
			program_name[i][2] = list.get(i).getTeacher();
		}
		return program_name;
	}

	@Override
	public List<IncomeDTO> getIncomeList(IncomeDTO icDTO) throws Exception {
		log.info("수익금액 가져오기");
		List<IncomeDTO> rList = resultMapper.getIncomeList(icDTO);
		log.info("수익금액 가격  :" + rList.get(0).getPrice1());
		log.info("수익금액 가격 사이즈  :" + rList.get(0).getPrice1().size());
		return rList;
	}

	@Override
	public List<ExpenseDTO> getExpenseList(ExpenseDTO eDTO) throws Exception {
		log.info("지출액 가져오기");
		List<ExpenseDTO> rList = resultMapper.getExpenseList(eDTO);
		log.info("지출 가격 fltmxm :" + rList.get(0).getDetail1());
		log.info("지출 가격 사이즈 :" + rList.get(0).getDetail1().size());
		log.info("지출 디테일 사이즈 :" + rList.get(0).getNote1());
		log.info("지출 디테일 사이즈 :" + rList.get(0).getPrice1());
		return rList;
	}

	@Override
	public List<BasicInfoDTO> getFirstPage() throws Exception {
		log.info(this.getClass().getName() + ".getFirstPage Start !!");
		log.info(this.getClass().getName() + ".getFirstPage end !!");
		return resultMapper.getFirstPage();
	}

	@Override
	public List<HrvInsertDTO> getHrvList(HrvInsertDTO hiDTO) throws Exception {
		log.info("hrv리스트");
		List<HrvInsertDTO> PreHrvList = resultMapper.getPreHrvList(hiDTO);
		List<HrvInsertDTO> AftHrvList = resultMapper.getAftHrvList(hiDTO);

		PreHrvList.get(0).setNum6(AftHrvList.get(0).getNum1());
		PreHrvList.get(0).setNum7(AftHrvList.get(0).getNum2());
		PreHrvList.get(0).setNum8(AftHrvList.get(0).getNum3());
		PreHrvList.get(0).setNum9(AftHrvList.get(0).getNum4());
		PreHrvList.get(0).setNum10(AftHrvList.get(0).getNum5());

		return PreHrvList;
	}

}
