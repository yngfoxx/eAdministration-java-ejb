<%--
    Document   : login
    Created on : May 31, 2020, 6:00:41 AM
    Author     : YoungFox
--%>

<%@page import="java.util.Map"%>
<%@page import="config.mysqli_query"%>
<%
  //HttpSession session = request.getSession(); // handles session variables
  String email = new String(request.getParameter("email"));
  String password = new String(request.getParameter("password"));
  String error;
  // password encryption will be implemented later on (hopefully XD)
  /**
  *------------------------------------------------
  * USER AUTHENTICATION
  *------------------------------------------------
  * validate user email and password
  **/
  mysqli_query sql = new mysqli_query("SELECT * FROM users WHERE email='"+ email +"'");
  if (sql.mysqli_num_rows() == 1) {
    Map<String,String> result = sql.mysqli_fetch_assoc(0);
    String db_pass = new String(result.get("password"));
    String userID =  new String(result.get("id"));
    if (db_pass.equals(password)) { // successful login
      session.setAttribute("uID", userID);
      session.setAttribute("logged_in", true);
      out.print("<a>Loading...</a><br>");

      // redirect to dashboard
      String site = new String("../../p/dashboard.jsp");
      response.setStatus(response.SC_MOVED_TEMPORARILY);
      response.setHeader("Location", site);
    } else {
      out.print("INCORRECT: "+db_pass+"<br>");
    }
    error = new String(sql.result());
  } else {
    out.print("User not logged in<br>");
    out.print("email = "+email+"<br>");
    error = new String(sql.result());
  }

  out.print(error);
%>
