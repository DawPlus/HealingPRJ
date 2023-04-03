package poly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BasicInfoDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.SearchDTO;
import poly.persistance.mapper.ISearchResultMapper;
import poly.service.ISearchResultService;
import poly.service.comm.AbstractService;
import poly.util.CmmUtil;

@Service("SearchResultService")
public class SearchResultService extends AbstractService implements ISearchResultService {

	@Resource(name = "SearchResultMapper")
	private ISearchResultMapper SearchResultMapper;

	@Override
	public HashMap<String, String> getResidenceCountMap(BasicInfoDTO bDTO) throws Exception {
		log.info("지역 구분 건수");
		List<BasicInfoDTO> residenceList = SearchResultMapper.getResidenceCountList(bDTO);
		HashMap<String, String> residencetMap = new HashMap<String, String>();
		int sum = 0;
		for (int i = 0; i < residenceList.size(); i++) {
			residencetMap.put(residenceList.get(i).getResidence(), residenceList.get(i).getCount());
			sum = sum + Integer.parseInt(residenceList.get(i).getCount());
		}
		residencetMap.put("계", Integer.toString(sum));
		return residencetMap;
	}

	@Override
	public HashMap<String, String> getResidenceSumMap(BasicInfoDTO bDTO) throws Exception {
		log.info("지역 구분 인원");
		List<BasicInfoDTO> residenceList = SearchResultMapper.getResidenceSumList(bDTO);
		int sum = 0;
		HashMap<String, String> residencetMap = new HashMap<String, String>();
		for (int i = 0; i < residenceList.size(); i++) {
			residencetMap.put(residenceList.get(i).getResidence(), residenceList.get(i).getSum());
			sum = sum + Integer.parseInt(residenceList.get(i).getSum());
		}
		residencetMap.put("계", Integer.toString(sum));
		return residencetMap;
	}

	@Override
	public HashMap<String, String> getPartCountMap(BasicInfoDTO bDTO) throws Exception {
		log.info("참가자 유형 건수");
		List<BasicInfoDTO> ageCountList = SearchResultMapper.getAgeCountList(bDTO);
		List<BasicInfoDTO> partCountList = SearchResultMapper.getPartCountList(bDTO);
		HashMap<String, String> partMap = new HashMap<String, String>();
		int sum_age = 0;
		int sum_part = 0;
		partMap.put("아동", "0");
		partMap.put("청소년", "0");
		partMap.put("성인", "0");
		partMap.put("노인", "0");
		partMap.put("장애인", "0");
		partMap.put("저소득", "0");
		partMap.put("가족", "0");
		partMap.put("중독", "0");
		partMap.put("교직원", "0");
		partMap.put("기타", "0");

		for (int i = 0; i < ageCountList.size(); i++) {
			partMap.put(ageCountList.get(i).getAge_type(), ageCountList.get(i).getCount());
		}
		sum_age = sum_age + Integer.parseInt(partMap.get("아동")) + Integer.parseInt(partMap.get("청소년"))
				+ Integer.parseInt(partMap.get("성인")) + Integer.parseInt(partMap.get("노인"));
		partMap.put("연령합", Integer.toString(sum_age));

		for (int i = 0; i < partCountList.size(); i++) {
			partMap.put(partCountList.get(i).getPart_type(), partCountList.get(i).getCount());
		}
		sum_part = sum_part + Integer.parseInt(partMap.get("장애인")) + Integer.parseInt(partMap.get("저소득"))
				+ Integer.parseInt(partMap.get("가족")) + Integer.parseInt(partMap.get("중독"))
				+ Integer.parseInt(partMap.get("교직원")) + Integer.parseInt(partMap.get("기타"));
		partMap.put("참가자합", Integer.toString(sum_part));
		return partMap;
	}

