<%--
    Document   : dashboard
    Created on : May 31, 2020, 7:15:15 AM
    Author     : YoungFox
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
  String userID = null;
  Boolean logged_in = false;
  if ((Boolean) session.getAttribute("logged_in") == true) {
    String key = new String("uID");
    userID = (String) session.getAttribute(key);
    logged_in = (Boolean) session.getAttribute("logged_in");
  } else {
    // redirect to dashboard
    String site = new String("../../p/handler/error.jsp");
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", site);
  }
%>
<!DOCTYPE html>
<html>
    <head>
      <script type="text/javascript">
      // assign user id to constant variable
      const uID = '<%=userID%>';
      var logged_in = '<%=logged_in%>';
      console.log('Your userID is '+uID);
      console.log("logged in: "+logged_in);
      </script>
        <jsp:include page="../section/header.jsp" />
        <script type="text/javascript">
          // overide the title
          let win_title = document.getElementsByTagName('TITLE');
          win_title[0].innerHTML = "eAdministration - Dashboard";
        </script>
    </head>
    <body onload="init();">
      <div class="web-container" data-page="dashboard">
        <div class="top-bar" style="height: 38px;">
          <div class="tb-logo" style="background-size: 30px;"></div>
          <div class="tb-logo-name"></div>
          <div class="tb-navigator">
            <div class="tb-nv-farRight">
              <a class="tb-nv-btn icon-bell-3" onclick="fetch_labs_button();"></a>
              <a class="mob_tb-nv-btn mob-element icon-menu"></a>
            </div>
          </div>
        </div>

        <div class="l-side-bar">
          <a class="l-side-bar-btn icon-monitor lsbb_active_btn" onclick="navigate('labs');">
            <span class="lsbb_tooltip">Labs</span>
          </a>
          <a class="l-side-bar-btn icon-users" onclick="navigate('users');">
            <span class="lsbb_tooltip">Users</span>
          </a>
          <a class="l-side-bar-btn icon-server">
            <span class="lsbb_tooltip">Servers</span>
          </a>
          <a class="l-side-bar-btn icon-install">
            <span class="lsbb_tooltip">Software installations</span>
          </a>
          <a class="l-side-bar-btn icon-post" onclick="navigate('complaint');">
            <span class="lsbb_tooltip">Make complaint</span>
          </a>
        </div>

        <div class="in-body">
          <div class="ib-labs-side">
            <div class="ibls-button" onclick="crt_lab();">
              <div class="ibls-button-icon">
                <a class="icon-plus"></a>
              </div>
              <div class="ibls-button-name">
                <a>Add Lab</a>
              </div>
            </div>
            <div class="ib-labs-side-container">
              <%-- AJAX FETCH EXISTING LABS --%>
            </div>
          </div>

          <div class="ib-labs-body">
            <div class="fill-bg-msg">
              <a class="fill-msg">Click + Add Lab to use extra administrative tools</a>
            </div>
          </div>

          <div class="overlay-div unsee">
            <div class="overlay-content">
              <div class="overlay-header">
                <span id="overlay-title"></span>
                <a class="icon-cancel" onclick="overlay(0);"></a>
              </div>
              <div id="overlay-body"></div>
            </div>
          </div>
      </div>
    </body>
</html>
