package poly.filter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import static poly.util.CmmUtil.nvl;

import java.io.IOException;
import java.util.Collection;

/**
 * http 전송시, 입력되는 불량 문자(해킹, html 단어 등) 처리를 위해 사용
 */
public final class UrlResponseFilter extends HttpServletResponseWrapper {

	public UrlResponseFilter(HttpServletResponse servletResponse) {
		super(servletResponse);
	}
	// UrlFilter에서 Override하는 메소드
	/*public String[] getParameterValues(String parameter) {

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

	public String getHeader(String name) {
		String value = super.getHeader(name);
		if (value == null)
			return null;
		return cleanXSS(value);

	}
*/
	
	public static String convertXSS(String value) {
		// 변환했던 문자를 다시 원래 특수문자로 변환
		if (nvl(value).length() == 0) {
			return "";
		}
		value = value.replaceAll("& lt;", "<").replaceAll("& gt;", ">");
		value = value.replaceAll("& #40;", "\\(").replaceAll("& #41;", "\\)");
		value = value.replaceAll("& #39;", "'");
		value = value.replaceAll("eval\\((.*)\\)", "");
		return value;
	}

	@Override
	public void addCookie(Cookie cookie) {
		// System.out.println("addCookie");
		super.addCookie(cookie);
	}

	@Override
	public void addDateHeader(String name, long date) {
		// System.out.println("addDateHeader");
		super.addDateHeader(name, date);
	}

	@Override
	public void addHeader(String name, String value) {
		// System.out.println("addHeader");
		super.addHeader(name, value);
	}

	@Override
	public void addIntHeader(String name, int value) {
		// System.out.println("addIntHeader");
		super.addIntHeader(name, value);
	}

	@Override
	public boolean containsHeader(String name) {
		// Returns: true if the named response header has already been set; false otherwise
		// System.out.println("containsHeader");
		return super.containsHeader(name);
	}

	@Override
	public String encodeRedirectURL(String url) {
		// System.out.println("encodeRedirectURL");
		return super.encodeRedirectURL(url);
	}

	@Override
	public String encodeRedirectUrl(String url) {
		// System.out.println("encodeRedirectUrl");
		return super.encodeRedirectUrl(url);
	}

	@Override
	public String encodeURL(String url) {
		// System.out.println("encodeURL");
		return super.encodeURL(url);
	}

	@Override
	public String encodeUrl(String url) {
		// System.out.println("encodeUrl");
		return super.encodeUrl(url);
	}

	@Override
	public String getHeader(String name) {
		// System.out.println("getHeader");
		// System.out.println(super.getHeader(name));
		return super.getHeader(name);
	}

	@Override
	public Collection<String> getHeaderNames() {
		// System.out.println("getHeaderNames");
		return super.getHeaderNames();
	}

	@Override
	public Collection<String> getHeaders(String name) {
		// System.out.println("getHeaders");
		// System.out.println(super.getHeaders(name));
		return super.getHeaders(name);
	}

	@Override
	public int getStatus() {
		// Returns: the current status code of the wrapped response
		// System.out.println("현재 상태 코드 반환");
		// System.out.println(super.getStatus());
		return super.getStatus();
	}

	@Override
	public void sendError(int sc, String msg) throws IOException {
		// System.out.println("sendError1");
		super.sendError(sc, msg);
	}

	@Override
	public void sendError(int sc) throws IOException {
		// System.out.println("sendError2");
		super.sendError(sc);
	}

	@Override
	public void sendRedirect(String location) throws IOException {
		// System.out.println("sendRedirect");
		super.sendRedirect(location);
	}

	@Override
	public void setDateHeader(String name, long date) {
		// System.out.println("setDateHeader");
		super.setDateHeader(name, date);
	}

	@Override
	public void setHeader(String name, String value) {
		// System.out.println("setHeader");
		super.setHeader(name, value);
	}

	@Override
	public void setIntHeader(String name, int value) {
		// System.out.println("setIntHeader");
		super.setIntHeader(name, value);
	}

	@Override
	public void setStatus(int sc, String sm) {
		// System.out.println("setStatus1");
		super.setStatus(sc, sm);
	}

	@Override
	public void setStatus(int sc) {
		// System.out.println("setStatus2");
		super.setStatus(sc);
	}
	
}
