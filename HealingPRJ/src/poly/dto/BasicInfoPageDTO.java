package poly.dto;

public class BasicInfoPageDTO {
	private String support;
	private String income_type;
	private String part_type;
	private String biz_purpose;
	private String program_in_out;
	private String service_type;
	private String age_type;
	
	public String getSupport() {
		return support;
	}
	public void setSupport(String support) {
		this.support = support;
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
	public String getBiz_purpose() {
		return biz_purpose;
	}
	public void setBiz_purpose(String biz_purpose) {
		this.biz_purpose = biz_purpose;
	}
	public String getProgram_in_out() {
		return program_in_out;
	}
	public void setProgram_in_out(String program_in_out) {
		this.program_in_out = program_in_out;
	}
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public String getAge_type() {
		return age_type;
	}
	public void setAge_type(String age_type) {
		this.age_type = age_type;
	}
	@Override
	public String toString() {
		return "BasicInfoPageDTO [support=" + support + ", income_type=" + income_type + ", part_type=" + part_type
				+ ", biz_purpose=" + biz_purpose + ", program_in_out=" + program_in_out + ", service_type="
				+ service_type + ", age_type=" + age_type + "]";
	}
	
	
}