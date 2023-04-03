package poly.dto;

import java.util.Arrays;
import java.util.List;

public class HrvInsertDTO {
	private String agency;
	private String equipment;
	private String id;
	private String name;
	private String jumin;
	private String sex;
	private String age;
	private String date;
	private String date_1;
	private String pv;
	private String num1;
	private String num2;
	private String num3;
	private String num4;
	private String num5;
	private String num6;
	private String num7;
	private String num8;
	private String num9;
	private String num10;
	private List<String> scoreList;
	private List<String> scoreString2List;
	private List<String> scoreString2;
	private List<HrvInsertDTO> hrvDtoList;
	
	public String getNum1() {
		return num1;
	}
	public void setNum1(String num1) {
		this.num1 = num1;
	}
	public String getNum2() {
		return num2;
	}
	public void setNum2(String num2) {
		this.num2 = num2;
	}
	public String getNum4() {
		return num4;
	}
	public void setNum4(String num4) {
		this.num4 = num4;
	}
	public String getNum5() {
		return num5;
	}
	public void setNum5(String num5) {
		this.num5 = num5;
	}
	
	public String getNum3() {
		return num3;
	}
	public void setNum3(String num3) {
		this.num3 = num3;
	}
	public String getNum6() {
		return num6;
	}
	public void setNum6(String num6) {
		this.num6 = num6;
	}
	public String getNum7() {
		return num7;
	}
	public void setNum7(String num7) {
		this.num7 = num7;
	}
	public String getNum8() {
		return num8;
	}
	public void setNum8(String num8) {
		this.num8 = num8;
	}
	public String getNum9() {
		return num9;
	}
	public void setNum9(String num9) {
		this.num9 = num9;
	}
	public String getNum10() {
		return num10;
	}
	public void setNum10(String num10) {
		this.num10 = num10;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPv() {
		return pv;
	}
	public void setPv(String pv) {
		this.pv = pv;
	}

	public String getDate_1() {
		return date_1;
	}
	public void setDate_1(String date_1) {
		this.date_1 = date_1;
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
	public List<HrvInsertDTO> getHrvDtoList() {
		return hrvDtoList;
	}
	public void setHrvDtoList(List<HrvInsertDTO> hrvDtoList) {
		this.hrvDtoList = hrvDtoList;
	}
	
	public List<String> getScoreString2() {
		return scoreString2;
	}
	public void setScoreString2(String scoreString2) {
		this.scoreString2 = Arrays.asList(scoreString2.split(","));
	}
	
	
}
