package poly.dto;

public class HistoryDTO {
	
	private String reg_id;
	private String date;
	private String time;
	private String seq;
	private String description;
	@Override
	public String toString() {
		return "HistoryDTO [reg_id=" + reg_id + ", date=" + date + ", time=" + time + ", seq=" + seq + ", description="
				+ description + "]";
	}
	
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
