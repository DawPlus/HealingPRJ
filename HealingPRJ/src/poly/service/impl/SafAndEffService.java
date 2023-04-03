package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;
import poly.persistance.mapper.ISafAndEffMapper;
import poly.service.ISafAndEffService;
import poly.service.comm.AbstractService;

@Service("SafAndEffService")
public class SafAndEffService extends AbstractService implements ISafAndEffService {

	@Resource(name = "SafAndEffMapper")
	private ISafAndEffMapper SafAndEffMapper;

	@Override
	public List<SearchDTO> getProgrmaList(SearchDTO sDTO) throws Exception {
		log.info("프로그램 만족도 서비스 시작");
		List<SearchDTO> programList = SafAndEffMapper.getprogramList(sDTO);
		double count = 0, sum = 0;
		double avg1;
		double avg2;
		double avg3;
		double avg4;

		for (int i = 0; i < programList.size(); i++) {
			avg1 = Math.round((java.lang.Double.parseDouble(programList.get(i).getScore1())
					+ java.lang.Double.parseDouble(programList.get(i).getScore2())
					+ java.lang.Double.parseDouble(programList.get(i).getScore3())) / 3 * 100) / 100.0;
			avg2 = Math.round((java.lang.Double.parseDouble(programList.get(i).getScore4())
					+ java.lang.Double.parseDouble(programList.get(i).getScore5())
					+ java.lang.Double.parseDouble(programList.get(i).getScore6())) / 3 * 100) / 100.0;
			if (java.lang.Double.parseDouble(programList.get(i).getScore7()) > 0) {
				count++;
				sum = sum + java.lang.Double.parseDouble(programList.get(i).getScore7());
			}
			if (java.lang.Double.parseDouble(programList.get(i).getScore8()) > 0) {
				count++;
				sum = sum + java.lang.Double.parseDouble(programList.get(i).getScore8());
			}
			if (java.lang.Double.parseDouble(programList.get(i).getScore9()) > 0) {
				count++;
				sum = sum + java.lang.Double.parseDouble(programList.get(i).getScore9());
			}
			avg3 = Math.round(sum / count * 100) / 100.0;
			avg4 = Math.round((avg1 + avg2 + avg3) / 3 * 100) / 100.0;
			programList.get(i).setAvg1(java.lang.Double.toString(avg1));
			programList.get(i).setAvg2(java.lang.Double.toString(avg2));
			programList.get(i).setAvg3(java.lang.Double.toString(avg3));
			programList.get(i).setAvg4(java.lang.Double.toString(avg4));
			sum = 0;
			count = 0;
			if (programList.get(i).getEtc_opinion().equals(" ") || programList.get(i).getEtc_opinion().equals("")
					|| programList.get(i).getEtc_opinion().equals("  ")) {
				programList.get(i).setEtc_opinion("-");
			}
		}
		return programList;
	}

	@Override
	public List<SearchDTO> getProgrmaAvgList(SearchDTO sDTO) throws Exception {
		log.info("프로그램 만족도 평균 시작");
		List<SearchDTO> programList = SafAndEffMapper.getprogramAvgList(sDTO);
		double avg1;
		double avg2;
		double avg3;
		int count = 0;
		if (Double.parseDouble(programList.get(0).getScore1()) != 0) {
			count++;
		}
		if (Double.parseDouble(programList.get(0).getScore2()) != 0) {
			count++;
		}
		if (Double.parseDouble(programList.get(0).getScore3()) != 0) {
			count++;
		}
		avg1 = Math.round(
				(Double.parseDouble(programList.get(0).getScore1()) + Double.parseDouble(programList.get(0).getScore2())
						+ Double.parseDouble(programList.get(0).getScore3())) / count * 100)
				/ 100.0;
		count = 0;

		if (Double.parseDouble(programList.get(0).getScore4()) != 0) {
			count++;
		}
		if (Double.parseDouble(programList.get(0).getScore5()) != 0) {
			count++;
		}
		if (Double.parseDouble(programList.get(0).getScore6()) != 0) {
			count++;
		}
		avg2 = Math.round(
				(Double.parseDouble(programList.get(0).getScore4()) + Double.parseDouble(programList.get(0).getScore5())
						+ Double.parseDouble(programList.get(0).getScore6())) / count * 100)
				/ 100.0;
		count = 0;

		if (Double.parseDouble(programList.get(0).getScore7()) != 0) {
			count++;
		}
		if (Double.parseDouble(programList.get(0).getScore8()) != 0) {
			count++;
		}
		if (Double.parseDouble(programList.get(0).getScore9()) != 0) {
			count++;
		}

		avg3 = Math.round(
				(Double.parseDouble(programList.get(0).getScore7()) + Double.parseDouble(programList.get(0).getScore8())
						+ Double.parseDouble(programList.get(0).getScore9())) / count * 100)
				/ 100.0;

		programList.get(0).setAvg1(Double.toString(avg1));
		programList.get(0).setAvg2(Double.toString(avg2));
		programList.get(0).setAvg3(Double.toString(avg3));
		return programList;
	}

	@Override
	public List<ServiceInsertDTO> getFacilityList(ServiceInsertDTO uDTO) throws Exception {
		log.info("시설 만족도 서비스 시작");
		log.info("참여 단체 : " + uDTO.getAgency());
		List<ServiceInsertDTO> FacilityList = SafAndEffMapper.getFaciltyList(uDTO);
		log.info("프로그램 사이즈 : " + FacilityList.size());
		return FacilityList;
	}

	@Override
	public List<ServiceInsertDTO> getAvgFacilityList(ServiceInsertDTO uDTO) throws Exception {
		log.info("시설 만족도 서비스 평균 시작");
		List<ServiceInsertDTO> FacilityList = SafAndEffMapper.getAvgFacilityList(uDTO);

		return FacilityList;
	}

	@Override
	public List<SearchDTO> getPreventList(SearchDTO sDTO) throws Exception {
		log.info("예방서비스 효과평가");
		List<SearchDTO> pList = SafAndEffMapper.getPrpPreventList(sDTO);
		List<SearchDTO> aList = SafAndEffMapper.getAftPreventList(sDTO);
		for (int i = 0; i < pList.size(); i++) {
			for (int j = 0; j < aList.size(); j++) {
				if (pList.get(i).getName().equals(aList.get(j).getName())
						&& pList.get(i).getJob().equals(aList.get(j).getJob())) {
					pList.get(i).setScore21(aList.get(j).getScore1());
					pList.get(i).setScore22(aList.get(j).getScore2());
					pList.get(i).setScore23(aList.get(j).getScore3());
					pList.get(i).setScore24(aList.get(j).getScore4());
					pList.get(i).setScore25(aList.get(j).getScore5());
					pList.get(i).setScore26(aList.get(j).getScore6());
					pList.get(i).setScore27(aList.get(j).getScore7());
					pList.get(i).setScore28(aList.get(j).getScore8());
					pList.get(i).setScore29(aList.get(j).getScore9());
					pList.get(i).setScore30(aList.get(j).getScore10());
					pList.get(i).setScore31(aList.get(j).getScore11());
					pList.get(i).setScore32(aList.get(j).getScore12());
					pList.get(i).setScore33(aList.get(j).getScore13());
					pList.get(i).setScore34(aList.get(j).getScore14());
					pList.get(i).setScore35(aList.get(j).getScore15());
					pList.get(i).setScore36(aList.get(j).getScore16());
					pList.get(i).setScore37(aList.get(j).getScore17());
					pList.get(i).setScore38(aList.get(j).getScore18());
					pList.get(i).setScore39(aList.get(j).getScore19());
					pList.get(i).setScore40(aList.get(j).getScore20());
					pList.get(i).setAvg7(aList.get(j).getAvg1());
					pList.get(i).setAvg8(aList.get(j).getAvg2());
					pList.get(i).setAvg9(aList.get(j).getAvg3());
					pList.get(i).setAvg10(aList.get(j).getAvg4());
					pList.get(i).setAvg11(aList.get(j).getAvg5());
					pList.get(i).setAvg12(aList.get(j).getAvg6());
					break;
				}
			}

		}
		return pList;
	}

