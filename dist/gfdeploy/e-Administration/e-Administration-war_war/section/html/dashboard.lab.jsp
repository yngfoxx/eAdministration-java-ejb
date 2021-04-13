<%@page import="java.util.*" %>
<%@page import="com.google.gson.Gson" %>
<%@page import="com.labs.pkg.lab"%>
<%@page import="config.mysqli_query"%>
<%
try {
  if (request.getMethod() == "POST") {
    String req = (String)request.getParameter("request");
    String type = (String)request.getParameter("type");
    String section = (String)request.getParameter("section");
    if (req.equals("lab_name")) {
      // get all labs by ID
      lab labObj = new lab(); // create lab object
      Gson gson = new Gson(); // handle array to JSON convertions
      String qry = "SELECT * FROM labs";
      mysqli_query labSql = new mysqli_query(qry);
      if (labSql.mysqli_num_rows() > 0) {
        ArrayList<String> lab_names = new ArrayList<String>();
        int total = labSql.length;
        for (int x = 0; x < total; x++) {
          Map<String, String> labMap = labSql.mysqli_fetch_assoc(x);
          if (labMap.get("labName") != null) {
            lab_names.add(labMap.get("labName"));
          }
        }
        String nameJson = gson.toJson(lab_names);
        out.print(nameJson);
      }
      labObj = null;
    } else {
      out.print("Invalid process");
    }
  }
} catch (Exception e) {
out.print(e);
}
%>
