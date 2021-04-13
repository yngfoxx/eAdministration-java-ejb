<%@page import="java.util.*" %>
<%@page import="com.stlib.pkg.keygen"%>
<%@page import="com.labs.pkg.lab"%>
<%
try {
  if (request.getMethod() == "POST") {
    String event = (String)request.getParameter("event");
    if (event.equals("create")) { // create lab process
      String lab_name = new String(request.getParameter("lName"));
      String lab_capty = new String(request.getParameter("lCap"));
      String lab_server = new String(request.getParameter("lServer"));
      String lab_admin = new String(request.getParameter("lAdmin"));
      // generate lab ID
      keygen keyObj = new keygen(12, "upper");
      String lab_ID = new String(keyObj.create());
      // check if lab name exists then create lab
      lab labObj = new lab(lab_ID);
      if (!labObj.validateByName(lab_name)) {
        // lab does not exist, create lab
        HashMap<String, String> labData = new HashMap<String, String>();
        labData.put("lab_name", lab_name);
        labData.put("lab_capty", lab_capty);
        labData.put("lab_server", lab_server);
        labData.put("lab_admin", lab_admin);
        if (labObj.create(labData)) {
          out.print(true); // lab created successfully
        } else {
          out.print("something went wrong somewhere - "+labObj.error());
        }
      } else {
        // lab exists by name
        out.print("Lab name exists");
      }
      labObj = null;
    } else {
      out.print("No valid process was defined - "+event);
    }
  } else {
    out.print("Invalid request");
  }
} catch (Exception e) {
  out.print(e);
}
%>
