<%@page import="com.labs.pkg.viewLab"%>
<%@page import="config.mysqli_query"%>
<%@page import="java.util.*" %>
<%
  String userID =  (String) request.getParameter("uID");
  String labName = (String) request.getParameter("name");
  // search for lab details by lab name
  viewLab labView = new viewLab(labName);
  // out.print(labView.get_name());
  labView = null;
%>

<div class="iblb-status-bar">
  <div class="iblb-status-bar-icon">
    <a class="icon-monitor"></a>
  </div>
  <div class="iblb-status-bar-status" data-status="1">
    Currently occupied
  </div>
</div>

<div class="iblbqd">
  <div class="iblb-quick-details">
    <div class="iblb-qd-tiles" title="Capacity">
      <div class="iblb-qd-tiles-icon">
        <a class="icon-desktop-3"></a>
      </div>
      <div class="iblb-qd-tiles-txt">
        50
      </div>
    </div>

    <div class="iblb-qd-tiles" title="Students occupying">
      <div class="iblb-qd-tiles-icon">
        <a class="icon-users"></a>
      </div>
      <div class="iblb-qd-tiles-txt">
        32
      </div>
    </div>

    <div class="iblb-qd-tiles" title="Admins">
      <div class="iblb-qd-tiles-icon">
        <a class="icon-shield"></a>
      </div>
      <div class="iblb-qd-tiles-txt">
        2
      </div>
    </div>

    <div class="iblb-qd-tiles" title="Complaints">
      <div class="iblb-qd-tiles-icon">
        <a class="icon-mail"></a>
      </div>
      <div class="iblb-qd-tiles-txt">
        0
      </div>
    </div>

    <div class="iblb-qd-tiles" title="Server in use">
      <div class="iblb-qd-tiles-icon">
        <a class="icon-server"></a>
      </div>
      <div class="iblb-qd-tiles-txt">
        Abuja-142
      </div>
    </div>
  </div>
</div>

<div class="iblb-lab-map">
  <div class="iblb-lab-map-Div">
    <div class="iblb-lab-map-Div-header">
      Laboratory map
    </div>
    <div class="iblb-lab-map-Div-body">
      <div class="map-container">

        <div class="iblb-qd-tiles" title="PC#01">
          <div class="iblb-qd-tiles-icon">
            <a class="icon-desktop-3"></a>
          </div>
          <div class="iblb-qd-tiles-txt">
            #01
          </div>
        </div>
        <%-- <div class="flex-break"></div> --%>

      </div>
    </div>
  </div>
</div>