	@Override
	public HashMap<String, String> getPartSumMap(BasicInfoDTO bDTO) throws Exception {
		log.info("참가자 유형 인원수");
		List<BasicInfoDTO> partSumList = SearchResultMapper.getPartSumList(bDTO);
		List<BasicInfoDTO> ageSumList = SearchResultMapper.getAgeSumList(bDTO);
		HashMap<String, String> partMap = new HashMap<String, String>();
		int sum_age = 0;
		int sum_part = 0;
		partMap.put("아동", "0");
		partMap.put("청소년", "0");
		partMap.put("성인", "0");
		partMap.put("노인", "0");
		partMap.put("장애인", "0");
		partMap.put("저소득", "0");
		partMap.put("가족", "0");
		partMap.put("중독", "0");
		partMap.put("교직원", "0");
		partMap.put("기타", "0");
		// 연령별 합
		for (int i = 0; i < ageSumList.size(); i++) {
			partMap.put(ageSumList.get(i).getAge_type(), ageSumList.get(i).getSum());
		}
		sum_age = sum_age + Integer.parseInt(partMap.get("아동")) + Integer.parseInt(partMap.get("청소년"))
				+ Integer.parseInt(partMap.get("성인")) + Integer.parseInt(partMap.get("노인"));
		partMap.put("연령합", Integer.toString(sum_age));
		// 참가자별 합
		for (int i = 0; i < partSumList.size(); i++) {
			partMap.put(partSumList.get(i).getPart_type(), partSumList.get(i).getSum());
		}
		sum_part = sum_part + Integer.parseInt(partMap.get("장애인")) + Integer.parseInt(partMap.get("저소득"))
				+ Integer.parseInt(partMap.get("가족")) + Integer.parseInt(partMap.get("중독"))
				+ Integer.parseInt(partMap.get("교직원")) + Integer.parseInt(partMap.get("기타"));
		partMap.put("참가자합", Integer.toString(sum_part));
		return partMap;
	}

	@Override
	public HashMap<String, String> getBizCountMap(BasicInfoDTO bDTO) throws Exception {
		log.info("사업목적,수입타입 건수");
		List<BasicInfoDTO> bizCountList = SearchResultMapper.getBizCountList(bDTO);
		List<BasicInfoDTO> incomeCountList = SearchResultMapper.getIncomeCountList(bDTO);
		HashMap<String, String> partMap = new HashMap<String, String>();
		int sum_biz = 0;
		int sum_income = 0;
		partMap.put("녹색자금", "0");
		partMap.put("산림복지", "0");
		partMap.put("기타", "0");

		partMap.put("사회공헌", "0");
		partMap.put("수익사업", "0");

		for (int i = 0; i < bizCountList.size(); i++) {
			partMap.put(bizCountList.get(i).getBiz_purpose(), bizCountList.get(i).getCount());
		}

		for (int i = 0; i < incomeCountList.size(); i++) {
			if (incomeCountList.get(i).getIncome_type().equals("녹색자금")) {
				partMap.put(incomeCountList.get(i).getIncome_type(), incomeCountList.get(i).getCount());
			} else if (incomeCountList.get(i).getIncome_type().equals("산림복지")) {
				partMap.put(incomeCountList.get(i).getIncome_type(), incomeCountList.get(i).getCount());
			} else if (incomeCountList.get(i).getIncome_type().equals("기타")) {
				partMap.put(incomeCountList.get(i).getIncome_type(), incomeCountList.get(i).getCount());
			}
		}

		log.info("건수 : " + partMap);
		sum_biz = Integer.parseInt(partMap.get("사회공헌")) + Integer.parseInt(partMap.get("수익사업"));
		partMap.put("사업합", Integer.toString(sum_biz));
		sum_income = Integer.parseInt(partMap.get("녹색자금")) + Integer.parseInt(partMap.get("산림복지"))
				+ Integer.parseInt(partMap.get("기타"));
		partMap.put("수익합", Integer.toString(sum_income));

		return partMap;
	}

