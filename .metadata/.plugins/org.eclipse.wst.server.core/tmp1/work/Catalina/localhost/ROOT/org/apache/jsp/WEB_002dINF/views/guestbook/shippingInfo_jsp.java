/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.69
 * Generated at: 2021-11-08 03:45:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.guestbook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class shippingInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1635235192466L));
    _jspx_dependants.put("jar:file:/E:/Java_workspace/6.jspSpring/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/springProj/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<script src=\"https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js\"></script>\r\n");
      out.write("<script src=\"/js/jquery-3.6.0.min.js\"></script>\r\n");
      out.write("<script src=\"/js/jquery-ui.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"/css/style.css\" />\r\n");
      out.write("<title>배송 정보</title>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("	$(function(){\r\n");
      out.write("		$(\"#datepicker\").datepicker({dateFormat:'yy/mm/dd'});\r\n");
      out.write("	});\r\n");
      out.write("	\r\n");
      out.write("	function openHomeSearch(){\r\n");
      out.write("		//다음 우편번호 검색\r\n");
      out.write("		new daum.Postcode({\r\n");
      out.write("			oncomplete:function(data){\r\n");
      out.write("				$(\"[name='zipCode']\").val(data.zonecode);\r\n");
      out.write("				$(\"[name='addressName']\").val(data.address);\r\n");
      out.write("			}\r\n");
      out.write("		}).open();\r\n");
      out.write("	}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div class=\"jumbotron\">\r\n");
      out.write("	<div class=\"container\">\r\n");
      out.write("		<h1 class=\"display-3\">배송 정보</h1>\r\n");
      out.write("	</div>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("	<form action=\"/processShippingInfo\" class=\"form-horizontal\"\r\n");
      out.write("		method=\"post\">\r\n");
      out.write("		<input type=\"hidden\" name=\"cartId\" \r\n");
      out.write("			value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${cartId}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("		<div class=\"form-group row\">\r\n");
      out.write("			<label class=\"col-sm-2\">성명</label>\r\n");
      out.write("			<div class=\"col-sm-3\">\r\n");
      out.write("				<input name=\"name\" type=\"text\" class=\"form-control\" required />\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"form-group row\">\r\n");
      out.write("			<label class=\"col-sm-2\">배송일</label>\r\n");
      out.write("			<div class=\"col-sm-3\">\r\n");
      out.write("				<input name=\"shippingDate\" id=\"datepicker\" type=\"text\" \r\n");
      out.write("					class=\"form-control\" required />(yyyy-mm-dd)\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"form-group row\">\r\n");
      out.write("			<label class=\"col-sm-2\">국가명</label>\r\n");
      out.write("			<div class=\"col-sm-3\">\r\n");
      out.write("				<input name=\"country\" type=\"text\" \r\n");
      out.write("					class=\"form-control\" required />\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"form-group row\">\r\n");
      out.write("			<label class=\"col-sm-2\">우편번호</label>\r\n");
      out.write("			<div class=\"col-sm-3\">\r\n");
      out.write("				<input name=\"zipCode\" type=\"text\" \r\n");
      out.write("					class=\"form-control\" required />\r\n");
      out.write("				<input type=\"button\" class=\"btn btn-primary\" value=\"검색\" \r\n");
      out.write("					onclick=\"openHomeSearch();\" />\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"form-group row\">\r\n");
      out.write("			<label class=\"col-sm-2\">주소</label>\r\n");
      out.write("			<div class=\"col-sm-5\">\r\n");
      out.write("				<input name=\"addressName\" type=\"text\" \r\n");
      out.write("					class=\"form-control\" required />\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"form-group row\">\r\n");
      out.write("			<label class=\"col-sm-offset-2 col-sm-10\">\r\n");
      out.write("				<a href=\"/cart?cartId=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"\r\n");
      out.write("				 class=\"btn btn-secondary\" role=\"button\">이전</a>\r\n");
      out.write("				<input type=\"submit\" class=\"btn btn-primary\" value=\"등록\" />\r\n");
      out.write("				<a href=\"/checkOutCancelld\" class=\"btn btn-secondary\"\r\n");
      out.write("					role=\"button\">취소</a>\r\n");
      out.write("			</label>\r\n");
      out.write("		</div>\r\n");
      out.write("	</form>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}