package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.BasicInfoDTO;
import poly.dto.CounselInsertDTO;
import poly.dto.HealingInsertDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.UpdateListDTO;
import poly.dto.VibraInsertDTO;

@Mapper("UpdateMapper")
public interface IUpdateMapper {
	
	List<UpdateListDTO> getList(UpdateListDTO uDTO) throws Exception;
	
	void insertInfo(UpdateListDTO uDTO) throws Exception;

	int deleteForm(UpdateListDTO uDTO) throws Exception;

	BasicInfoDTO basicInfoUpdateForm(UpdateListDTO uDTO);

	List<ServiceInsertDTO> serviceUpdateForm(UpdateListDTO uDTO);

	List<ProgramInsertDTO> programUpdateForm(UpdateListDTO uDTO);

	List<HealingInsertDTO> healingUpdateForm(UpdateListDTO uDTO);

	List<PreventInsertDTO> preventUpdateForm(UpdateListDTO uDTO);

	List<CounselInsertDTO> counselUpdateForm(UpdateListDTO uDTO);

	List<HrvInsertDTO> hrvUpdateForm(UpdateListDTO uDTO);

	List<VibraInsertDTO> vibraUpdateForm(UpdateListDTO uDTO);

	List<BasicInfoDTO> getBasicInfoUpdate(BasicInfoDTO bDTO);

	List<UpdateListDTO> getAgencyList(UpdateListDTO uDTO);

	// 중간저장 서식 불러와서 수정 - update 쿼리 사용
	public int updateBasic(BasicInfoDTO bDTO) throws Exception;
}
