package poly.service;

import java.util.List;

import poly.dto.HealingInsertDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.CounselInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.VibraInsertDTO;

public interface IInsertDataService {
	public int serviceInsertData(ServiceInsertDTO serviceDtoList) throws Exception;

	public int programInsertData(ProgramInsertDTO programDtoList) throws Exception;
	
	public int preventInsertData(PreventInsertDTO preventDtoList) throws Exception;
	
	public int healingInsertData(HealingInsertDTO healingDtoList) throws Exception;
	
	public int counselInsertData(CounselInsertDTO counselDtoList) throws Exception;
	
	public int hrvInsertData(HrvInsertDTO hrvDtoList) throws Exception;

	public int hasAgencyStartDate(HealingInsertDTO hiDTO) throws Exception;
	
	public List<HealingInsertDTO> getPreviousHealingList(HealingInsertDTO hiDTO) throws Exception;
	
	public List<PreventInsertDTO> getPreviousPreventList(PreventInsertDTO piDTO) throws Exception;
	
	public List<CounselInsertDTO> getPreviousCounselList(CounselInsertDTO ciDTO) throws Exception;
	
	public List<ProgramInsertDTO> getPreviousProgramList(ProgramInsertDTO priDTO) throws Exception;
	
	public List<ServiceInsertDTO> getPreviousServiceList(ServiceInsertDTO siDTO) throws Exception;
	
	public List<HrvInsertDTO> getPreviousHrvList(HrvInsertDTO hrviDTO) throws Exception;
	
	public List<VibraInsertDTO> getPreviousVibraList(VibraInsertDTO viDTO) throws Exception;

	public int vibraInsertData(VibraInsertDTO vibraDtoList) throws Exception;

	public int getProgramCount(ProgramInsertDTO priDTO) throws Exception;

}
