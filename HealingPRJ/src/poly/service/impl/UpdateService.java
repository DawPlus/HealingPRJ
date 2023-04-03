package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.BasicInfoDTO;
import poly.dto.CounselInsertDTO;
import poly.dto.HealingInsertDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.UpdateListDTO;
import poly.dto.VibraInsertDTO;
import poly.persistance.mapper.IOperateMapper;
import poly.persistance.mapper.IUpdateMapper;
import poly.service.IUpdateService;
import poly.service.comm.AbstractService;

@Service("UpdateService")
public class UpdateService extends AbstractService implements IUpdateService {

	@Resource(name = "UpdateMapper")
	private IUpdateMapper updateMapper;

	@Resource(name = "IOperateMapper")
	private IOperateMapper operateMapper;

	@Override
	public List<UpdateListDTO> getList(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".getList Start !!");
		log.info(this.getClass().getName() + ".getList End !!");
		return updateMapper.getList(uDTO);
	}

	@Override
	public int deleteForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".deleteForm Start !!");
		log.info(uDTO.getAgency());
		log.info(uDTO.getEval_date());
		log.info(uDTO.getOpenday());
		log.info(uDTO.getPv());
		log.info(this.getClass().getName() + ".deleteForm End !!");
		return updateMapper.deleteForm(uDTO);
	}

	@Override
	public BasicInfoDTO basicInfoUpdateForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".basicInfoUpdateForm Start !!");
		log.info(this.getClass().getName() + ".basicInfoUpdateForm End !!");
		return updateMapper.basicInfoUpdateForm(uDTO);
	}

	@Override
	public List<ServiceInsertDTO> serviceUpdateForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".serviceUpdateForm Start !!");
		log.info(this.getClass().getName() + ".serviceUpdateForm End !!");
		return updateMapper.serviceUpdateForm(uDTO);
	}

	@Override
	public List<ProgramInsertDTO> programUpdateForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".programUpdateForm Start !!");
		log.info(this.getClass().getName() + ".programUpdateForm End !!");
		return updateMapper.programUpdateForm(uDTO);
	}

	@Override
	public List<HealingInsertDTO> healingUpdateForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".healingUpdateForm Start !!");
		log.info(this.getClass().getName() + ".healingUpdateForm End !!");
		return updateMapper.healingUpdateForm(uDTO);
	}

	@Override
	public List<PreventInsertDTO> preventUpdateForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".preventUpdateForm Start !!");
		log.info(this.getClass().getName() + ".preventUpdateForm End !!");
		return updateMapper.preventUpdateForm(uDTO);
	}

	@Override
	public List<CounselInsertDTO> counselUpdateForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".counselUpdateForm Start !!");
		log.info(this.getClass().getName() + ".counselUpdateForm End !!");
		return updateMapper.counselUpdateForm(uDTO);
	}

	@Override
	public List<HrvInsertDTO> hrvUpdateForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".hrvUpdateForm Start !!");
		log.info(this.getClass().getName() + ".hrvUpdateForm End !!");
		return updateMapper.hrvUpdateForm(uDTO);
	}

	@Override
	public List<VibraInsertDTO> vibraUpdateForm(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".vibraUpdateForm Start !!");
		log.info(this.getClass().getName() + ".vibraUpdateForm End !!");
		return updateMapper.vibraUpdateForm(uDTO);
	}

	@Override
	public List<BasicInfoDTO> getBasicInfoUpdate(BasicInfoDTO bDTO) throws Exception {
		log.info(this.getClass().getName() + ".getBasicInfoUpdate Start !!");
		log.info(this.getClass().getName() + ".getBasicInfoUpdate End !!");
		return updateMapper.getBasicInfoUpdate(bDTO);
	}

	@Override
	public List<UpdateListDTO> getAgencyList(UpdateListDTO uDTO) throws Exception {
		log.info(this.getClass().getName() + ".getAgencyList Start !!");
		log.info(this.getClass().getName() + ".getAgencyList End !!");
		return updateMapper.getAgencyList(uDTO);
	}

	@Override
	public int updateOperateResultProc(BasicInfoDTO bDTO) throws Exception {
		log.info(this.getClass().getName() + ".updateOperateResultProc Start !!");

		// 인서트 하기 전 중복값 삭제를 위한 전체 삭제
		operateMapper.deleteExpenseInfo(bDTO);
		operateMapper.deleteIncomeInfo(bDTO);

		int basic = updateMapper.updateBasic(bDTO);
		if (basic == 0)
			return 0;
		log.info("basic " + basic + " out");
		log.info(bDTO.getBasic_info_seq());
		// 수입지출금액이 입력되지 않더라도 기본생성자에서 초기화 되기 때문에 널 겂 에러 안남
		int expense = (bDTO.getExpList().size() > 0) ? operateMapper.insertExpenses(bDTO) : 0;
		log.info("expense " + bDTO.getExpList().size() + " out");

		int income = (bDTO.getIncList().size() > 0) ? operateMapper.insertIncomes(bDTO) : 0;
		log.info("income " + bDTO.getIncList().size() + " out");

		log.info(this.getClass().getName() + ".updateOperateResultProc End !!");
		return basic + expense + income;
	}

}
