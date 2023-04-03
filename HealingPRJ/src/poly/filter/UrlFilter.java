package poly.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import static poly.util.CmmUtil.nvl;

/**
 * http 전송시, 입력되는 불량 문자(해킹, html 단어 등) 처리를 위해 사용
 */
public final class UrlFilter extends HttpServletRequestWrapper {

	public UrlFilter(HttpServletRequest servletRequest) {
		super(servletRequest);
	}

	public String[] getParameterValues(String parameter) {

		String[] values = super.getParameterValues(parameter);
		if (values == null) {
			return null;
		}
		int count = values.length;
		String[] encodedValues = new String[count];
		for (int i = 0; i < count; i++) {
			encodedValues[i] = cleanXSS(values[i]);
		}
		return encodedValues;
	}

	public String getParameter(String parameter) {
		String value = super.getParameter(parameter);
		if (value == null) {
			return null;
		}
		return cleanXSS(value);
	}

	// url 요청이 들어오면 CrossScriptingFilter 클래스 내 doFilter 메소드에서 getHeader 메소드를 사용한다.
	public String getHeader(String name) {
		String value = super.getHeader(name);
		if (value == null)
			return null;
		return cleanXSS(value);
	}

	private String cleanXSS(String value) {
		// You'll need to remove the spaces from the html entities below
		value = value.replaceAll("<", "& lt;").replaceAll(">", "& gt;");
		value = value.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");
		value = value.replaceAll("'", "& #39;");
		value = value.replaceAll("eval\\((.*)\\)", "");
		value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		value = value.replaceAll("script", "");
		return value;
	}
	

	public static String convertXSS(String value) {
		// 변환했던 문자를 다시 원래 특수문자로 변환
		if (nvl(value).length() == 0) {
			return "";
		}
		value = value.replaceAll("& lt;", "<").replaceAll("& gt;", ">");
		value = value.replaceAll("& #40;", "\\(").replaceAll("& #41;", "\\)");
		value = value.replaceAll("& #44;", ",");
		value = value.replaceAll("& #39;", "'");
		value = value.replaceAll("eval\\((.*)\\)", "");
		return value;
	}
	
}