	@Override
	public List<SearchDTO> getAvgPreventList(SearchDTO sDTO) throws Exception {
		log.info("예방서비스 효과평가");
		List<SearchDTO> pList = SafAndEffMapper.getAvgProPreventList(sDTO);
		List<SearchDTO> aList = SafAndEffMapper.getAvgAftPreventList(sDTO);
		pList.get(0).setScore21(aList.get(0).getScore1());
		pList.get(0).setScore22(aList.get(0).getScore2());
		pList.get(0).setScore23(aList.get(0).getScore3());
		pList.get(0).setScore24(aList.get(0).getScore4());
		pList.get(0).setScore25(aList.get(0).getScore5());
		pList.get(0).setScore26(aList.get(0).getScore6());
		pList.get(0).setScore27(aList.get(0).getScore7());
		pList.get(0).setScore28(aList.get(0).getScore8());
		pList.get(0).setScore29(aList.get(0).getScore9());
		pList.get(0).setScore30(aList.get(0).getScore10());
		pList.get(0).setScore31(aList.get(0).getScore11());
		pList.get(0).setScore32(aList.get(0).getScore12());
		pList.get(0).setScore33(aList.get(0).getScore13());
		pList.get(0).setScore34(aList.get(0).getScore14());
		pList.get(0).setScore35(aList.get(0).getScore15());
		pList.get(0).setScore36(aList.get(0).getScore16());
		pList.get(0).setScore37(aList.get(0).getScore17());
		pList.get(0).setScore38(aList.get(0).getScore18());
		pList.get(0).setScore39(aList.get(0).getScore19());
		pList.get(0).setScore40(aList.get(0).getScore20());
		pList.get(0).setAvg7(aList.get(0).getAvg1());
		pList.get(0).setAvg8(aList.get(0).getAvg2());
		pList.get(0).setAvg9(aList.get(0).getAvg3());
		pList.get(0).setAvg10(aList.get(0).getAvg4());
		pList.get(0).setAvg11(aList.get(0).getAvg5());
		pList.get(0).setAvg12(aList.get(0).getAvg6());
		return pList;
	}

	@Override
	public List<SearchDTO> getHealList(SearchDTO sDTO) throws Exception {
		List<SearchDTO> aList = SafAndEffMapper.getProHealList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getAftHealList(sDTO);
		for (int i = 0; i < aList.size(); i++) {
			for (int j = 0; j < bList.size(); j++) {
				if (aList.get(i).getName().equals(bList.get(j).getName())
						&& aList.get(i).getJob().equals(bList.get(j).getJob())) {
					aList.get(i).setScore23(bList.get(j).getScore1());
					aList.get(i).setScore24(bList.get(j).getScore2());
					aList.get(i).setScore25(bList.get(j).getScore3());
					aList.get(i).setScore26(bList.get(j).getScore4());
					aList.get(i).setScore27(bList.get(j).getScore5());
					aList.get(i).setScore28(bList.get(j).getScore6());
					aList.get(i).setScore29(bList.get(j).getScore7());
					aList.get(i).setScore30(bList.get(j).getScore8());
					aList.get(i).setScore31(bList.get(j).getScore9());
					aList.get(i).setScore32(bList.get(j).getScore10());
					aList.get(i).setScore33(bList.get(j).getScore11());
					aList.get(i).setScore34(bList.get(j).getScore12());
					aList.get(i).setScore35(bList.get(j).getScore13());
					aList.get(i).setScore36(bList.get(j).getScore14());
					aList.get(i).setScore37(bList.get(j).getScore15());
					aList.get(i).setScore38(bList.get(j).getScore16());
					aList.get(i).setScore39(bList.get(j).getScore17());
					aList.get(i).setScore40(bList.get(j).getScore18());
					aList.get(i).setScore41(bList.get(j).getScore19());
					aList.get(i).setScore42(bList.get(j).getScore20());
					aList.get(i).setScore43(bList.get(j).getScore21());
					aList.get(i).setScore44(bList.get(j).getScore22());
					aList.get(i).setAvg8(bList.get(j).getAvg1());
					aList.get(i).setAvg9(bList.get(j).getAvg2());
					aList.get(i).setAvg10(bList.get(j).getAvg3());
					aList.get(i).setAvg11(bList.get(j).getAvg4());
					aList.get(i).setAvg12(bList.get(j).getAvg5());
					aList.get(i).setAvg13(bList.get(j).getAvg6());
					aList.get(i).setAvg14(bList.get(j).getAvg7());
					break;
				}
			}

		}

		return aList;
	}

	@Override
	public List<SearchDTO> getHealAvgList(SearchDTO sDTO) throws Exception {
		List<SearchDTO> aList = SafAndEffMapper.getProHealAvgList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getAftHealAvgList(sDTO);
		aList.get(0).setScore23(bList.get(0).getScore1());
		aList.get(0).setScore24(bList.get(0).getScore2());
		aList.get(0).setScore25(bList.get(0).getScore3());
		aList.get(0).setScore26(bList.get(0).getScore4());
		aList.get(0).setScore27(bList.get(0).getScore5());
		aList.get(0).setScore28(bList.get(0).getScore6());
		aList.get(0).setScore29(bList.get(0).getScore7());
		aList.get(0).setScore30(bList.get(0).getScore8());
		aList.get(0).setScore31(bList.get(0).getScore9());
		aList.get(0).setScore32(bList.get(0).getScore10());
		aList.get(0).setScore33(bList.get(0).getScore11());
		aList.get(0).setScore34(bList.get(0).getScore12());
		aList.get(0).setScore35(bList.get(0).getScore13());
		aList.get(0).setScore36(bList.get(0).getScore14());
		aList.get(0).setScore37(bList.get(0).getScore15());
		aList.get(0).setScore38(bList.get(0).getScore16());
		aList.get(0).setScore39(bList.get(0).getScore17());
		aList.get(0).setScore40(bList.get(0).getScore18());
		aList.get(0).setScore41(bList.get(0).getScore19());
		aList.get(0).setScore42(bList.get(0).getScore20());
		aList.get(0).setScore43(bList.get(0).getScore21());
		aList.get(0).setScore44(bList.get(0).getScore22());
		aList.get(0).setAvg8(bList.get(0).getAvg1());
		aList.get(0).setAvg9(bList.get(0).getAvg2());
		aList.get(0).setAvg10(bList.get(0).getAvg3());
		aList.get(0).setAvg11(bList.get(0).getAvg4());
		aList.get(0).setAvg12(bList.get(0).getAvg5());
		aList.get(0).setAvg13(bList.get(0).getAvg6());
		aList.get(0).setAvg14(bList.get(0).getAvg7());

		return aList;
	}

