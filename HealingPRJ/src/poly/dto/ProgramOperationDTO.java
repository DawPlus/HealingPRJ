package poly.dto;

import java.util.Arrays;
import java.util.List;

public class ProgramOperationDTO {
	
	private String agency;
	private String openday;
	private String endday;
	
//	단체별
	private String humanities;
	private String humanities_in;
	private String humanities_out;
	private String music;
	private String music_in;
	private String music_out;
	private String art;
	private String art_in;
	private String art_out;
	private String yoga;
	private String yoga_in;
	private String yoga_out;
	private String move;
	private String move_in;
	private String move_out;
	private String nature_healing;
	private String nature_healing_in;
	private String nature_healing_out;
	private String prevent_healing;
	private String prevent_healing_in;
	private String prevent_healing_out;
	private String forest_edu;
	private String forest_edu_in;
	private String forest_edu_out;
	private String forest_healing;
	private String forest_healing_in;
	private String forest_healing_out;
	private String event;
	private String event_in;
	private String event_out;
	private String residience;
	private String residience_in;
	private String residience_out;
	private String fresh;
	private String fresh_in;
	private String fresh_out;
	private String etc;
	private String etc_in;
	private String etc_out;
// 연월
	private String philosopy;
	private String philosopy_in;
	private String philosopy_out;
	private List<String> program_in_out2;
	
	public List<String> getProgram_in_out2() {
		return program_in_out2;
	}
	public void setProgram_in_out2(String program_in_out2) {
		this.program_in_out2 = Arrays.asList(program_in_out2.split(","));
	}
	
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
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getHumanities() {
		return humanities;
	}
	public void setHumanities(String humanities) {
		this.humanities = humanities;
	}
	public String getHumanities_in() {
		return humanities_in;
	}
	public void setHumanities_in(String humanities_in) {
		this.humanities_in = humanities_in;
	}
	public String getHumanities_out() {
		return humanities_out;
	}
	public void setHumanities_out(String humanities_out) {
		this.humanities_out = humanities_out;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getMusic_in() {
		return music_in;
	}
	public void setMusic_in(String music_in) {
		this.music_in = music_in;
	}
	public String getMusic_out() {
		return music_out;
	}
	public void setMusic_out(String music_out) {
		this.music_out = music_out;
	}
	public String getArt() {
		return art;
	}
	public void setArt(String art) {
		this.art = art;
	}
	public String getArt_in() {
		return art_in;
	}
	public void setArt_in(String art_in) {
		this.art_in = art_in;
	}
	public String getArt_out() {
		return art_out;
	}
	public void setArt_out(String art_out) {
		this.art_out = art_out;
	}
	public String getYoga() {
		return yoga;
	}
	public void setYoga(String yoga) {
		this.yoga = yoga;
	}
	public String getYoga_in() {
		return yoga_in;
	}
	public void setYoga_in(String yoga_in) {
		this.yoga_in = yoga_in;
	}
	public String getYoga_out() {
		return yoga_out;
	}
	public void setYoga_out(String yoga_out) {
		this.yoga_out = yoga_out;
	}
	public String getMove() {
		return move;
	}
	public void setMove(String move) {
		this.move = move;
	}
	public String getMove_in() {
		return move_in;
	}
	public void setMove_in(String move_in) {
		this.move_in = move_in;
	}
	public String getMove_out() {
		return move_out;
	}
	public void setMove_out(String move_out) {
		this.move_out = move_out;
	}
	public String getNature_healing() {
		return nature_healing;
	}
	public void setNature_healing(String nature_healing) {
		this.nature_healing = nature_healing;
	}
	public String getNature_healing_in() {
		return nature_healing_in;
	}
	public void setNature_healing_in(String nature_healing_in) {
		this.nature_healing_in = nature_healing_in;
	}
	public String getNature_healing_out() {
		return nature_healing_out;
	}
	public void setNature_healing_out(String nature_healing_out) {
		this.nature_healing_out = nature_healing_out;
	}
	public String getPrevent_healing() {
		return prevent_healing;
	}
	public void setPrevent_healing(String prevent_healing) {
		this.prevent_healing = prevent_healing;
	}
	public String getPrevent_healing_in() {
		return prevent_healing_in;
	}
	public void setPrevent_healing_in(String prevent_healing_in) {
		this.prevent_healing_in = prevent_healing_in;
	}
	public String getPrevent_healing_out() {
		return prevent_healing_out;
	}
	public void setPrevent_healing_out(String prevent_healing_out) {
		this.prevent_healing_out = prevent_healing_out;
	}
	public String getForest_edu() {
		return forest_edu;
	}
	public void setForest_edu(String forest_edu) {
		this.forest_edu = forest_edu;
	}
	public String getForest_edu_in() {
		return forest_edu_in;
	}
	public void setForest_edu_in(String forest_edu_in) {
		this.forest_edu_in = forest_edu_in;
	}
	public String getForest_edu_out() {
		return forest_edu_out;
	}
	public void setForest_edu_out(String forest_edu_out) {
		this.forest_edu_out = forest_edu_out;
	}
	public String getForest_healing() {
		return forest_healing;
	}
	public void setForest_healing(String forest_healing) {
		this.forest_healing = forest_healing;
	}
	public String getForest_healing_in() {
		return forest_healing_in;
	}
	public void setForest_healing_in(String forest_healing_in) {
		this.forest_healing_in = forest_healing_in;
	}
	public String getForest_healing_out() {
		return forest_healing_out;
	}
	public void setForest_healing_out(String forest_healing_out) {
		this.forest_healing_out = forest_healing_out;
	}
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getEvent_in() {
		return event_in;
	}
	public void setEvent_in(String event_in) {
		this.event_in = event_in;
	}
	public String getEvent_out() {
		return event_out;
	}
	public void setEvent_out(String event_out) {
		this.event_out = event_out;
	}
	public String getResidience() {
		return residience;
	}
	public void setResidience(String residience) {
		this.residience = residience;
	}
	public String getResidience_in() {
		return residience_in;
	}
	public void setResidience_in(String residience_in) {
		this.residience_in = residience_in;
	}
	public String getResidience_out() {
		return residience_out;
	}
	public void setResidience_out(String residience_out) {
		this.residience_out = residience_out;
	}
	public String getFresh() {
		return fresh;
	}
	public void setFresh(String fresh) {
		this.fresh = fresh;
	}
	public String getFresh_in() {
		return fresh_in;
	}
	public void setFresh_in(String fresh_in) {
		this.fresh_in = fresh_in;
	}
	public String getFresh_out() {
		return fresh_out;
	}
	public void setFresh_out(String fresh_out) {
		this.fresh_out = fresh_out;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getEtc_in() {
		return etc_in;
	}
	public void setEtc_in(String etc_in) {
		this.etc_in = etc_in;
	}
	public String getEtc_out() {
		return etc_out;
	}
	public void setEtc_out(String etc_out) {
		this.etc_out = etc_out;
	}
	public String getPhilosopy() {
		return philosopy;
	}
	public void setPhilosopy(String philosopy) {
		this.philosopy = philosopy;
	}
	public String getPhilosopy_in() {
		return philosopy_in;
	}
	public void setPhilosopy_in(String philosopy_in) {
		this.philosopy_in = philosopy_in;
	}
	public String getPhilosopy_out() {
		return philosopy_out;
	}
	public void setPhilosopy_out(String philosopy_out) {
		this.philosopy_out = philosopy_out;
	}
	
	
	
}