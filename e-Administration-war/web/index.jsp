<%--
    Document   : index
    Created on : May 21, 2020, 10:36:31 PM
    Author     : YoungFox
    Name       : Osunrinde Adebayo Stephen
--%>

<%@page import="java.util.Map"%>
<%@page import="config.mysqli_query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="section/header.jsp" />
    </head>
    <jsp:useBean id="date" class="java.util.Date" />
    <body onload="init();">
      <div class="web-container">
        <div class="web-bg anim-bg" data-slideprefix="lab_img_" data-maxslide="4" data-type="jpg" data-current="1" data-path="media/img/lab/" style="background-image: url('media/img/lab/lab_img_1.jpg')"></div>
        <div class="web-loader-bar"></div>

        <%-- [START] TOP BAR SECTION --%>
        <div class="top-bar">
          <div class="tb-logo"></div>
          <div class="tb-logo-name"></div>
          <div class="tb-navigator">
            <%-- // BAR MENU // --%>
            <div class="tb-nv-farRight">
              <a class="tb-nv-btn tb-btn-active unsee">Home</a>
              <a class="tb-nv-btn unsee">About</a>
              <a class="tb-nv-btn unsee">Downloads</a>
              <a class="tb-nv-btn unsee">Contact</a>
              <a class="tb-nv-btn">Login</a>
              <a class="mob_tb-nv-btn mob-element icon-menu"></a>
            </div>
            <%-- // end // --%>
          </div>
        </div>
        <%-- [END] TOP BAR SECTION --%>

        <%-- [START] BODY SECTION 1 --%>
          <div class="bdy-sec-1">
            <div class="big-text">WELCOME</div>
            <div class="sub-big-text">to the e-Administration of the computer labs</div>

            <div class="bdy-sec-1-menu">
              <div class="hComb"><div class="bs1-menu-div" data-info="Server room details"><div class="bs1-menu-icon icon-server"></div></div></div>
              <div class="hComb"><div class="bs1-menu-div" data-info="e-Learning"><div class="bs1-menu-icon icon-book-1"></div></div></div>
              <div class="hComb"><div class="bs1-menu-div" data-info="View lab details"><div class="bs1-menu-icon icon-monitor"></div></div></div>
              <div class="hComb"><div class="bs1-menu-div" data-info="Lab schedule"><div class="bs1-menu-icon icon-clock-4"></div></div></div>
              <div class="hComb"><div class="bs1-menu-div" data-info="View software installation process"><div class="bs1-menu-icon icon-install"></div></div></div>
              <div class="hComb"><div class="bs1-menu-div" data-info="View syllabus copy"><div class="bs1-menu-icon icon-table"></div></div></div>
              <div class="hComb"><div class="bs1-menu-div" data-info="More..."><div class="bs1-menu-icon icon-dot-3"></div></div></div>
            </div>
          </div>
        <%-- [END] BODY SECTION 1 --%>

        <%-- [START] BODY SECTION 2 --%>
        <div class="bdy-sec-2">
          <div class="server-message-1">
            <a class="server-message-icon"><span class="icon-server"></span></a>
            <a class="server-message-text">Main servers are online</a>
          </div>
          <div class="server-message-1">
            <a class="server-message-icon"><span class="icon-server"></span></a>
            <a class="server-message-text">Backup server is on stand-by</a>
          </div>
        </div>
        <%-- [END] BODY SECTION 2 --%>

        <%-- [START] sign-in section --%>
        <div class="sign-in-container unsee">
          <div class="sign-in-form">
            <div class="sign-in-banner">
              <%-- animated background image in banner --%>
              <div class="sign-in-banner-bg anim-bg" data-slideprefix="lab_img_" data-maxslide="4" data-type="jpg" data-current="1" data-path="media/img/lab/" style="background-image: url('media/img/lab/lab_img_1.jpg')"></div>
              <%-- Institute of technology - logo --%>
              <div class="sign-in-banner-logo" style="background-image: url('media/img/logo/logo_1080x1080.png')"></div>
            </div>
            <div class="sign-in-form-div">
              <div class="sign-in-form-top-bar">
                <a>Login</a>
                <a class="sif-top-bar-close icon-cancel"></a>
              </div>
              <div class="sif-input-intel">
                Only individuals with proper authorization from the administrators will have an access account to the e-Administration panel of the Institute of technology.
              </div>
              <form method="POST" action="p/auth/login.jsp">
                <div class="sif-input-div">
                  <a class="sif-inp-icon icon-user-3"></a>
                  <input id="email-inp" type="email" name="email" placeholder="E-mail"/>
                </div>
                <div class="sif-input-div">
                  <a class="sif-inp-icon icon-lock"></a>
                  <input type="password" id="pass-inp" name="password" placeholder="Password"/>
                </div>
                <div class="sif-input-div">
                  <input id="pass-inp" type="submit" name="login" value="Login">
                </div>
              </form>
              <div class="sif-footer">Copyright &copy; <fmt:formatDate value="${date}" pattern="yyyy" /><br> e-Administration of Computer Labs. All Rights Reserved</div>
            </div>
          </div>
        </div>
        <%-- [END] sign-in section --%>

        <%-- [START] FOOTER section --%>
        <div class="bdy-sec-footer">Copyright &copy; <fmt:formatDate value="${date}" pattern="yyyy" /><br> e-Administration of Computer Labs. All Rights Reserved</div>
        <%-- [END] FOOTER section --%>
      </div>

      <script type="text/javascript">
        div_slide_show(5000);
      </script>
  </body>
</html>