	@Override
	public HashMap<String, String> getBizSumMap(BasicInfoDTO bDTO) throws Exception {
		log.info("사업목적,수입타입 총 건수 ");
		List<BasicInfoDTO> bizSumList = SearchResultMapper.getBizSumList(bDTO);
		List<BasicInfoDTO> incomeSumList = SearchResultMapper.getIncomeSumList(bDTO);
		HashMap<String, String> partMap = new HashMap<String, String>();
		int sum_biz = 0;
		int sum_income = 0;
		partMap.put("녹색자금", "0");
		partMap.put("산림복지", "0");
		partMap.put("기타", "0");
		partMap.put("사회공헌", "0");
		partMap.put("수익사업", "0");
		for (int i = 0; i < bizSumList.size(); i++) {
			partMap.put(bizSumList.get(i).getBiz_purpose(), bizSumList.get(i).getSum());
		}

		for (int i = 0; i < incomeSumList.size(); i++) {
			if (incomeSumList.get(i).getIncome_type().equals("녹색자금")) {
				partMap.put(incomeSumList.get(i).getIncome_type(), incomeSumList.get(i).getSum());
			} else if (incomeSumList.get(i).getIncome_type().equals("산림복지")) {
				partMap.put(incomeSumList.get(i).getIncome_type(), incomeSumList.get(i).getSum());
			} else if (incomeSumList.get(i).getIncome_type().equals("기타")) {
				partMap.put(incomeSumList.get(i).getIncome_type(), incomeSumList.get(i).getSum());
			}
		}
		log.info(partMap);
		sum_biz = Integer.parseInt(partMap.get("사회공헌")) + Integer.parseInt(partMap.get("수익사업"));
		partMap.put("사업합", Integer.toString(sum_biz));
		sum_income = Integer.parseInt(partMap.get("녹색자금")) + Integer.parseInt(partMap.get("산림복지"))
				+ Integer.parseInt(partMap.get("기타"));
		partMap.put("수익합", Integer.toString(sum_income));
		return partMap;
	}

	@Override
	public HashMap<String, List> getProAvgMap(BasicInfoDTO bDTO) throws Exception {
		log.info("프로그램 만족도 평균 ");
		List<SearchDTO> bunyaList = SearchResultMapper.getProAvgList(bDTO);
		HashMap<String, List> programMap = new HashMap<String, List>();
		String[] list_pro = { "산림교육", "예방교육", "산림치유", "아트", "릴렉싱", "에너제틱", "쿠킹", "이벤트" };
		List<String> rList = new ArrayList<String>();
		rList.add(" ");
		rList.add(" ");
		rList.add(" ");
		rList.add(" ");
		Double teacher_avg = 0.00, content_avg = 0.00, effect_avg = 0.00, avg_avg = 0.00;
		for (int i = 0; i < list_pro.length; i++) {
			programMap.put(list_pro[i], rList);
		}
		int count =0;
		for (int i = 0; i < bunyaList.size(); i++) {
			List<String> aList = new ArrayList<String>();
			aList.add(CmmUtil.nvl(bunyaList.get(i).getProgram()));
			aList.add(CmmUtil.nvl(bunyaList.get(i).getContent()));
			aList.add(CmmUtil.nvl(bunyaList.get(i).getEffect()));
			double avg = Math.round((Double.parseDouble(bunyaList.get(i).getProgram())+Double.parseDouble(bunyaList.get(i).getContent())+Double.parseDouble(bunyaList.get(i).getEffect()))/3* 100.0) / 100.0;
			aList.add(CmmUtil.nvl(Double.toString(avg)));
			programMap.put(bunyaList.get(i).getBunya(), aList);
			
		}
		for(int i=0; i<list_pro.length; i++) {
			System.out.println(programMap.get(list_pro[i]));
		}
		double count1 =0.00, count2=0.00,count3=0.00,count4=0.00;
		for(int i=0; i<list_pro.length; i++) {
			if(!programMap.get(list_pro[i]).get(0).equals(" ")) {
				teacher_avg = teacher_avg + Double.parseDouble((String) programMap.get(list_pro[i]).get(0));
				count1 ++;
			}
			if( !programMap.get(list_pro[i]).get(1).equals(" ")) {
				content_avg = content_avg + Double.parseDouble((String) programMap.get(list_pro[i]).get(1));
				count2 ++;
			}
			if( !programMap.get(list_pro[i]).get(2).equals(" ")) {
				effect_avg = effect_avg + Double.parseDouble((String) programMap.get(list_pro[i]).get(2));
				count3 ++;
			}
			if(!programMap.get(list_pro[i]).get(3).equals(" ")) {
				avg_avg = avg_avg + Double.parseDouble((String) programMap.get(list_pro[i]).get(3));
				count4 ++;
			}
		}
		teacher_avg = Math.round(teacher_avg/count1* 100.0) / 100.0;
		content_avg = Math.round(content_avg/count2* 100.0) / 100.0;
		effect_avg = Math.round(effect_avg/count3* 100.0) / 100.0;
		avg_avg = Math.round(avg_avg/count4* 100.0) / 100.0;
		List<Double> aList = new ArrayList<Double>();
		aList.add(teacher_avg);
		aList.add(content_avg);
		aList.add(effect_avg);
		aList.add(avg_avg);
		programMap.put("평균", aList);
		return programMap;
	}

