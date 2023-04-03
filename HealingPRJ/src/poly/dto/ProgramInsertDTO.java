package poly.dto;

import java.util.Arrays;
import java.util.List;

public class ProgramInsertDTO{

	private String agency;
	private String openday;
	private String eval_date;
	private String ptcProgram;
	private String sex;
	private String age;
	private String residence;
	private String job;
	private String program_name;
	private String teacher;
	private String place;
	private String type;
	private String bunya;
	private String score1;
	private String score2;
	private String score3;
	private String score4;
	private String score5;
	private String score6;
	private String score7;
	private String score8;
	private String score9;
	private String etc_opinion;
	private List<String> scoreList;
	private List<String> scoreString2List;
	private List<ProgramInsertDTO> programDtoList;
	
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
	public String getEval_date() {
		return eval_date;
	}
	public void setEval_date(String eval_date) {
		this.eval_date = eval_date;
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
	public String getProgram_name() {
		return program_name;
	}
	public void setProgram_name(String program_name) {
		this.program_name = program_name;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getBunya() {
		return bunya;
	}
	public void setBunya(String bunya) {
		this.bunya = bunya;
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
	public String getEtc_opinion() {
		return etc_opinion;
	}
	public void setEtc_opinion(String etc_opinion) {
		this.etc_opinion = etc_opinion;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<ProgramInsertDTO> getProgramDtoList() {
		return programDtoList;
	}
	public void setProgramDtoList(List<ProgramInsertDTO> programDtoList) {
		this.programDtoList = programDtoList;
	}
		
}