	@Override
	public List<SearchDTO> getCoulselList(SearchDTO sDTO) throws Exception {
		List<SearchDTO> aList = SafAndEffMapper.getProCounselList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getMidCounselList(sDTO);
		List<SearchDTO> cList = SafAndEffMapper.getAftCounselList(sDTO);
		List<SearchDTO> sList = SafAndEffMapper.getCounselSessionList(sDTO);

		for (int i = 0; i < aList.size(); i++) {
			for (int j = 0; j < bList.size(); j++) {
				if (aList.get(i).getName().equals(bList.get(j).getName())
						&& aList.get(i).getAge().equals(bList.get(j).getAge())) {
					aList.get(i).setScore20(bList.get(j).getScore1());
					aList.get(i).setScore21(bList.get(j).getScore2());
					aList.get(i).setScore22(bList.get(j).getScore3());
					aList.get(i).setScore23(bList.get(j).getScore4());
					aList.get(i).setScore24(bList.get(j).getScore5());
					aList.get(i).setScore25(bList.get(j).getScore6());
					aList.get(i).setScore26(bList.get(j).getScore7());
					aList.get(i).setScore27(bList.get(j).getScore8());
					aList.get(i).setScore28(bList.get(j).getScore9());
					aList.get(i).setScore29(bList.get(j).getScore10());
					aList.get(i).setScore30(bList.get(j).getScore11());
					aList.get(i).setScore31(bList.get(j).getScore12());
					aList.get(i).setScore32(bList.get(j).getScore13());
					aList.get(i).setScore33(bList.get(j).getScore14());
					aList.get(i).setScore34(bList.get(j).getScore15());
					aList.get(i).setScore35(bList.get(j).getScore16());
					aList.get(i).setScore36(bList.get(j).getScore17());
					aList.get(i).setScore37(bList.get(j).getScore18());
					aList.get(i).setScore38(bList.get(j).getScore19());
					break;
				}
			}
			for (int k = 0; k < cList.size(); k++) {
				if (aList.get(i).getName().equals(cList.get(k).getName())
						&& aList.get(i).getAge().equals(cList.get(k).getAge())) {
					aList.get(i).setScore39(cList.get(k).getScore1());
					aList.get(i).setScore40(cList.get(k).getScore2());
					aList.get(i).setScore41(cList.get(k).getScore3());
					aList.get(i).setScore42(cList.get(k).getScore4());
					aList.get(i).setScore43(cList.get(k).getScore5());
					aList.get(i).setScore44(cList.get(k).getScore6());
					aList.get(i).setScore45(cList.get(k).getScore7());
					aList.get(i).setScore46(cList.get(k).getScore8());
					aList.get(i).setScore47(cList.get(k).getScore9());
					aList.get(i).setScore48(cList.get(k).getScore10());
					aList.get(i).setScore49(cList.get(k).getScore11());
					aList.get(i).setScore50(cList.get(k).getScore12());
					aList.get(i).setScore51(cList.get(k).getScore13());
					aList.get(i).setScore52(cList.get(k).getScore14());
					aList.get(i).setScore53(cList.get(k).getScore15());
					aList.get(i).setScore54(cList.get(k).getScore16());
					aList.get(i).setScore55(cList.get(k).getScore17());
					aList.get(i).setScore56(cList.get(k).getScore18());
					aList.get(i).setScore57(cList.get(k).getScore19());
					break;
				}
			}
			for (int l = 0; l < sList.size(); l++) {
				if (aList.get(i).getName().equals(sList.get(l).getName())
						&& aList.get(i).getAge().equals(sList.get(l).getAge())) {
					if (sList.get(l).getSession().get(0).equals("시작회기")) {
						aList.get(i).setTime_1(sList.get(l).getSession().get(1));
						aList.get(i).setCost_1(sList.get(l).getSession().get(2));

					} else if (sList.get(l).getSession().get(0).equals("중간회기")) {
						aList.get(i).setTime_2(sList.get(l).getSession().get(1));
						aList.get(i).setCost_2(sList.get(l).getSession().get(2));

					} else if (sList.get(l).getSession().get(0).equals("종결회기")) {
						aList.get(i).setTime_3(sList.get(l).getSession().get(1));
						aList.get(i).setCost_3(sList.get(l).getSession().get(2));

					}
				}
			}
		}
		for (int i = 0; i < aList.size(); i++) {
			if (aList.get(i).getTime_2() == null) {
				aList.get(i).setTime_2("0");
			}
			if (aList.get(i).getTime_3() == null) {
				aList.get(i).setTime_3("0");
			}
			if (aList.get(i).getCost_2() == null) {
				aList.get(i).setCost_2("0");
			}
			if (aList.get(i).getCost_3() == null) {
				aList.get(i).setCost_3("0");
			}
		}
		return aList;
	}

	@Override
	public List<SearchDTO> getSer_Program(SearchDTO sDTO) throws Exception {
		log.info("주제어별 프로그램 만족도 평가");
		List<SearchDTO> rList = SafAndEffMapper.getSer_Program(sDTO);
		double count = 0, sum = 0;
		double avg1 = 0;
		double avg2 = 0;
		double avg3 = 0;
		double avg4 = 0;

		for (int i = 0; i < rList.size(); i++) {
			avg1 = Math.round((java.lang.Double.parseDouble(rList.get(i).getScore1())
					+ java.lang.Double.parseDouble(rList.get(i).getScore2())
					+ java.lang.Double.parseDouble(rList.get(i).getScore3())) / 3 * 100) / 100.0;
			avg2 = Math.round((java.lang.Double.parseDouble(rList.get(i).getScore4())
					+ java.lang.Double.parseDouble(rList.get(i).getScore5())
					+ java.lang.Double.parseDouble(rList.get(i).getScore6())) / 3 * 100) / 100.0;
			if (java.lang.Double.parseDouble(rList.get(i).getScore7()) > 0) {
				count++;
				sum = sum + java.lang.Double.parseDouble(rList.get(i).getScore7());
			}
			if (Double.parseDouble(rList.get(i).getScore8()) > 0) {
				count++;
				sum = sum + java.lang.Double.parseDouble(rList.get(i).getScore8());
			}
			if (java.lang.Double.parseDouble(rList.get(i).getScore9()) > 0) {
				count++;
				sum = sum + java.lang.Double.parseDouble(rList.get(i).getScore9());
			}
			avg3 = Math.round(sum / count * 100) / 100.0;
			avg4 = Math.round((avg1 + avg2 + avg3) / 3 * 100) / 100.0;
			rList.get(i).setAvg1(java.lang.Double.toString(avg1));
			rList.get(i).setAvg2(java.lang.Double.toString(avg2));
			rList.get(i).setAvg3(java.lang.Double.toString(avg3));
			rList.get(i).setAvg4(java.lang.Double.toString(avg4));
			sum = 0;
			count = 0;
			log.info(i + "번째" + " avg1 : " + avg1 + "  avg2 : " + avg2 + " avg3 : " + avg3 + " avg4 : " + avg4);

			log.info(rList.size());
		}
		return rList;
	}

	@Override
	public List<SearchDTO> getSer_AvgProgram(SearchDTO sDTO) throws Exception {
		log.info("주제어별 프로그램 만족도 평가 평균");
		List<SearchDTO> rList = SafAndEffMapper.getSer_Avg_Program(sDTO);
		double avg1;
		double avg2;
		double avg3;
		double avg4;

		avg1 = Math.round((java.lang.Double.parseDouble(rList.get(0).getScore1())
				+ java.lang.Double.parseDouble(rList.get(0).getScore2())
				+ java.lang.Double.parseDouble(rList.get(0).getScore3())) / 3 * 100) / 100.0;
		avg2 = Math.round((java.lang.Double.parseDouble(rList.get(0).getScore4())
				+ java.lang.Double.parseDouble(rList.get(0).getScore5())
				+ java.lang.Double.parseDouble(rList.get(0).getScore6())) / 3 * 100) / 100.0;
		avg3 = Math.round((java.lang.Double.parseDouble(rList.get(0).getScore7())
				+ java.lang.Double.parseDouble(rList.get(0).getScore8())
				+ java.lang.Double.parseDouble(rList.get(0).getScore9())) / 3 * 100) / 100.0;

		if (java.lang.Double.parseDouble(rList.get(0).getScore9()) == 0.0) {
			avg3 = Math.round((java.lang.Double.parseDouble(rList.get(0).getScore7())
					+ java.lang.Double.parseDouble(rList.get(0).getScore8())) / 2 * 100) / 100.0;
		}

		avg4 = Math.round((avg1 + avg2 + avg3) / 3 * 100) / 100.0;
		rList.get(0).setAvg1(Double.toString(avg1));
		rList.get(0).setAvg2(Double.toString(avg2));
		rList.get(0).setAvg3(Double.toString(avg3));
		rList.get(0).setAvg4(Double.toString(avg4));
		log.info(rList.get(0).getAvg3());

		return rList;
	}

	@Override
	public List<SearchDTO> getSer_Service(SearchDTO sDTO) throws Exception {
		log.info("주제어별 시설 만족도 평가");
		List<SearchDTO> rList = SafAndEffMapper.getSer_Service(sDTO);
		return rList;
	}

	@Override
	public List<SearchDTO> getSer_Avg_Service(SearchDTO sDTO) throws Exception {
		log.info("주제어별 시설 만족도 평가 평균");
		List<SearchDTO> rList = SafAndEffMapper.getSer_Avg_Service(sDTO);
		return rList;
	}

