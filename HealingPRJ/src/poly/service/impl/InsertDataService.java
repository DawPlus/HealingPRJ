package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.CounselInsertDTO;
import poly.dto.HealingInsertDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.UpdateListDTO;
import poly.dto.VibraInsertDTO;
import poly.persistance.mapper.IInsertDataMapper;
import poly.persistance.mapper.IUpdateMapper;
import poly.service.IInsertDataService;
import poly.service.comm.AbstractService;

@Service("InsertDataService")
public class InsertDataService extends AbstractService implements IInsertDataService {

	@Resource(name = "InsertDataMapper")
	private IInsertDataMapper insertDataMapper;

	@Resource(name = "UpdateMapper")
	private IUpdateMapper updateMapper;

	@Override
	public int serviceInsertData(ServiceInsertDTO serviceDtoList) throws Exception {
		log.info(this.getClass().getName() + "serviceInsertData Start !!");

		ServiceInsertDTO siDTO = new ServiceInsertDTO();
		siDTO.setAgency(serviceDtoList.getServiceDtoList().get(0).getAgency());
		siDTO.setOpenday(serviceDtoList.getServiceDtoList().get(0).getOpenday());
		siDTO.setEval_date(serviceDtoList.getServiceDtoList().get(0).getEval_date());
		insertDataMapper.deleteServiceRow(siDTO);

		// 업데이트하기 위한 리스트 넣기
		UpdateListDTO uDTO = new UpdateListDTO();
		uDTO.setAgency(siDTO.getAgency());
		uDTO.setOpenday(siDTO.getOpenday());

		int result = insertDataMapper.serviceInsertData(serviceDtoList);
		log.info(this.getClass().getName() + "serviceInsertData End !!");
		return result;
	}

	@Override
	public int programInsertData(ProgramInsertDTO programDtoList) throws Exception {
		log.info(this.getClass().getName() + "programInsertData Start !!");

		ProgramInsertDTO pDTO = new ProgramInsertDTO();
		pDTO.setAgency(programDtoList.getProgramDtoList().get(0).getAgency());
		pDTO.setOpenday(programDtoList.getProgramDtoList().get(0).getOpenday());
		pDTO.setEval_date(programDtoList.getProgramDtoList().get(0).getEval_date());
		pDTO.setProgram_name(programDtoList.getProgramDtoList().get(0).getProgram_name());
		pDTO.setBunya(programDtoList.getProgramDtoList().get(0).getBunya());
		insertDataMapper.deleteProgramRow(pDTO);
		int result = insertDataMapper.programInsertData(programDtoList);
		log.info(this.getClass().getName() + "programInsertData End !!");
		return result;
	}

	@Override
	public int preventInsertData(PreventInsertDTO preventDtoList) throws Exception {
		log.info(this.getClass().getName() + "preventInsertData Start !!");

		PreventInsertDTO piDTO = new PreventInsertDTO();
		piDTO.setAgency(preventDtoList.getPreventDtoList().get(0).getAgency());
		piDTO.setOpenday(preventDtoList.getPreventDtoList().get(0).getOpenday());
		piDTO.setPv(preventDtoList.getPreventDtoList().get(0).getPv());
		insertDataMapper.deletePreventRow(piDTO);
		int result = insertDataMapper.preventInsertData(preventDtoList);
		log.info(this.getClass().getName() + "preventInsertData End !!");
		return result;
	}

	@Override
	public int healingInsertData(HealingInsertDTO healingDtoList) throws Exception {
		log.info(this.getClass().getName() + "healingInsertData Start !!");

		HealingInsertDTO hiDTO = new HealingInsertDTO();
		hiDTO.setAgency(healingDtoList.getHealingDtoList().get(0).getAgency());
		hiDTO.setOpenday(healingDtoList.getHealingDtoList().get(0).getOpenday());
		hiDTO.setPv(healingDtoList.getHealingDtoList().get(0).getPv());
		insertDataMapper.deleteHealingRow(hiDTO);
		int result = insertDataMapper.healingInsertData(healingDtoList);
		log.info(this.getClass().getName() + "healingInsertData End !!");
		return result;
	}

	@Override
	public int counselInsertData(CounselInsertDTO counselDtoList) throws Exception {
		log.info(this.getClass().getName() + ".counselInsertData Start !!");

		CounselInsertDTO ciDTO = new CounselInsertDTO();
		ciDTO.setAgency(counselDtoList.getCounselDtoList().get(0).getAgency());
		ciDTO.setOpenday(counselDtoList.getCounselDtoList().get(0).getOpenday());
		ciDTO.setPv(counselDtoList.getCounselDtoList().get(0).getPv());
		insertDataMapper.deleteCounselRow(ciDTO);
		int result = insertDataMapper.counselInsertData(counselDtoList);
		log.info(this.getClass().getName() + ".counselInsertData End !!");
		return result;
	}

