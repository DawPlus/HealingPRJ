package poly.dto;

import java.util.Arrays;
import java.util.List;

public class VibraInsertDTO {

	private String agency;
	private String equipment;
	private String id;
	private String name;
	private String jumin;
	private String sex;
	private String age;
	private String date;
	private String pv;
	private List<String> scoreList;
	private List<String> scoreString2List;
	private List<VibraInsertDTO> vibraDtoList;
	
	public List<String> getScoreString2List() {
		return scoreString2List;
	}
	public void setScoreString2List(String scoreString2List) {
		this.scoreString2List = Arrays.asList(scoreString2List.split(","));
	}
	public String getPv() {
		return pv;
	}
	public void setPv(String pv) {
		this.pv = pv;
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
	public List<String> getScoreList() {
		return scoreList;
	}
	public void setScoreList(List<String> scoreList) {
		this.scoreList = scoreList;
	}
	public List<VibraInsertDTO> getVibraDtoList() {
		return vibraDtoList;
	}
	public void setVibraDtoList(List<VibraInsertDTO> vibraDtoList) {
		this.vibraDtoList = vibraDtoList;
	}
	
}