	@Override
	public List<SearchDTO> getSer_Healing(SearchDTO sDTO) throws Exception {
		log.info("주제어별 힐링 효과 평가");
		List<SearchDTO> aList = SafAndEffMapper.getSer_ProHealList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getSer_AftHealList(sDTO);
		for (int i = 0; i < aList.size(); i++) {
			for (int j = 0; j < bList.size(); j++) {
				if (aList.get(i).getName().equals(bList.get(j).getName())&& aList.get(i).getAge().equals(bList.get(j).getAge())) {
					aList.get(i).setScore23(bList.get(j).getScore1());
					aList.get(i).setScore24(bList.get(j).getScore2());
					aList.get(i).setScore25(bList.get(j).getScore3());
					aList.get(i).setScore26(bList.get(j).getScore4());
					aList.get(i).setScore27(bList.get(j).getScore5());
					aList.get(i).setScore28(bList.get(j).getScore6());
					aList.get(i).setScore29(bList.get(j).getScore7());
					aList.get(i).setScore30(bList.get(j).getScore8());
					aList.get(i).setScore31(bList.get(j).getScore9());
					aList.get(i).setScore32(bList.get(j).getScore10());
					aList.get(i).setScore33(bList.get(j).getScore11());
					aList.get(i).setScore34(bList.get(j).getScore12());
					aList.get(i).setScore35(bList.get(j).getScore13());
					aList.get(i).setScore36(bList.get(j).getScore14());
					aList.get(i).setScore37(bList.get(j).getScore15());
					aList.get(i).setScore38(bList.get(j).getScore16());
					aList.get(i).setScore39(bList.get(j).getScore17());
					aList.get(i).setScore40(bList.get(j).getScore18());
					aList.get(i).setScore41(bList.get(j).getScore19());
					aList.get(i).setScore42(bList.get(j).getScore20());
					aList.get(i).setScore43(bList.get(j).getScore21());
					aList.get(i).setScore44(bList.get(j).getScore22());
					aList.get(i).setAvg8(bList.get(j).getAvg1());
					aList.get(i).setAvg9(bList.get(j).getAvg2());
					aList.get(i).setAvg10(bList.get(j).getAvg3());
					aList.get(i).setAvg11(bList.get(j).getAvg4());
					aList.get(i).setAvg12(bList.get(j).getAvg5());
					aList.get(i).setAvg13(bList.get(j).getAvg6());
					aList.get(i).setAvg14(bList.get(j).getAvg7());
					break;
				}
			}
		}
		return aList;
	}

	@Override
	public List<SearchDTO> getSer_Avg_Healing(SearchDTO sDTO) throws Exception {
		List<SearchDTO> aList = SafAndEffMapper.getSer_Avg_ProHealList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getSer_Avg_AftHealList(sDTO);
		aList.get(0).setScore23(bList.get(0).getScore1());
		aList.get(0).setScore24(bList.get(0).getScore2());
		aList.get(0).setScore25(bList.get(0).getScore3());
		aList.get(0).setScore26(bList.get(0).getScore4());
		aList.get(0).setScore27(bList.get(0).getScore5());
		aList.get(0).setScore28(bList.get(0).getScore6());
		aList.get(0).setScore29(bList.get(0).getScore7());
		aList.get(0).setScore30(bList.get(0).getScore8());
		aList.get(0).setScore31(bList.get(0).getScore9());
		aList.get(0).setScore32(bList.get(0).getScore10());
		aList.get(0).setScore33(bList.get(0).getScore11());
		aList.get(0).setScore34(bList.get(0).getScore12());
		aList.get(0).setScore35(bList.get(0).getScore13());
		aList.get(0).setScore36(bList.get(0).getScore14());
		aList.get(0).setScore37(bList.get(0).getScore15());
		aList.get(0).setScore38(bList.get(0).getScore16());
		aList.get(0).setScore39(bList.get(0).getScore17());
		aList.get(0).setScore40(bList.get(0).getScore18());
		aList.get(0).setScore41(bList.get(0).getScore19());
		aList.get(0).setScore42(bList.get(0).getScore20());
		aList.get(0).setScore43(bList.get(0).getScore21());
		aList.get(0).setScore44(bList.get(0).getScore22());
		aList.get(0).setAvg8(bList.get(0).getAvg1());
		aList.get(0).setAvg9(bList.get(0).getAvg2());
		aList.get(0).setAvg10(bList.get(0).getAvg3());
		aList.get(0).setAvg11(bList.get(0).getAvg4());
		aList.get(0).setAvg12(bList.get(0).getAvg5());
		aList.get(0).setAvg13(bList.get(0).getAvg6());
		aList.get(0).setAvg14(bList.get(0).getAvg7());
		return aList;
	}

	@Override
	public List<SearchDTO> getSer_Prevent(SearchDTO sDTO) throws Exception {
		log.info("주제어별 예방 효과 평가");

		List<SearchDTO> aList = SafAndEffMapper.getSer_ProPreList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getSer_AftPreList(sDTO);
		for (int i = 0; i < aList.size(); i++) {
			for (int j = 0; j < bList.size(); j++) {
				if (aList.get(i).getName().equals(bList.get(j).getName())
						&& aList.get(i).getAge().equals(bList.get(j).getAge())) {
					aList.get(i).setScore21(bList.get(j).getScore1());
					aList.get(i).setScore22(bList.get(j).getScore2());
					aList.get(i).setScore23(bList.get(j).getScore3());
					aList.get(i).setScore24(bList.get(j).getScore4());
					aList.get(i).setScore25(bList.get(j).getScore5());
					aList.get(i).setScore26(bList.get(j).getScore6());
					aList.get(i).setScore27(bList.get(j).getScore7());
					aList.get(i).setScore28(bList.get(j).getScore8());
					aList.get(i).setScore29(bList.get(j).getScore9());
					aList.get(i).setScore30(bList.get(j).getScore10());
					aList.get(i).setScore31(bList.get(j).getScore11());
					aList.get(i).setScore32(bList.get(j).getScore12());
					aList.get(i).setScore33(bList.get(j).getScore13());
					aList.get(i).setScore34(bList.get(j).getScore14());
					aList.get(i).setScore35(bList.get(j).getScore15());
					aList.get(i).setScore36(bList.get(j).getScore16());
					aList.get(i).setScore37(bList.get(j).getScore17());
					aList.get(i).setScore38(bList.get(j).getScore18());
					aList.get(i).setScore39(bList.get(j).getScore19());
					aList.get(i).setScore40(bList.get(j).getScore20());
					aList.get(i).setAvg7(bList.get(j).getAvg1());
					aList.get(i).setAvg8(bList.get(j).getAvg2());
					aList.get(i).setAvg9(bList.get(j).getAvg3());
					aList.get(i).setAvg10(bList.get(j).getAvg4());
					aList.get(i).setAvg11(bList.get(j).getAvg5());
					aList.get(i).setAvg12(bList.get(j).getAvg6());
					break;
				}
			}
		}

		return aList;
	}

	@Override
	public List<SearchDTO> getSer_Avg_Prevent(SearchDTO sDTO) throws Exception {
		log.info("주제어별 예방 효과 평가 평균");
		List<SearchDTO> aList = SafAndEffMapper.getSer_Avg_ProPreList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getSer_Avg_AftPreList(sDTO);
		aList.get(0).setScore21(bList.get(0).getScore1());
		aList.get(0).setScore22(bList.get(0).getScore2());
		aList.get(0).setScore23(bList.get(0).getScore3());
		aList.get(0).setScore24(bList.get(0).getScore4());
		aList.get(0).setScore25(bList.get(0).getScore5());
		aList.get(0).setScore26(bList.get(0).getScore6());
		aList.get(0).setScore27(bList.get(0).getScore7());
		aList.get(0).setScore28(bList.get(0).getScore8());
		aList.get(0).setScore29(bList.get(0).getScore9());
		aList.get(0).setScore30(bList.get(0).getScore10());
		aList.get(0).setScore31(bList.get(0).getScore11());
		aList.get(0).setScore32(bList.get(0).getScore12());
		aList.get(0).setScore33(bList.get(0).getScore13());
		aList.get(0).setScore34(bList.get(0).getScore14());
		aList.get(0).setScore35(bList.get(0).getScore15());
		aList.get(0).setScore36(bList.get(0).getScore16());
		aList.get(0).setScore37(bList.get(0).getScore17());
		aList.get(0).setScore38(bList.get(0).getScore18());
		aList.get(0).setScore39(bList.get(0).getScore19());
		aList.get(0).setScore40(bList.get(0).getScore20());
		aList.get(0).setAvg7(bList.get(0).getAvg1());
		aList.get(0).setAvg8(bList.get(0).getAvg2());
		aList.get(0).setAvg9(bList.get(0).getAvg3());
		aList.get(0).setAvg10(bList.get(0).getAvg4());
		aList.get(0).setAvg11(bList.get(0).getAvg5());
		aList.get(0).setAvg12(bList.get(0).getAvg6());
		return aList;
	}

