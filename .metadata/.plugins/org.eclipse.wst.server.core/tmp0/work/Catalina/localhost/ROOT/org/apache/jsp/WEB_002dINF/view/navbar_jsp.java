/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.69
 * Generated at: 2021-10-23 08:21:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class navbar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

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
      out.write("<link rel=\"stylesheet\" href=\"./css/treview-navigation.css\">\r\n");
      out.write("<div class=\"page\">\r\n");
      out.write("        <div class=\"body\">\r\n");
      out.write("          <nav aria-label=\"Mythical University\">\r\n");
      out.write("            <ul class=\"treeview-navigation\"role=\"tree\"aria-label=\"Mythical University\">\r\n");
      out.write("              <li role=\"none\">\r\n");
      out.write("                <a role=\"treeitem\"href=\"#home\"aria-current=\"page\">\r\n");
      out.write("                  <span class=\"label\">\r\n");
      out.write("                    견종\r\n");
      out.write("                  </span>\r\n");
      out.write("                </a>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li role=\"none\">\r\n");
      out.write("                <a role=\"treeitem\"aria-expanded=\"false\"aria-owns=\"id-about-subtree\"href=\"#about\">\r\n");
      out.write("                  <span class=\"label\">\r\n");
      out.write("                    <span class=\"icon\">\r\n");
      out.write("                      <svg xmlns=\"http://www.w3.org/2000/svg\"width=\"13\"height=\"10\"viewBox=\"0 0 13 10\">\r\n");
      out.write("                        <polygon points=\"2 1, 12 1, 7 9\"></polygon>\r\n");
      out.write("                      </svg>\r\n");
      out.write("                    </span>\r\n");
      out.write("                    소형견\r\n");
      out.write("                  </span>\r\n");
      out.write("                </a>\r\n");
      out.write("                <ul id=\"id-about-subtree\"\r\n");
      out.write("                    role=\"group\"\r\n");
      out.write("                    aria-label=\"About\">\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#a-1\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        말티즈\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=#a-2>\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        시츄\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#a-3\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        포메라니안\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#a-4\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        푸들\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#a-5\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        닥스훈트\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li role=\"none\">\r\n");
      out.write("                <a role=\"treeitem\"\r\n");
      out.write("                   aria-expanded=\"false\"\r\n");
      out.write("                   aria-owns=\"id-admissions-subtree\"\r\n");
      out.write("                   href=\"#admissions\">\r\n");
      out.write("                  <span class=\"label\">\r\n");
      out.write("                    <span class=\"icon\">\r\n");
      out.write("                      <svg xmlns=\"http://www.w3.org/2000/svg\"width=\"13\"height=\"10\"viewBox=\"0 0 13 10\">\r\n");
      out.write("                        <polygon points=\"2 1, 12 1, 7 9\"></polygon>\r\n");
      out.write("                      </svg>\r\n");
      out.write("                    </span>\r\n");
      out.write("                    중형견\r\n");
      out.write("                  </span>\r\n");
      out.write("                </a>\r\n");
      out.write("                <ul id=\"id-admissions-subtree\"\r\n");
      out.write("                    role=\"group\"\r\n");
      out.write("                    aria-label=\"Admissions\">\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#b-1\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        비글\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#b-2\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        웰시코기\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#b-3\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        불독\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#b-4\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        시바견\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#b-5\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        아메리칸 불리\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("              </li>\r\n");
      out.write("              <li role=\"none\">\r\n");
      out.write("                <a role=\"treeitem\"\r\n");
      out.write("                   aria-expanded=\"false\"\r\n");
      out.write("                   aria-owns=\"id-academics-subtree\"\r\n");
      out.write("                   href=\"#academics\">\r\n");
      out.write("                  <span class=\"label\">\r\n");
      out.write("                    <span class=\"icon\">\r\n");
      out.write("                      <svg xmlns=\"http://www.w3.org/2000/svg\"width=\"13\"height=\"10\"viewBox=\"0 0 13 10\">\r\n");
      out.write("                        <polygon points=\"2 1, 12 1, 7 9\"></polygon>\r\n");
      out.write("                      </svg>\r\n");
      out.write("                    </span>\r\n");
      out.write("                    대형견\r\n");
      out.write("                  </span>\r\n");
      out.write("                </a>\r\n");
      out.write("                <ul id=\"id-academics-subtree\"role=\"group\"aria-label=\"Academics\">\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#c-1\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        진돗개\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#c-2\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        골든리트리버\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#c-3\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        사모예드\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#c-4\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        시베리안 허스키\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                  <li role=\"none\">\r\n");
      out.write("                    <a role=\"treeitem\" href=\"#c-5\">\r\n");
      out.write("                      <span class=\"label\">\r\n");
      out.write("                        알래스칸 말라뮤트\r\n");
      out.write("                      </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                  </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("              </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </nav>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"dogmain\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("      </div>");
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
