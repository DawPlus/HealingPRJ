package poly.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class BasicInfoDTO {
	private String basic_info_seq;
	private String openday;
	private String agency;
	private String om;
	private String endday;
	private String days_to_stay;
	private String residence;
	private String part_man_cnt;
	private String part_woman_cnt;
	private String lead_man_cnt;
	private String lead_woman_cnt;
	private String support;
	private List<String> support1;
	private String income_type;
	private String part_type;
	private String age_type;
	private String biz_purpose;
	private String service_type;
	private List<ProgramInOutDTO> program_in_out;
	private List<String> program_in_out2;
	private String room_part_people;
	private String room_part_room;
	private String room_lead_people;
	private String room_lead_room;
	private String room_etc_people;
	private String room_etc_room;
	private String meal_type;
	private String meal_part;
	private String meal_lead;
	private String meal_etc;
	private String program_opinion;
	private String service_opinion;
	private String overall_opinion;
	private List<ExpenseDTO> expList;
	private List<IncomeDTO> incList;
	private String progress_state;
	private String sum;
	private String count;
	private String reg_id;
	
	// 기본생성자 디폴트 값 생성
	public BasicInfoDTO() {
		basic_info_seq = "";
		openday = "";
		agency = "";
		om = "";
		endday = "";
		days_to_stay = "";
		residence = "";
		part_man_cnt = "";
		part_woman_cnt = "";
		lead_man_cnt = "";
		lead_woman_cnt = "";
		support = "";
		income_type = "";
		part_type = "";
		age_type = "";
		biz_purpose = "";
		service_type = "";
		program_in_out = new ArrayList<ProgramInOutDTO>();
		program_in_out2 = new ArrayList<String>();
		room_part_people = "";
		room_part_room = "";
		room_lead_people = "";
		room_lead_room = "";
		room_etc_people = "";
		room_etc_room = "";
		meal_type = "";
		meal_part = "";
		meal_lead = "";
		meal_etc = "";
		program_opinion = "";
		service_opinion = "";
		overall_opinion = "";
		expList = new ArrayList<ExpenseDTO>();
		incList = new ArrayList<IncomeDTO>();
		progress_state = "";
		sum = "";
		count = "";
		reg_id = "";
	}
	
	public List<String> getProgram_in_out2() {
		return program_in_out2;
	}

	public void setProgram_in_out2(String program_in_out2) {
		this.program_in_out2 = Arrays.asList(program_in_out2.split(","));
	}

	public String getBasic_info_seq() {
		return basic_info_seq;
	}
	public void setBasic_info_seq(String basic_info_seq) {
		this.basic_info_seq = basic_info_seq;
	}
	public String getOpenday() {
		return openday;
	}
	public void setOpenday(String openday) {
		this.openday = openday;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public String getOm() {
		return om;
	}
	public void setOm(String om) {
		this.om = om;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getDays_to_stay() {
		return days_to_stay;
	}
	public void setDays_to_stay(String days_to_stay) {
		this.days_to_stay = days_to_stay;
	}
	public String getResidence() {
		return residence;
	}
	public void setResidence(String residence) {
		this.residence = residence;
	}
	public String getPart_man_cnt() {
		return part_man_cnt;
	}
	public void setPart_man_cnt(String part_man_cnt) {
		this.part_man_cnt = part_man_cnt;
	}
	public String getPart_woman_cnt() {
		return part_woman_cnt;
	}
	public void setPart_woman_cnt(String part_woman_cnt) {
		this.part_woman_cnt = part_woman_cnt;
	}
	public String getLead_man_cnt() {
		return lead_man_cnt;
	}
	public void setLead_man_cnt(String lead_man_cnt) {
		this.lead_man_cnt = lead_man_cnt;
	}
	public String getLead_woman_cnt() {
		return lead_woman_cnt;
	}
	public void setLead_woman_cnt(String lead_woman_cnt) {
		this.lead_woman_cnt = lead_woman_cnt;
	}
	
	public String getSupport() {
		return support;
	}
	public void setSupport(String support) {
		this.support = support;
	}
	
	public List<String> getSupport1() {
		return support1;
	}
	public void setSupport1(String support1) {
		this.support1 = Arrays.asList(support1.split(","));
	}
	
	public String getIncome_type() {
		return income_type;
	}
	public void setIncome_type(String income_type) {
		this.income_type = income_type;
	}
	public String getPart_type() {
		return part_type;
	}
	public void setPart_type(String part_type) {
		this.part_type = part_type;
	}
	
	public String getAge_type() {
		return age_type;
	}
	public void setAge_type(String age_type) {
		this.age_type = age_type;
	}
	public String getBiz_purpose() {
		return biz_purpose;
	}
	public void setBiz_purpose(String biz_purpose) {
		this.biz_purpose = biz_purpose;
	}
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public List<ProgramInOutDTO> getProgram_in_out() {
		return program_in_out;
	}
	public void setProgram_in_out(List<ProgramInOutDTO> program_in_out) {
		this.program_in_out = program_in_out;
	}
	public String getRoom_part_people() {
		return room_part_people;
	}
	public void setRoom_part_people(String room_part_people) {
		this.room_part_people = room_part_people;
	}
	public String getRoom_part_room() {
		return room_part_room;
	}
	public void setRoom_part_room(String room_part_room) {
		this.room_part_room = room_part_room;
	}
	public String getRoom_lead_people() {
		return room_lead_people;
	}
	public void setRoom_lead_people(String room_lead_people) {
		this.room_lead_people = room_lead_people;
	}
	public String getRoom_lead_room() {
		return room_lead_room;
	}
	public void setRoom_lead_room(String room_lead_room) {
		this.room_lead_room = room_lead_room;
	}
	public String getRoom_etc_people() {
		return room_etc_people;
	}
	public void setRoom_etc_people(String room_etc_people) {
		this.room_etc_people = room_etc_people;
	}
	public String getRoom_etc_room() {
		return room_etc_room;
	}
	public void setRoom_etc_room(String room_etc_room) {
		this.room_etc_room = room_etc_room;
	}
	public String getMeal_type() {
		return meal_type;
	}
	public void setMeal_type(String meal_type) {
		this.meal_type = meal_type;
	}
	public String getMeal_part() {
		return meal_part;
	}
	public void setMeal_part(String meal_part) {
		this.meal_part = meal_part;
	}
	public String getMeal_lead() {
		return meal_lead;
	}
	public void setMeal_lead(String meal_lead) {
		this.meal_lead = meal_lead;
	}
	public String getMeal_etc() {
		return meal_etc;
	}
	public void setMeal_etc(String meal_etc) {
		this.meal_etc = meal_etc;
	}
	public String getProgram_opinion() {
		return program_opinion;
	}
	public void setProgram_opinion(String program_opinion) {
		this.program_opinion = program_opinion;
	}
	public String getService_opinion() {
		return service_opinion;
	}
	public void setService_opinion(String service_opinion) {
		this.service_opinion = service_opinion;
	}
	public String getOverall_opinion() {
		return overall_opinion;
	}
	public void setOverall_opinion(String overall_opinion) {
		this.overall_opinion = overall_opinion;
	}
	
	public List<ExpenseDTO> getExpList() {
		return expList;
	}
	public void setExpList(List<ExpenseDTO> expList) {
		this.expList = expList;
	}
	public List<IncomeDTO> getIncList() {
		return incList;
	}
	public void setIncList(List<IncomeDTO> incList) {
		this.incList = incList;
	}
	public String getProgress_state() {
		return progress_state;
	}
	public void setProgress_state(String progress_state) {
		this.progress_state = progress_state;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	//DTO 전체 출력 메소드
	public void getAll(BasicInfoDTO bDTO) {
	}
	
}