	@Override
	public String[] getProCountMap(BasicInfoDTO bDTO) throws Exception {
		log.info("프로그램 갯수, 내부강사 외부강사");
		List<ProgramOperationDTO> proCountList = SearchResultMapper.getProCountList(bDTO);
		int[] array = new int[51];
		String[] array_1 = new String[42];
		int a = 5;
		for (int i = 0; i < proCountList.size(); i++) {
			for (int j = 0; j < proCountList.get(i).getProgram_in_out2().size() / 5; j++) {
				int k = a * j;
				if (proCountList.get(i).getProgram_in_out2().get(k + 1).equals("산림교육")) {
					array[0]++;
					array[1] = array[1] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 3));
					array[2] = array[2] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 4));

				} else if (proCountList.get(i).getProgram_in_out2().get(k + 1).equals("행위중독예방교육")) {
					array[3]++;
					array[4] = array[4] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 3));
					array[5] = array[5] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 4));

				} else if (proCountList.get(i).getProgram_in_out2().get(k + 1).equals("산림치유")) {
					array[6]++;
					array[7] = array[7] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 3));
					array[8] = array[8] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 4));

				} else if (proCountList.get(i).getProgram_in_out2().get(k + 1).equals("아트")) {
					array[9]++;
					array[10] = array[10] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 3));
					array[11] = array[11] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 4));

				} else if (proCountList.get(i).getProgram_in_out2().get(k + 1).equals("릴렉싱")) {
					array[12]++;
					array[13] = array[13] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 3));
					array[14] = array[14] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 4));

				} else if (proCountList.get(i).getProgram_in_out2().get(k + 1).equals("에너제틱")) {
					array[15]++;
					array[16] = array[16] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 3));
					array[17] = array[17] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 4));

				} else if (proCountList.get(i).getProgram_in_out2().get(k + 1).equals("쿠킹")) {
					array[18]++;
					array[19] = array[19] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 3));
					array[20] = array[20] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 4));

				} else if (proCountList.get(i).getProgram_in_out2().get(k + 1).equals("이벤트")) {
					array[21]++;
					array[22] = array[22] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 3));
					array[23] = array[23] + Integer.parseInt(proCountList.get(i).getProgram_in_out2().get(k + 4));

				} 
			}
		}
		for (int i = 0; i < 8; i++) {
			array[39] = array[39] + array[i * 3];
			array[40] = array[40] + array[i * 3 + 1];
			array[41] = array[41] + array[i * 3 + 2];
		}
		for (int i = 0; i < 42; i++) {
			array_1[i] = Integer.toString(array[i]);
			if (array_1[i].equals("0")) {
				array_1[i] = " ";
			}
		}
		return array_1;
	}

	@Override
	public List<SearchDTO> getSerEnvList(BasicInfoDTO bDTO) throws Exception {
		log.info("시설 서비스 만족도");
		List<SearchDTO> rList = SearchResultMapper.getSerEnvList(bDTO);
		double sum = 0;
		int count = 0;
		if (!rList.get(0).getScore1().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore1());
		}
		if (!rList.get(0).getScore2().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore2());
		}
		if (!rList.get(0).getScore3().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore3());
		}
		if (!rList.get(0).getScore4().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore4());
		}
		if (!rList.get(0).getScore5().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore5());
		}
		if (!rList.get(0).getScore6().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore6());
		}
		if (!rList.get(0).getScore7().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore7());
		}
		if (!rList.get(0).getScore8().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore8());
		}
		if (!rList.get(0).getScore9().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore9());
		}
		if (!rList.get(0).getScore10().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore10());
		}
		if (!rList.get(0).getScore11().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore11());
		}
		if (!rList.get(0).getScore12().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore12());
		}
		if (!rList.get(0).getScore13().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore13());
		}
		if (!rList.get(0).getScore14().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore14());
		}
		if (!rList.get(0).getScore15().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore15());
		}
		if (!rList.get(0).getScore16().equals("0")) {
			count++;
			sum = sum + Double.parseDouble(rList.get(0).getScore16());
		}
		String sum1;
		sum1 = Double.toString(Math.round(sum / count * 100) / 100.0);
		rList.get(0).setAvg1(sum1);
		return rList;
	}

	@Override
	public HashMap<String, String> getEffectMap(BasicInfoDTO bDTO) throws Exception {
		log.info("프로그램 효과성분석 ");
		List<SearchDTO> prohealingList = SearchResultMapper.getProhealingList(bDTO);
		List<SearchDTO> procounselList = SearchResultMapper.getProCounselList(bDTO);
		List<SearchDTO> propreventList = SearchResultMapper.getProPreventList(bDTO);
		List<SearchDTO> afthealingList = SearchResultMapper.getAfthealingList(bDTO);
		List<SearchDTO> aftCounselList = SearchResultMapper.getAftCounselList(bDTO);
		List<SearchDTO> aftPreventList = SearchResultMapper.getAftPreventList(bDTO);
		HashMap<String, String> healingMap = new HashMap<String, String>();

		healingMap.put("힐링 사전 합", prohealingList.get(0).getSum1());
		healingMap.put("힐링 사전 평균", prohealingList.get(0).getAvg1());
		healingMap.put("힐링 사후 합", afthealingList.get(0).getSum1());
		healingMap.put("힐링 사후 평균", afthealingList.get(0).getAvg1());

		healingMap.put("예방 사전 합", propreventList.get(0).getSum1());
		healingMap.put("예방 사전 평균", propreventList.get(0).getAvg1());
		healingMap.put("예방 사후 합", aftPreventList.get(0).getSum1());
		healingMap.put("예방 사후 평균", aftPreventList.get(0).getAvg1());

		healingMap.put("설문 사전 합", procounselList.get(0).getSum1());
		healingMap.put("설문 사전 평균", procounselList.get(0).getAvg1());
		healingMap.put("설문 사후 합", aftCounselList.get(0).getSum1());
		healingMap.put("설문 사후 평균", aftCounselList.get(0).getAvg1());

		return healingMap;
	}

	@Override
	public List<BasicInfoDTO> getBasicList(BasicInfoDTO bDTO) throws Exception {
		List<BasicInfoDTO> rList = SearchResultMapper.getBasicList(bDTO);
		return rList;
	}

	@Override
	public List<SearchDTO> getHrvList(BasicInfoDTO bDTO) throws Exception {
		List<SearchDTO> PreHrvList = SearchResultMapper.getPreHrvList(bDTO);
		List<SearchDTO> AftHrvList = SearchResultMapper.getAftHrvList(bDTO);

		PreHrvList.get(0).setScore6(AftHrvList.get(0).getScore1());
		PreHrvList.get(0).setScore7(AftHrvList.get(0).getScore2());
		PreHrvList.get(0).setScore8(AftHrvList.get(0).getScore3());
		PreHrvList.get(0).setScore9(AftHrvList.get(0).getScore4());
		PreHrvList.get(0).setScore10(AftHrvList.get(0).getScore5());
		return PreHrvList;
	}

}