	@Override
	public int hrvInsertData(HrvInsertDTO hrvDtoList) throws Exception {
		log.info(this.getClass().getName() + ".hrvInsertData Start !!");

		HrvInsertDTO hrviDTO = new HrvInsertDTO();
		hrviDTO.setAgency(hrvDtoList.getHrvDtoList().get(0).getAgency());
		hrviDTO.setPv(hrvDtoList.getHrvDtoList().get(0).getPv());
		insertDataMapper.deleteHrvRow(hrviDTO);
		int result = insertDataMapper.hrvInsertData(hrvDtoList);
		log.info(this.getClass().getName() + ".hrvInsertData End !!");
		return result;
	}

	@Override
	public int hasAgencyStartDate(HealingInsertDTO hiDTO) throws Exception {
		log.info(this.getClass().getName() + ".hasAgencyStartDate Service Start !!");
		int result = insertDataMapper.hasAgencyStartDate(hiDTO);
		log.info(this.getClass().getName() + ".hasAgencyStartDate Service End !!");
		return result;
	}

	@Override
	public List<HealingInsertDTO> getPreviousHealingList(HealingInsertDTO hiDTO) throws Exception {
		log.info(this.getClass().getName() + ".getPreviousHealingList Service Start !!");
		List<HealingInsertDTO> hList = insertDataMapper.getPreviousHealingList(hiDTO);
		log.info(this.getClass().getName() + ".getPreviousHealingList Service End !!");
		return hList;
	}

	@Override
	public List<PreventInsertDTO> getPreviousPreventList(PreventInsertDTO piDTO) throws Exception {
		log.info(this.getClass().getName() + ".getPreviousPreventList Service Start !!");
		List<PreventInsertDTO> pList = insertDataMapper.getPreviousPreventList(piDTO);
		log.info(this.getClass().getName() + ".getPreviousPreventList Service End !!");
		return pList;
	}

	@Override
	public List<CounselInsertDTO> getPreviousCounselList(CounselInsertDTO riDTO) throws Exception {
		log.info(this.getClass().getName() + ".getPreviousCounselList Service Start !!");
		List<CounselInsertDTO> rList = insertDataMapper.getPreviousCounselList(riDTO);
		log.info(this.getClass().getName() + ".getPreviousCounselList Service End !!");
		return rList;
	}

	@Override
	public List<ProgramInsertDTO> getPreviousProgramList(ProgramInsertDTO priDTO) throws Exception {
		log.info(this.getClass().getName() + ".getPreviousProgramList Service Start !!");
		List<ProgramInsertDTO> prList = insertDataMapper.getPreviousProgramList(priDTO);
		log.info(this.getClass().getName() + ".getPreviousProgramList Service End !!");
		return prList;
	}

	@Override
	public List<ServiceInsertDTO> getPreviousServiceList(ServiceInsertDTO siDTO) throws Exception {
		log.info(this.getClass().getName() + ".getPreviousServiceList Service Start !!");
		List<ServiceInsertDTO> sList = insertDataMapper.getPreviousServiceList(siDTO);
		log.info(this.getClass().getName() + ".getPreviousServiceList Service End !!");
		return sList;
	}

	@Override
	public List<HrvInsertDTO> getPreviousHrvList(HrvInsertDTO hrviDTO) throws Exception {
		log.info(this.getClass().getName() + ".getPreviousHrvList Service Start !!");
		List<HrvInsertDTO> hrvList = insertDataMapper.getPreviousHrvList(hrviDTO);
		log.info(this.getClass().getName() + ".getPreviousHrvList Service End !!");
		return hrvList;
	}

	@Override
	public List<VibraInsertDTO> getPreviousVibraList(VibraInsertDTO viDTO) throws Exception {
		log.info(this.getClass().getName() + ".getPreviousVibraList Service Start !!");
		List<VibraInsertDTO> vList = insertDataMapper.getPreviousVibraList(viDTO);
		log.info(this.getClass().getName() + ".getPreviousVibraList Service End !!");
		return vList;
	}

	@Override
	public int vibraInsertData(VibraInsertDTO vibraDtoList) throws Exception {
		log.info(this.getClass().getName() + ".vibraInsertData Start !!");

		VibraInsertDTO viDTO = new VibraInsertDTO();
		viDTO.setAgency(vibraDtoList.getVibraDtoList().get(0).getAgency());
		viDTO.setPv(vibraDtoList.getVibraDtoList().get(0).getPv());
		insertDataMapper.deleteVibraRow(viDTO);
		int result = insertDataMapper.vibraInsertData(vibraDtoList);
		log.info(this.getClass().getName() + ".vibraInsertData End !!");
		return result;
	}

	// 프로그램은 최대 7개까지만 가능함 - 기관명 + 시작일자로 프로그램 개수 가져오기
	@Override
	public int getProgramCount(ProgramInsertDTO priDTO) throws Exception {
		return insertDataMapper.getProgramCount(priDTO);
	}

}
