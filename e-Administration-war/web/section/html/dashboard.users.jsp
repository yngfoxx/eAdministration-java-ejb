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
    if (req.equals("user_email")) {
      // get all labs by ID
      Gson gson = new Gson(); // handle array to JSON convertions
      String qry = "SELECT * FROM users";
      mysqli_query userSql = new mysqli_query(qry);
      if (userSql.mysqli_num_rows() > 0) {
        ArrayList<String> v_email = new ArrayList<String>();
        int total = userSql.length;
        for (int x = 0; x < total; x++) {
          Map<String, String> dataMap = userSql.mysqli_fetch_assoc(x);
          if (dataMap.get("email") != null) {
            v_email.add(dataMap.get("email"));
          }
        }
        String emailJson = gson.toJson(v_email);

        out.print(emailJson);
      }
    } else {
      out.print("Invalid process");
    }
  }
} catch (Exception e) {
out.print(e);
}
%>

<%-- /////////////////////////////////////////////// --%>
<%-- //// THIS PROJECT IS A DEATH SENTENCE T_T ///// --%>
<%-- /////////////////////////////////////////////// --%>
