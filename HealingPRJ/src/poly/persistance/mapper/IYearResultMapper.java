package poly.persistance.mapper;


import java.util.List;

import config.Mapper;
import poly.dto.BasicInfoDTO;
import poly.dto.ExpenseDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.IncomeDTO;
import poly.dto.ProgramOperationDTO;
import poly.dto.ResidenceDTO;
import poly.dto.SearchDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.YearResultDTO;

@Mapper("YearResultMapper")

public interface IYearResultMapper {

	List<YearResultDTO> getPartList(YearResultDTO yrDTO) throws Exception;

	List<YearResultDTO> getKidCount(YearResultDTO yrDTO) throws Exception;

	List<YearResultDTO> getBoyCount(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getAdultCount(YearResultDTO yrDTO)throws Exception ;

	List<YearResultDTO> getOldCount(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getLowMoneyCount(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getHandCapCount(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getFamilyCount(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getTeacherCount(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getEtcCount(YearResultDTO yrDTO) throws Exception;

	List<YearResultDTO> getAddictCount(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getSumCount(YearResultDTO yrDTO)throws Exception;

	List<BasicInfoDTO> getRoomList(BasicInfoDTO bDTO)throws Exception;

	List<ProgramOperationDTO> getoperationList(ProgramOperationDTO poDTO) throws Exception;

	List<YearResultDTO> getIncomeList(YearResultDTO yrDTO)throws Exception;

	List<ServiceInsertDTO> getSerList(ServiceInsertDTO siDTO)throws Exception;

	List<YearResultDTO> getGreen(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getVoucher(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getEtc(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getBizList(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getBenefitList(YearResultDTO yrDTO) throws Exception;

	List<YearResultDTO> getSocietyList(YearResultDTO yrDTO) throws Exception;

	List<ResidenceDTO> getResidenceList(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getSeoul(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getBusan(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getDaegu(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getIncheon(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getGwamgju(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getDajeon(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getUlsan(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getKeongi(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getMine(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getGangwon(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getChungnam(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getChungbuk(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getGeongnam(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getGeongbuk(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getJeonbuk(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getJeonnam(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getjeju(ResidenceDTO uDTO)throws Exception;

	List<ResidenceDTO> getSumRes(ResidenceDTO uDTO)throws Exception;

	List<YearResultDTO> getSupBenefit(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getSupSociety(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getSerBenefit(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getSerSociety(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getPartBenefit(YearResultDTO yrDTO)throws Exception;

	List<YearResultDTO> getPartSociety(YearResultDTO yrDTO) throws Exception;

	List<YearResultDTO> getBene_List(YearResultDTO yrDTO) throws Exception;

	List<YearResultDTO> getSoc_List(YearResultDTO yrDTO)throws Exception;

	List<SearchDTO> getPre_PreList(SearchDTO sDTO) throws Exception;

	List<SearchDTO> getAf_PreList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getPre_CounselList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getAf_CounselList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getPre_HealingList(SearchDTO sDTO)throws Exception;

	List<SearchDTO> getAf_HealingList(SearchDTO sDTO)throws Exception;

	List<YearResultDTO> getAgeList(YearResultDTO yrDTO)throws Exception;

	List<ExpenseDTO> getExpenseList(ExpenseDTO eDTO) throws Exception;

	List<IncomeDTO> getIncomeSumList(IncomeDTO iDTO) throws Exception;

	List<ResidenceDTO> getsejong(ResidenceDTO uDTO) throws Exception;

	List<BasicInfoDTO> getBasicList(BasicInfoDTO bDTO) throws Exception;

	List<IncomeDTO> getExpenseList(IncomeDTO iDTO)throws Exception;

	List<IncomeDTO> getSumIncomeList(IncomeDTO iDTO)throws Exception;

	List<IncomeDTO> getFinalIncomeList(IncomeDTO iDTO) throws Exception;

	List<HrvInsertDTO> getPreHrvList(HrvInsertDTO hiDTO) throws Exception;

	List<HrvInsertDTO> getAftHrvList(HrvInsertDTO hiDTO) throws Exception;

	List<SearchDTO> getBunyaList(SearchDTO sDTO) throws Exception;





	






	
}