	@Override
	public List<SearchDTO> getSer_Counsel(SearchDTO sDTO) throws Exception {
		List<SearchDTO> aList = SafAndEffMapper.getSer_ProCounselList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getSer_MidCounselList(sDTO);
		List<SearchDTO> cList = SafAndEffMapper.getSer_AftCounselList(sDTO);
		List<SearchDTO> sList = SafAndEffMapper.getSer_CounselSessionList(sDTO);
		for (int i = 0; i < aList.size(); i++) {
			for (int j = 0; j < bList.size(); j++) {
				if (aList.get(i).getName().equals(bList.get(j).getName())
						&& aList.get(i).getAge().equals(bList.get(j).getAge())) {
					aList.get(i).setScore20(bList.get(j).getScore1());
					aList.get(i).setScore21(bList.get(j).getScore2());
					aList.get(i).setScore22(bList.get(j).getScore3());
					aList.get(i).setScore23(bList.get(j).getScore4());
					aList.get(i).setScore24(bList.get(j).getScore5());
					aList.get(i).setScore25(bList.get(j).getScore6());
					aList.get(i).setScore26(bList.get(j).getScore7());
					aList.get(i).setScore27(bList.get(j).getScore8());
					aList.get(i).setScore28(bList.get(j).getScore9());
					aList.get(i).setScore29(bList.get(j).getScore10());
					aList.get(i).setScore30(bList.get(j).getScore11());
					aList.get(i).setScore31(bList.get(j).getScore12());
					aList.get(i).setScore32(bList.get(j).getScore13());
					aList.get(i).setScore33(bList.get(j).getScore14());
					aList.get(i).setScore34(bList.get(j).getScore15());
					aList.get(i).setScore35(bList.get(j).getScore16());
					aList.get(i).setScore36(bList.get(j).getScore17());
					aList.get(i).setScore37(bList.get(j).getScore18());
					aList.get(i).setScore38(bList.get(j).getScore19());
					break;
				}
			}
			for (int k = 0; k < cList.size(); k++) {
				if (aList.get(i).getName().equals(cList.get(k).getName())
						&& aList.get(i).getAge().equals(cList.get(k).getAge())) {
					aList.get(i).setScore39(cList.get(k).getScore1());
					aList.get(i).setScore40(cList.get(k).getScore2());
					aList.get(i).setScore41(cList.get(k).getScore3());
					aList.get(i).setScore42(cList.get(k).getScore4());
					aList.get(i).setScore43(cList.get(k).getScore5());
					aList.get(i).setScore44(cList.get(k).getScore6());
					aList.get(i).setScore45(cList.get(k).getScore7());
					aList.get(i).setScore46(cList.get(k).getScore8());
					aList.get(i).setScore47(cList.get(k).getScore9());
					aList.get(i).setScore48(cList.get(k).getScore10());
					aList.get(i).setScore49(cList.get(k).getScore11());
					aList.get(i).setScore50(cList.get(k).getScore12());
					aList.get(i).setScore51(cList.get(k).getScore13());
					aList.get(i).setScore52(cList.get(k).getScore14());
					aList.get(i).setScore53(cList.get(k).getScore15());
					aList.get(i).setScore54(cList.get(k).getScore16());
					aList.get(i).setScore55(cList.get(k).getScore17());
					aList.get(i).setScore56(cList.get(k).getScore18());
					aList.get(i).setScore57(cList.get(k).getScore19());
					break;
				}
			}
			for (int l = 0; l < sList.size(); l++) {
				if (aList.get(i).getName().equals(sList.get(l).getName())
						&& aList.get(i).getAge().equals(sList.get(l).getAge())) {
					if (sList.get(l).getSession().get(0).equals("시작회기")) {
						aList.get(i).setTime_1(sList.get(l).getSession().get(1));
						aList.get(i).setCost_1(sList.get(l).getSession().get(2));

					} else if (sList.get(l).getSession().get(0).equals("중간회기")) {
						aList.get(i).setTime_2(sList.get(l).getSession().get(1));
						aList.get(i).setCost_2(sList.get(l).getSession().get(2));

					} else if (sList.get(l).getSession().get(0).equals("종결회기")) {
						aList.get(i).setTime_3(sList.get(l).getSession().get(1));
						aList.get(i).setCost_3(sList.get(l).getSession().get(2));

					}
				}
			}
		}
		for (int i = 0; i < aList.size(); i++) {
			if (aList.get(i).getTime_2() == null) {
				aList.get(i).setTime_2("0");
			}
			if (aList.get(i).getTime_3() == null) {
				aList.get(i).setTime_3("0");
			}
			if (aList.get(i).getCost_2() == null) {
				aList.get(i).setCost_2("0");
			}
			if (aList.get(i).getCost_3() == null) {
				aList.get(i).setCost_3("0");
			}
		}
		return aList;
	}

