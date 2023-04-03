package poly.dto;

import java.util.Arrays;
import java.util.List;

public class YearResultDTO {
	private String sum;
	private String openday;
	private String endday;
//	참가자 유형
	private String part_kid;
	private String part_boy;
	private String part_adult;
	private String part_old;
	private String part_handcap;
	private String part_lowmoney;
	private String part_family;
	private String part_teacher;
	private String part_etc;
	private String part_addict;
//	사업구분
	private String part_man;
	private String part_woman;
	private String lead_man;
	private String lead_woman;
	private String days_to_stay;
//	참여인원
	private String biz_benefit;
	private String biz_green;
	private String biz_voucher;
	private String biz_teacher;
	private String biz_society;
	private String biz_etc;
//	지원사항
	private List<String> support1;
	
// 서비스 유형
	private String forest_edu;
	private String forest_healing;
	private String addict_healing;
	private String addict_prevent;
	private String healing;
	private String ser_etc;
	
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getOpenday() {
		return openday;
	}
	public void setOpenday(String openday) {
		this.openday = openday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getPart_kid() {
		return part_kid;
	}
	public void setPart_kid(String part_kid) {
		this.part_kid = part_kid;
	}
	public String getPart_boy() {
		return part_boy;
	}
	public void setPart_boy(String part_boy) {
		this.part_boy = part_boy;
	}
	public String getPart_adult() {
		return part_adult;
	}
	public void setPart_adult(String part_adult) {
		this.part_adult = part_adult;
	}
	public String getPart_old() {
		return part_old;
	}
	public void setPart_old(String part_old) {
		this.part_old = part_old;
	}
	public String getPart_handcap() {
		return part_handcap;
	}
	public void setPart_handcap(String part_handcap) {
		this.part_handcap = part_handcap;
	}
	public String getPart_lowmoney() {
		return part_lowmoney;
	}
	public void setPart_lowmoney(String part_lowmoney) {
		this.part_lowmoney = part_lowmoney;
	}
	public String getPart_family() {
		return part_family;
	}
	public void setPart_family(String part_family) {
		this.part_family = part_family;
	}
	
	public String getPart_teacher() {
		return part_teacher;
	}
	public void setPart_teacher(String part_teacher) {
		this.part_teacher = part_teacher;
	}
	public String getPart_etc() {
		return part_etc;
	}
	public void setPart_etc(String part_etc) {
		this.part_etc = part_etc;
	}
	public String getPart_addict() {
		return part_addict;
	}
	public void setPart_addict(String part_addict) {
		this.part_addict = part_addict;
	}
	public String getPart_man() {
		return part_man;
	}
	public void setPart_man(String part_man) {
		this.part_man = part_man;
	}
	public String getPart_woman() {
		return part_woman;
	}
	public void setPart_woman(String part_woman) {
		this.part_woman = part_woman;
	}
	public String getLead_man() {
		return lead_man;
	}
	public void setLead_man(String lead_man) {
		this.lead_man = lead_man;
	}
	public String getLead_woman() {
		return lead_woman;
	}
	public void setLead_woman(String lead_woman) {
		this.lead_woman = lead_woman;
	}
	public String getDays_to_stay() {
		return days_to_stay;
	}
	public void setDays_to_stay(String days_to_stay) {
		this.days_to_stay = days_to_stay;
	}
	
	public String getBiz_benefit() {
		return biz_benefit;
	}
	public void setBiz_benefit(String biz_benefit) {
		this.biz_benefit = biz_benefit;
	}
	public String getBiz_green() {
		return biz_green;
	}
	public void setBiz_green(String biz_green) {
		this.biz_green = biz_green;
	}
	public String getBiz_voucher() {
		return biz_voucher;
	}
	public void setBiz_voucher(String biz_voucher) {
		this.biz_voucher = biz_voucher;
	}
	public String getBiz_teacher() {
		return biz_teacher;
	}
	public void setBiz_teacher(String biz_teacher) {
		this.biz_teacher = biz_teacher;
	}
	public String getBiz_society() {
		return biz_society;
	}
	public void setBiz_society(String biz_society) {
		this.biz_society = biz_society;
	}
	public String getBiz_etc() {
		return biz_etc;
	}
	public void setBiz_etc(String biz_etc) {
		this.biz_etc = biz_etc;
	}
	public String getForest_edu() {
		return forest_edu;
	}
	public void setForest_edu(String forest_edu) {
		this.forest_edu = forest_edu;
	}
	public String getForest_healing() {
		return forest_healing;
	}
	public void setForest_healing(String forest_healing) {
		this.forest_healing = forest_healing;
	}
	public String getAddict_healing() {
		return addict_healing;
	}
	public void setAddict_healing(String addict_healing) {
		this.addict_healing = addict_healing;
	}
	public String getAddict_prevent() {
		return addict_prevent;
	}
	public void setAddict_prevent(String addict_prevent) {
		this.addict_prevent = addict_prevent;
	}
	public String getHealing() {
		return healing;
	}
	public void setHealing(String healing) {
		this.healing = healing;
	}
	public String getSer_etc() {
		return ser_etc;
	}
	public void setSer_etc(String ser_etc) {
		this.ser_etc = ser_etc;
	}
	public List<String> getSupport1() {
		return support1;
	}
	public void setSupport1(String support1) {
		this.support1 = Arrays.asList(support1.split(","));
	}

	
	
}