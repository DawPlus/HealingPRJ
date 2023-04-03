package poly.service;

import java.util.List;

import poly.dto.BasicInfoDTO;
import poly.dto.CounselInsertDTO;
import poly.dto.HealingInsertDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.UpdateListDTO;
import poly.dto.VibraInsertDTO;

public interface IUpdateService {
	
	public List<UpdateListDTO> getList(UpdateListDTO uDTO) throws Exception;

	public int deleteForm(UpdateListDTO uDTO) throws Exception;

	public BasicInfoDTO basicInfoUpdateForm(UpdateListDTO uDTO) throws Exception; 
	
	public List<ServiceInsertDTO> serviceUpdateForm(UpdateListDTO uDTO) throws Exception; 
	
	public List<ProgramInsertDTO> programUpdateForm(UpdateListDTO uDTO) throws Exception; 
	
	public List<HealingInsertDTO> healingUpdateForm(UpdateListDTO uDTO) throws Exception; 
	
	public List<PreventInsertDTO> preventUpdateForm(UpdateListDTO uDTO) throws Exception; 
	
	public List<CounselInsertDTO> counselUpdateForm(UpdateListDTO uDTO) throws Exception; 
	
	public List<HrvInsertDTO> hrvUpdateForm(UpdateListDTO uDTO) throws Exception; 
	
	public List<VibraInsertDTO> vibraUpdateForm(UpdateListDTO uDTO) throws Exception;

	public List<BasicInfoDTO> getBasicInfoUpdate(BasicInfoDTO bDTO) throws Exception;

	public List<UpdateListDTO> getAgencyList(UpdateListDTO uDTO) throws Exception; 

	// 중간저장 서식 불러와서 수정 - update 쿼리 사용
	public int updateOperateResultProc(BasicInfoDTO bDTO) throws Exception;
}
