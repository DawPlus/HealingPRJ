package poly.dto;

import java.util.List;

public class StudentDTO {
    String id; // 번호
    String name; // 이름
    String sex; // 성별
    String age; // 연령
    String residence; // 거주지
    String job; // 직업
    String programs_count; // 참여프로그램(당일형, 1박2일, 2박3일)
    String stress; // 과거 스트레스 경험
    List<String> eval; // 평가 문항 
    
    
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
	public String getPrograms_count() {
		return programs_count;
	}
	public void setPrograms_count(String programs_count) {
		this.programs_count = programs_count;
	}
	public String getStress() {
		return stress;
	}
	public void setStress(String stress) {
		this.stress = stress;
	}
	public List<String> getEval() {
		return eval;
	}
	public void setEval(List<String> eval) {
		this.eval = eval;
	}
	
   
}

