package poly.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ExpenseDTO {

	private String expense_seq;
	private String basic_info_seq;
	private String openday;
	private String endday;
	private String agency;
	private String type;
	private String price;
	private String detail;
	private String note;
	private List<String> price1;
	private List<String> detail1;
	private List<String> note1;
	// 기본생성자 디폴트 값 생성
	public ExpenseDTO() {
		expense_seq = "";
		basic_info_seq = "";
		openday = "";
		agency = "";
		type = "";
		price = "";
		detail = "";
		note = "";
		price1 = new ArrayList<String>();
		detail1 = new ArrayList<String>();
		note1 = new ArrayList<String>();
	}
	
	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}

	public String getExpense_seq() {
		return expense_seq;
	}
	public void setExpense_seq(String expense_seq) {
		this.expense_seq = expense_seq;
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
	public String getType() {
		return type;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPrice() {
		return price;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail.replaceAll(",", "& #44;");
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note.replaceAll(",", "& #44;");
	}
	public List<String> getPrice1() {
		return price1;
	}
	public void setPrice1(String price1) {
		this.price1 = Arrays.asList(price1.split(","));
	}
	public List<String> getDetail1() {
		return detail1;
	}
	public void setDetail1(String detail1) {
		this.detail1 = Arrays.asList(detail1.split(","));
	}
	public List<String> getNote1() {
		return note1;
	}
	public void setNote1(String note1) {
		this.note1 = Arrays.asList(note1.split(","));
	}
	
	
}