	@Override
	public List<SearchDTO> getSer_Avg_Counsel(SearchDTO sDTO) throws Exception {
		List<SearchDTO> aList = SafAndEffMapper.getSer_ProCounselList(sDTO);// 시작회기
		List<SearchDTO> bList = SafAndEffMapper.getSer_AftCounselList(sDTO);// 종결회기
		double sum1 = 0;
		double sum2 = 0;
		double sum3 = 0;
		double sum4 = 0;
		double sum5 = 0;
		double sum6 = 0;
		double sum7 = 0;
		double sum8 = 0;
		double sum9 = 0;
		double sum10 = 0;
		double sum11 = 0;
		double sum12 = 0;
		double sum13 = 0;
		double sum14 = 0;
		double sum15 = 0;
		double sum16 = 0;
		double sum17 = 0;
		double sum18 = 0;
		double sum19 = 0;
		double cnt1 = 0;
		double cnt2 = 0;
		double cnt3 = 0;
		double cnt4 = 0;
		double cnt5 = 0;
		double cnt6 = 0;
		double cnt7 = 0;
		double cnt8 = 0;
		double cnt9 = 0;
		double cnt10 = 0;
		double cnt11 = 0;
		double cnt12 = 0;
		double cnt13 = 0;
		double cnt14 = 0;
		double cnt15 = 0;
		double cnt16 = 0;
		double cnt17 = 0;
		double cnt18 = 0;
		double cnt19 = 0;
		if(aList.size()>0) {
		for (int i = 0; i < aList.size(); i++) {
			if (!aList.get(i).getScore1().equals("0")) {
				log.info(i);
				sum1 = sum1 + Double.parseDouble(aList.get(i).getScore1());
				cnt1++;
			}
			if (!aList.get(i).getScore2().equals("0")) {
				sum2 = sum2 + Double.parseDouble(aList.get(i).getScore2());
				cnt2++;
			}
			if (!aList.get(i).getScore3().equals("0")) {
				sum3 = sum3 + Double.parseDouble(aList.get(i).getScore3());
				cnt3++;
			}
			if (!aList.get(i).getScore4().equals("0")) {
				sum4 = sum4 + Double.parseDouble(aList.get(i).getScore4());
				cnt4++;
			}
			if (!aList.get(i).getScore5().equals("0")) {
				sum5 = sum5 + Double.parseDouble(aList.get(i).getScore5());
				cnt5++;
			}
			if (!aList.get(i).getScore6().equals("0")) {
				sum6 = sum6 + Double.parseDouble(aList.get(i).getScore6());
				cnt6++;
			}
			if (!aList.get(i).getScore7().equals("0")) {
				sum7 = sum7 + Double.parseDouble(aList.get(i).getScore7());
				cnt7++;
			}
			if (!aList.get(i).getScore8().equals("0")) {
				sum8 = sum8 + Double.parseDouble(aList.get(i).getScore8());
				cnt8++;
			}
			if (!aList.get(i).getScore9().equals("0")) {
				sum9 = sum9 + Double.parseDouble(aList.get(i).getScore9());
				cnt9++;
			}
			if (!aList.get(i).getScore10().equals("0")) {
				sum10 = sum10 + Double.parseDouble(aList.get(i).getScore10());
				cnt10++;
			}
			if (!aList.get(i).getScore11().equals("0")) {
				sum11 = sum11 + Double.parseDouble(aList.get(i).getScore11());
				cnt11++;
			}
			if (!aList.get(i).getScore12().equals("0")) {
				sum12 = sum12 + Double.parseDouble(aList.get(i).getScore12());
				cnt12++;
			}
			if (!aList.get(i).getScore13().equals("0")) {
				sum13 = sum13 + Double.parseDouble(aList.get(i).getScore13());
				cnt13++;
			}
			if (!aList.get(i).getScore14().equals("0")) {
				sum14 = sum14 + Double.parseDouble(aList.get(i).getScore14());
				cnt14++;
			}
			if (!aList.get(i).getScore15().equals("0")) {
				sum15 = sum15 + Double.parseDouble(aList.get(i).getScore15());
				cnt15++;
			}
			if (!aList.get(i).getScore16().equals("0")) {
				sum16 = sum16 + Double.parseDouble(aList.get(i).getScore16());
				cnt16++;
			}
			if (!aList.get(i).getScore17().equals("0")) {
				sum17 = sum17 + Double.parseDouble(aList.get(i).getScore17());
				cnt17++;
			}
			if (!aList.get(i).getScore18().equals("0")) {
				sum18 = sum18 + Double.parseDouble(aList.get(i).getScore18());
				cnt18++;
			}
			if (!aList.get(i).getScore19().equals("0")) {
				sum19 = sum19 + Double.parseDouble(aList.get(i).getScore19());
				cnt19++;
			}
		}
		aList.get(0).setScore1(Double.toString(Math.round(sum1 / cnt1 * 100) / 100.0));
		aList.get(0).setScore2(Double.toString(Math.round(sum2 / cnt2 * 100) / 100.0));
		aList.get(0).setScore3(Double.toString(Math.round(sum3 / cnt3 * 100) / 100.0));
		aList.get(0).setScore4(Double.toString(Math.round(sum4 / cnt4 * 100) / 100.0));
		aList.get(0).setScore5(Double.toString(Math.round(sum5 / cnt5 * 100) / 100.0));
		aList.get(0).setScore6(Double.toString(Math.round(sum6 / cnt6 * 100) / 100.0));
		aList.get(0).setScore7(Double.toString(Math.round(sum7 / cnt7 * 100) / 100.0));
		aList.get(0).setScore8(Double.toString(Math.round(sum8 / cnt8 * 100) / 100.0));
		aList.get(0).setScore9(Double.toString(Math.round(sum9 / cnt9 * 100) / 100.0));
		aList.get(0).setScore10(Double.toString(Math.round(sum10 / cnt10 * 100) / 100.0));
		aList.get(0).setScore11(Double.toString(Math.round(sum11 / cnt11 * 100) / 100.0));
		aList.get(0).setScore12(Double.toString(Math.round(sum12 / cnt12 * 100) / 100.0));
		aList.get(0).setScore13(Double.toString(Math.round(sum13 / cnt13 * 100) / 100.0));
		aList.get(0).setScore14(Double.toString(Math.round(sum14 / cnt14 * 100) / 100.0));
		aList.get(0).setScore15(Double.toString(Math.round(sum15 / cnt15 * 100) / 100.0));
		aList.get(0).setScore16(Double.toString(Math.round(sum16 / cnt16 * 100) / 100.0));
		aList.get(0).setScore17(Double.toString(Math.round(sum17 / cnt17 * 100) / 100.0));
		aList.get(0).setScore18(Double.toString(Math.round(sum18 / cnt18 * 100) / 100.0));
		aList.get(0).setScore19(Double.toString(Math.round(sum19 / cnt19 * 100) / 100.0));
		}
		// 사후평균
		sum1 = 0;
		sum2 = 0;
		sum3 = 0;
		sum4 = 0;
		sum5 = 0;
		sum6 = 0;
		sum7 = 0;
		sum8 = 0;
		sum9 = 0;
		sum10 = 0;
		sum11 = 0;
		sum12 = 0;
		sum13 = 0;
		sum14 = 0;
		sum15 = 0;
		sum16 = 0;
		sum17 = 0;
		sum18 = 0;
		sum19 = 0;
		cnt1 = 0;
		cnt2 = 0;
		cnt3 = 0;
		cnt4 = 0;
		cnt5 = 0;
		cnt6 = 0;
		cnt7 = 0;
		cnt8 = 0;
		cnt9 = 0;
		cnt10 = 0;
		cnt11 = 0;
		cnt12 = 0;
		cnt13 = 0;
		cnt14 = 0;
		cnt15 = 0;
		cnt16 = 0;
		cnt17 = 0;
		cnt18 = 0;
		cnt19 = 0;

		for (int i = 0; i < bList.size(); i++) {
			if (!bList.get(i).getScore1().equals("0")) {
				log.info(i);
				sum1 = sum1 + Double.parseDouble(bList.get(i).getScore1());
				cnt1++;
			}
			if (!bList.get(i).getScore2().equals("0")) {
				sum2 = sum2 + Double.parseDouble(bList.get(i).getScore2());
				cnt2++;
			}
			if (!bList.get(i).getScore3().equals("0")) {
				sum3 = sum3 + Double.parseDouble(bList.get(i).getScore3());
				cnt3++;
			}
			if (!bList.get(i).getScore4().equals("0")) {
				sum4 = sum4 + Double.parseDouble(bList.get(i).getScore4());
				cnt4++;
			}
			if (!bList.get(i).getScore5().equals("0")) {
				sum5 = sum5 + Double.parseDouble(bList.get(i).getScore5());
				cnt5++;
			}
			if (!bList.get(i).getScore6().equals("0")) {
				sum6 = sum6 + Double.parseDouble(bList.get(i).getScore6());
				cnt6++;
			}
			if (!bList.get(i).getScore7().equals("0")) {
				sum7 = sum7 + Double.parseDouble(bList.get(i).getScore7());
				cnt7++;
			}
			if (!bList.get(i).getScore8().equals("0")) {
				sum8 = sum8 + Double.parseDouble(bList.get(i).getScore8());
				cnt8++;
			}
			if (!bList.get(i).getScore9().equals("0")) {
				sum9 = sum9 + Double.parseDouble(bList.get(i).getScore9());
				cnt9++;
			}
			if (!aList.get(i).getScore10().equals("0")) {
				sum10 = sum10 + Double.parseDouble(aList.get(i).getScore10());
				cnt10++;
			}
			if (!bList.get(i).getScore11().equals("0")) {
				sum11 = sum11 + Double.parseDouble(bList.get(i).getScore11());
				cnt11++;
			}
			if (!bList.get(i).getScore12().equals("0")) {
				sum12 = sum12 + Double.parseDouble(bList.get(i).getScore12());
				cnt12++;
			}
			if (!bList.get(i).getScore13().equals("0")) {
				sum13 = sum13 + Double.parseDouble(bList.get(i).getScore13());
				cnt13++;
			}
			if (!bList.get(i).getScore14().equals("0")) {
				sum14 = sum14 + Double.parseDouble(bList.get(i).getScore14());
				cnt14++;
			}
			if (!bList.get(i).getScore15().equals("0")) {
				sum15 = sum15 + Double.parseDouble(bList.get(i).getScore15());
				cnt15++;
			}
			if (!bList.get(i).getScore16().equals("0")) {
				sum16 = sum16 + Double.parseDouble(bList.get(i).getScore16());
				cnt16++;
			}
			if (!bList.get(i).getScore17().equals("0")) {
				sum17 = sum17 + Double.parseDouble(bList.get(i).getScore17());
				cnt17++;
			}
			if (!bList.get(i).getScore18().equals("0")) {
				sum18 = sum18 + Double.parseDouble(bList.get(i).getScore18());
				cnt18++;
			}
			if (!bList.get(i).getScore19().equals("0")) {
				sum19 = sum19 + Double.parseDouble(bList.get(i).getScore19());
				cnt19++;
			}
		}
		if(bList.size()>0){
		bList.get(0).setScore1(Double.toString(Math.round(sum1 / cnt1 * 100) / 100.0));
		bList.get(0).setScore2(Double.toString(Math.round(sum2 / cnt2 * 100) / 100.0));
		bList.get(0).setScore3(Double.toString(Math.round(sum3 / cnt3 * 100) / 100.0));
		bList.get(0).setScore4(Double.toString(Math.round(sum4 / cnt4 * 100) / 100.0));
		bList.get(0).setScore5(Double.toString(Math.round(sum5 / cnt5 * 100) / 100.0));
		bList.get(0).setScore6(Double.toString(Math.round(sum6 / cnt6 * 100) / 100.0));
		bList.get(0).setScore7(Double.toString(Math.round(sum7 / cnt7 * 100) / 100.0));
		bList.get(0).setScore8(Double.toString(Math.round(sum8 / cnt8 * 100) / 100.0));
		bList.get(0).setScore9(Double.toString(Math.round(sum9 / cnt9 * 100) / 100.0));
		bList.get(0).setScore10(Double.toString(Math.round(sum10 / cnt10 * 100) / 100.0));
		bList.get(0).setScore11(Double.toString(Math.round(sum11 / cnt11 * 100) / 100.0));
		bList.get(0).setScore12(Double.toString(Math.round(sum12 / cnt12 * 100) / 100.0));
		aList.get(0).setScore13(Double.toString(Math.round(sum13 / cnt13 * 100) / 100.0));
		bList.get(0).setScore14(Double.toString(Math.round(sum14 / cnt14 * 100) / 100.0));
		bList.get(0).setScore15(Double.toString(Math.round(sum15 / cnt15 * 100) / 100.0));
		bList.get(0).setScore16(Double.toString(Math.round(sum16 / cnt16 * 100) / 100.0));
		bList.get(0).setScore17(Double.toString(Math.round(sum17 / cnt17 * 100) / 100.0));
		bList.get(0).setScore18(Double.toString(Math.round(sum18 / cnt18 * 100) / 100.0));
		bList.get(0).setScore19(Double.toString(Math.round(sum19 / cnt19 * 100) / 100.0));

		aList.get(0).setScore20(bList.get(0).getScore1());
		aList.get(0).setScore21(bList.get(0).getScore2());
		aList.get(0).setScore22(bList.get(0).getScore3());
		aList.get(0).setScore23(bList.get(0).getScore4());
		aList.get(0).setScore24(bList.get(0).getScore5());
		aList.get(0).setScore25(bList.get(0).getScore6());
		aList.get(0).setScore26(bList.get(0).getScore7());
		aList.get(0).setScore27(bList.get(0).getScore8());
		aList.get(0).setScore28(bList.get(0).getScore9());
		aList.get(0).setScore29(bList.get(0).getScore10());
		aList.get(0).setScore30(bList.get(0).getScore11());
		aList.get(0).setScore31(bList.get(0).getScore12());
		aList.get(0).setScore32(bList.get(0).getScore13());
		aList.get(0).setScore33(bList.get(0).getScore14());
		aList.get(0).setScore34(bList.get(0).getScore15());
		aList.get(0).setScore35(bList.get(0).getScore16());
		aList.get(0).setScore36(bList.get(0).getScore17());
		aList.get(0).setScore37(bList.get(0).getScore18());
		aList.get(0).setScore38(bList.get(0).getScore19());
		}
		return aList;
	}

