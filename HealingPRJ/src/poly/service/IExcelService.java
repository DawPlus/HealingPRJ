package poly.service;

import java.io.IOException;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import poly.dto.HealingInsertDTO;
import poly.dto.HrvInsertDTO;
import poly.dto.PreventInsertDTO;
import poly.dto.ProgramInsertDTO;
import poly.dto.CounselInsertDTO;
import poly.dto.ServiceInsertDTO;
import poly.dto.VibraInsertDTO;

public interface IExcelService {

	XSSFWorkbook excelDownload(ServiceInsertDTO serviceDtoList) throws IOException;

	XSSFWorkbook excelDownload(ProgramInsertDTO programDtoList) throws IOException;

	XSSFWorkbook excelDownload(CounselInsertDTO counselDtoList) throws IOException;

	XSSFWorkbook excelDownload(PreventInsertDTO preventDtoList) throws IOException;

	XSSFWorkbook excelDownload(HealingInsertDTO healingDtoList) throws IOException;
	
	XSSFWorkbook excelDownload(HrvInsertDTO hrvDtoList) throws IOException;
	
	XSSFWorkbook excelDownload(VibraInsertDTO vibraDtoList) throws IOException;
}
