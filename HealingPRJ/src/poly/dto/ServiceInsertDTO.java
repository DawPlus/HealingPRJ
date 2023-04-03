package poly.dto;

import java.util.Arrays;
import java.util.List;

public class ServiceInsertDTO {
	
	private String agency;
	private String openday;
	private String endday;
	private String ptcProgram;
	private String sex;
	private String age;
	private String residence;
	private String job;
	private String eval_date;
	private String score1;
	private String score2;
	private String score3;
	private String score4;
	private String score5;
	private String score6;
	private String score7;
	private String score8;
	private String score9;
	private String score10;
	private String score11;
	private String score12;
	private String score13;
	private String score14;
	private String score15;
	private String score16;
	private String score17;
	private String score18;
	private String facility_opinion;
	private String operation_opinion;
	private List<String> scoreList;
	private List<String> scoreString2List;
	private List<ServiceInsertDTO> serviceDtoList;
	private String sum;
	private String avg;

	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public String getOpenday() {
		return openday;
	}
	public void setOpenday(String openday) {
		this.openday = openday;
	}
	public String getPtcProgram() {
		return ptcProgram;
	}
	public void setPtcProgram(String ptcProgram) {
		this.ptcProgram = ptcProgram;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getResidence() {
		return residence;
	}
	public void setResidence(String residence) {
		this.residence = residence;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getEval_date() {
		return eval_date;
	}
	public void setEval_date(String eval_date) {
		this.eval_date = eval_date;
	}
	public String getScore1() {
		return score1;
	}
	public void setScore1(String score1) {
		this.score1 = score1;
	}
	public String getScore2() {
		return score2;
	}
	public void setScore2(String score2) {
		this.score2 = score2;
	}
	public String getScore3() {
		return score3;
	}
	public void setScore3(String score3) {
		this.score3 = score3;
	}
	public String getScore4() {
		return score4;
	}
	public void setScore4(String score4) {
		this.score4 = score4;
	}
	public String getScore5() {
		return score5;
	}
	public void setScore5(String score5) {
		this.score5 = score5;
	}
	public String getScore6() {
		return score6;
	}
	public void setScore6(String score6) {
		this.score6 = score6;
	}
	public String getScore7() {
		return score7;
	}
	public void setScore7(String score7) {
		this.score7 = score7;
	}
	public String getScore8() {
		return score8;
	}
	public void setScore8(String score8) {
		this.score8 = score8;
	}
	public String getScore9() {
		return score9;
	}
	public void setScore9(String score9) {
		this.score9 = score9;
	}
	public String getScore10() {
		return score10;
	}
	public void setScore10(String score10) {
		this.score10 = score10;
	}
	public String getScore11() {
		return score11;
	}
	public void setScore11(String score11) {
		this.score11 = score11;
	}
	public String getScore12() {
		return score12;
	}
	public void setScore12(String score12) {
		this.score12 = score12;
	}
	public String getScore13() {
		return score13;
	}
	public void setScore13(String score13) {
		this.score13 = score13;
	}
	public String getScore14() {
		return score14;
	}
	public void setScore14(String score14) {
		this.score14 = score14;
	}
	public String getScore15() {
		return score15;
	}
	public void setScore15(String score15) {
		this.score15 = score15;
	}
	public String getScore16() {
		return score16;
	}
	public void setScore16(String score16) {
		this.score16 = score16;
	}
	public String getScore17() {
		return score17;
	}
	public void setScore17(String score17) {
		this.score17 = score17;
	}
	public String getScore18() {
		return score18;
	}
	public void setScore18(String score18) {
		this.score18 = score18;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getFacility_opinion() {
		return facility_opinion;
	}
	public void setFacility_opinion(String facility_opinion) {
		this.facility_opinion = facility_opinion;
	}
	public String getOperation_opinion() {
		return operation_opinion;
	}
	public void setOperation_opinion(String operation_opinion) {
		this.operation_opinion = operation_opinion;
	}
	public List<String> getScoreList() {
		return scoreList;
	}
	public void setScoreList(List<String> scoreList) {
		this.scoreList = scoreList;
	}
	public List<String> getScoreString2List() {
		return scoreString2List;
	}
	public void setScoreString2List(String scoreString2List) {
		this.scoreString2List = Arrays.asList(scoreString2List.split(","));
	}
	public List<ServiceInsertDTO> getServiceDtoList() {
		return serviceDtoList;
	}
	public void setServiceDtoList(List<ServiceInsertDTO> serviceDtoList) {
		this.serviceDtoList = serviceDtoList;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getAvg() {
		return avg;
	}
	public void setAvg(String avg) {
		this.avg = avg;
	}

	
}