	@Override
	public List<SearchDTO> getAvgCoulselList(SearchDTO sDTO) throws Exception {
		List<SearchDTO> aList = SafAndEffMapper.getProCounselList(sDTO);
		List<SearchDTO> bList = SafAndEffMapper.getAftCounselList(sDTO);

		double sum1 = 0;
		double sum2 = 0;
		double sum3 = 0;
		double sum4 = 0;
		double sum5 = 0;
		double sum6 = 0;
		double sum7 = 0;
		double sum8 = 0;
		double sum9 = 0;
		double sum10 = 0;
		double sum11 = 0;
		double sum12 = 0;
		double sum13 = 0;
		double sum14 = 0;
		double sum15 = 0;
		double sum16 = 0;
		double sum17 = 0;
		double sum18 = 0;
		double sum19 = 0;
		double cnt1 = 0;
		double cnt2 = 0;
		double cnt3 = 0;
		double cnt4 = 0;
		double cnt5 = 0;
		double cnt6 = 0;
		double cnt7 = 0;
		double cnt8 = 0;
		double cnt9 = 0;
		double cnt10 = 0;
		double cnt11 = 0;
		double cnt12 = 0;
		double cnt13 = 0;
		double cnt14 = 0;
		double cnt15 = 0;
		double cnt16 = 0;
		double cnt17 = 0;
		double cnt18 = 0;
		double cnt19 = 0;
		for (int i = 0; i < aList.size(); i++) {
			if (!aList.get(i).getScore1().equals("0")) {
				log.info(i);
				sum1 = sum1 + Double.parseDouble(aList.get(i).getScore1());
				cnt1++;
			}
			if (!aList.get(i).getScore2().equals("0")) {
				sum2 = sum2 + Double.parseDouble(aList.get(i).getScore2());
				cnt2++;
			}
			if (!aList.get(i).getScore3().equals("0")) {
				sum3 = sum3 + Double.parseDouble(aList.get(i).getScore3());
				cnt3++;
			}
			if (!aList.get(i).getScore4().equals("0")) {
				sum4 = sum4 + Double.parseDouble(aList.get(i).getScore4());
				cnt4++;
			}
			if (!aList.get(i).getScore5().equals("0")) {
				sum5 = sum5 + Double.parseDouble(aList.get(i).getScore5());
				cnt5++;
			}
			if (!aList.get(i).getScore6().equals("0")) {
				sum6 = sum6 + Double.parseDouble(aList.get(i).getScore6());
				cnt6++;
			}
			if (!aList.get(i).getScore7().equals("0")) {
				sum7 = sum7 + Double.parseDouble(aList.get(i).getScore7());
				cnt7++;
			}
			if (!aList.get(i).getScore8().equals("0")) {
				sum8 = sum8 + Double.parseDouble(aList.get(i).getScore8());
				cnt8++;
			}
			if (!aList.get(i).getScore9().equals("0")) {
				sum9 = sum9 + Double.parseDouble(aList.get(i).getScore9());
				cnt9++;
			}
			if (!aList.get(i).getScore10().equals("0")) {
				sum10 = sum10 + Double.parseDouble(aList.get(i).getScore10());
				cnt10++;
			}
			if (!aList.get(i).getScore11().equals("0")) {
				sum11 = sum11 + Double.parseDouble(aList.get(i).getScore11());
				cnt11++;
			}
			if (!aList.get(i).getScore12().equals("0")) {
				sum12 = sum12 + Double.parseDouble(aList.get(i).getScore12());
				cnt12++;
			}
			if (!aList.get(i).getScore13().equals("0")) {
				sum13 = sum13 + Double.parseDouble(aList.get(i).getScore13());
				cnt13++;
			}
			if (!aList.get(i).getScore14().equals("0")) {
				sum14 = sum14 + Double.parseDouble(aList.get(i).getScore14());
				cnt14++;
			}
			if (!aList.get(i).getScore15().equals("0")) {
				sum15 = sum15 + Double.parseDouble(aList.get(i).getScore15());
				cnt15++;
			}
			if (!aList.get(i).getScore16().equals("0")) {
				sum16 = sum16 + Double.parseDouble(aList.get(i).getScore16());
				cnt16++;
			}
			if (!aList.get(i).getScore17().equals("0")) {
				sum17 = sum17 + Double.parseDouble(aList.get(i).getScore17());
				cnt17++;
			}
			if (!aList.get(i).getScore18().equals("0")) {
				sum18 = sum18 + Double.parseDouble(aList.get(i).getScore18());
				cnt18++;
			}
			if (!aList.get(i).getScore19().equals("0")) {
				sum19 = sum19 + Double.parseDouble(aList.get(i).getScore19());
				cnt19++;
			}
		}
		aList.get(0).setScore1(Double.toString(Math.round(sum1 / cnt1 * 100) / 100.0));
		aList.get(0).setScore2(Double.toString(Math.round(sum2 / cnt2 * 100) / 100.0));
		aList.get(0).setScore3(Double.toString(Math.round(sum3 / cnt3 * 100) / 100.0));
		aList.get(0).setScore4(Double.toString(Math.round(sum4 / cnt4 * 100) / 100.0));
		aList.get(0).setScore5(Double.toString(Math.round(sum5 / cnt5 * 100) / 100.0));
		aList.get(0).setScore6(Double.toString(Math.round(sum6 / cnt6 * 100) / 100.0));
		aList.get(0).setScore7(Double.toString(Math.round(sum7 / cnt7 * 100) / 100.0));
		aList.get(0).setScore8(Double.toString(Math.round(sum8 / cnt8 * 100) / 100.0));
		aList.get(0).setScore9(Double.toString(Math.round(sum9 / cnt9 * 100) / 100.0));
		aList.get(0).setScore10(Double.toString(Math.round(sum10 / cnt10 * 100) / 100.0));
		aList.get(0).setScore11(Double.toString(Math.round(sum11 / cnt11 * 100) / 100.0));
		aList.get(0).setScore12(Double.toString(Math.round(sum12 / cnt12 * 100) / 100.0));
		aList.get(0).setScore13(Double.toString(Math.round(sum13 / cnt13 * 100) / 100.0));
		aList.get(0).setScore14(Double.toString(Math.round(sum14 / cnt14 * 100) / 100.0));
		aList.get(0).setScore15(Double.toString(Math.round(sum15 / cnt15 * 100) / 100.0));
		aList.get(0).setScore16(Double.toString(Math.round(sum16 / cnt16 * 100) / 100.0));
		aList.get(0).setScore17(Double.toString(Math.round(sum17 / cnt17 * 100) / 100.0));
		aList.get(0).setScore18(Double.toString(Math.round(sum18 / cnt18 * 100) / 100.0));
		aList.get(0).setScore19(Double.toString(Math.round(sum19 / cnt19 * 100) / 100.0));
		// 사후평균
		sum1 = 0;
		sum2 = 0;
		sum3 = 0;
		sum4 = 0;
		sum5 = 0;
		sum6 = 0;
		sum7 = 0;
		sum8 = 0;
		sum9 = 0;
		sum10 = 0;
		sum11 = 0;
		sum12 = 0;
		sum13 = 0;
		sum14 = 0;
		sum15 = 0;
		sum16 = 0;
		sum17 = 0;
		sum18 = 0;
		sum19 = 0;
		cnt1 = 0;
		cnt2 = 0;
		cnt3 = 0;
		cnt4 = 0;
		cnt5 = 0;
		cnt6 = 0;
		cnt7 = 0;
		cnt8 = 0;
		cnt9 = 0;
		cnt10 = 0;
		cnt11 = 0;
		cnt12 = 0;
		cnt13 = 0;
		cnt14 = 0;
		cnt15 = 0;
		cnt16 = 0;
		cnt17 = 0;
		cnt18 = 0;
		cnt19 = 0;

		for (int i = 0; i < bList.size(); i++) {
			if (!bList.get(i).getScore1().equals("0")) {
				log.info(i);
				sum1 = sum1 + Double.parseDouble(bList.get(i).getScore1());
				cnt1++;
			}
			if (!bList.get(i).getScore2().equals("0")) {
				sum2 = sum2 + Double.parseDouble(bList.get(i).getScore2());
				cnt2++;
			}
			if (!bList.get(i).getScore3().equals("0")) {
				sum3 = sum3 + Double.parseDouble(bList.get(i).getScore3());
				cnt3++;
			}
			if (!bList.get(i).getScore4().equals("0")) {
				sum4 = sum4 + Double.parseDouble(bList.get(i).getScore4());
				cnt4++;
			}
			if (!bList.get(i).getScore5().equals("0")) {
				sum5 = sum5 + Double.parseDouble(bList.get(i).getScore5());
				cnt5++;
			}
			if (!bList.get(i).getScore6().equals("0")) {
				sum6 = sum6 + Double.parseDouble(bList.get(i).getScore6());
				cnt6++;
			}
			if (!bList.get(i).getScore7().equals("0")) {
				sum7 = sum7 + Double.parseDouble(bList.get(i).getScore7());
				cnt7++;
			}
			if (!bList.get(i).getScore8().equals("0")) {
				sum8 = sum8 + Double.parseDouble(bList.get(i).getScore8());
				cnt8++;
			}
			if (!bList.get(i).getScore9().equals("0")) {
				sum9 = sum9 + Double.parseDouble(bList.get(i).getScore9());
				cnt9++;
			}
			if (!aList.get(i).getScore10().equals("0")) {
				sum10 = sum10 + Double.parseDouble(aList.get(i).getScore10());
				cnt10++;
			}
			if (!bList.get(i).getScore11().equals("0")) {
				sum11 = sum11 + Double.parseDouble(bList.get(i).getScore11());
				cnt11++;
			}
			if (!bList.get(i).getScore12().equals("0")) {
				sum12 = sum12 + Double.parseDouble(bList.get(i).getScore12());
				cnt12++;
			}
			if (!bList.get(i).getScore13().equals("0")) {
				sum13 = sum13 + Double.parseDouble(bList.get(i).getScore13());
				cnt13++;
			}
			if (!bList.get(i).getScore14().equals("0")) {
				sum14 = sum14 + Double.parseDouble(bList.get(i).getScore14());
				cnt14++;
			}
			if (!bList.get(i).getScore15().equals("0")) {
				sum15 = sum15 + Double.parseDouble(bList.get(i).getScore15());
				cnt15++;
			}
			if (!bList.get(i).getScore16().equals("0")) {
				sum16 = sum16 + Double.parseDouble(bList.get(i).getScore16());
				cnt16++;
			}
			if (!bList.get(i).getScore17().equals("0")) {
				sum17 = sum17 + Double.parseDouble(bList.get(i).getScore17());
				cnt17++;
			}
			if (!bList.get(i).getScore18().equals("0")) {
				sum18 = sum18 + Double.parseDouble(bList.get(i).getScore18());
				cnt18++;
			}
			if (!bList.get(i).getScore19().equals("0")) {
				sum19 = sum19 + Double.parseDouble(bList.get(i).getScore19());
				cnt19++;
			}
		}
		bList.get(0).setScore1(Double.toString(Math.round(sum1 / cnt1 * 100) / 100.0));
		bList.get(0).setScore2(Double.toString(Math.round(sum2 / cnt2 * 100) / 100.0));
		bList.get(0).setScore3(Double.toString(Math.round(sum3 / cnt3 * 100) / 100.0));
		bList.get(0).setScore4(Double.toString(Math.round(sum4 / cnt4 * 100) / 100.0));
		bList.get(0).setScore5(Double.toString(Math.round(sum5 / cnt5 * 100) / 100.0));
		bList.get(0).setScore6(Double.toString(Math.round(sum6 / cnt6 * 100) / 100.0));
		bList.get(0).setScore7(Double.toString(Math.round(sum7 / cnt7 * 100) / 100.0));
		bList.get(0).setScore8(Double.toString(Math.round(sum8 / cnt8 * 100) / 100.0));
		bList.get(0).setScore9(Double.toString(Math.round(sum9 / cnt9 * 100) / 100.0));
		bList.get(0).setScore10(Double.toString(Math.round(sum10 / cnt10 * 100) / 100.0));
		bList.get(0).setScore11(Double.toString(Math.round(sum11 / cnt11 * 100) / 100.0));
		bList.get(0).setScore12(Double.toString(Math.round(sum12 / cnt12 * 100) / 100.0));
		aList.get(0).setScore13(Double.toString(Math.round(sum13 / cnt13 * 100) / 100.0));
		bList.get(0).setScore14(Double.toString(Math.round(sum14 / cnt14 * 100) / 100.0));
		bList.get(0).setScore15(Double.toString(Math.round(sum15 / cnt15 * 100) / 100.0));
		bList.get(0).setScore16(Double.toString(Math.round(sum16 / cnt16 * 100) / 100.0));
		bList.get(0).setScore17(Double.toString(Math.round(sum17 / cnt17 * 100) / 100.0));
		bList.get(0).setScore18(Double.toString(Math.round(sum18 / cnt18 * 100) / 100.0));
		bList.get(0).setScore19(Double.toString(Math.round(sum19 / cnt19 * 100) / 100.0));

		aList.get(0).setScore20(bList.get(0).getScore1());
		aList.get(0).setScore21(bList.get(0).getScore2());
		aList.get(0).setScore22(bList.get(0).getScore3());
		aList.get(0).setScore23(bList.get(0).getScore4());
		aList.get(0).setScore24(bList.get(0).getScore5());
		aList.get(0).setScore25(bList.get(0).getScore6());
		aList.get(0).setScore26(bList.get(0).getScore7());
		aList.get(0).setScore27(bList.get(0).getScore8());
		aList.get(0).setScore28(bList.get(0).getScore9());
		aList.get(0).setScore29(bList.get(0).getScore10());
		aList.get(0).setScore30(bList.get(0).getScore11());
		aList.get(0).setScore31(bList.get(0).getScore12());
		aList.get(0).setScore32(bList.get(0).getScore13());
		aList.get(0).setScore33(bList.get(0).getScore14());
		aList.get(0).setScore34(bList.get(0).getScore15());
		aList.get(0).setScore35(bList.get(0).getScore16());
		aList.get(0).setScore36(bList.get(0).getScore17());
		aList.get(0).setScore37(bList.get(0).getScore18());
		aList.get(0).setScore38(bList.get(0).getScore19());

		return aList;
	}

}
