/** 
 * -----------------------------------------------------------------------
 * HOW TO USE THE METHODS IN (mysqli_query.java)
 * -----------------------------------------------------------------------
 * Query => mysqli_query sql = new mysqli_query(" _SQL_STATEMENT_GOES_HERE_ ");
 * Rows => sql.mysqli_num_rows(); // get total number of rows
 * Assoc => Map<String,String> result = sql.mysqli_fetch_assoc( _INDEX_VALUE_IS_NEEDED_HERE_ ); // get data from sql
 * FETCH_ASSOC_RESULT => result.get(" _COLUMN_NAME_FROM_DATABASE_ "); // sort data like PHP
 * ERROR_CHECK => sql.result(); // check for errors (RETURNS True(for no errors) or Error message)
 * 
 */

/**
 * -----------------------------------------------------------------------
 * !NOTE!
 * -----------------------------------------------------------------------
 * Only the MySQL service in xampp will work
 * 
 */

package config;


import java.sql.*;
import java.util.*;

/**
 * @author YoungFox
 * YoungFox is my nickname, username and gaming name
 * REAL NAME - Osunrinde Adebayo Stephen
 */
public class mysqli_query {
  //public variables
  public static String query;
  public static int length = 0;
  public static String result = "";
  public static ArrayList<String> db_table = new ArrayList<>();
  public static String exception;

  // class constructor
  public mysqli_query(String qry){
    query = qry; // assign query to public variable
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String db_name = "e_administration"; // database name
        String db_url = "jdbc:mysql://localhost:3306/"+db_name; // database url
        String db_user = "root"; // database username
        String db_pass = ""; // database password
        // connect to MySQL database
        try (Connection con = DriverManager.getConnection( db_url, db_user, db_pass)) {
            Statement stmt = con.createStatement();
            String arr[] = query.split(" ", 2);
            if( arr[0].equals("DELETE") ||
                arr[0].equals("UPDATE") ||
                arr[0].equals("ALTER")  ||
                arr[0].equals("INSERT")){
                int affRows = stmt.executeUpdate(query); // execute modification query
                length = affRows;
            } else {
                ResultSet rs = stmt.executeQuery(query); // execute query            
                if(rs != null){
                    ResultSetMetaData rsmd = rs.getMetaData();
                    rs.last(); // jump to the last item in resultset [to get total number of items in resultSet]
                    length = rs.getRow(); // store total number of rows in length variable
                    rs.beforeFirst(); // jump back to the top
                    
                    /**
                    * ----------------------------
                    * UPDATE db_table ArrayList
                    * ----------------------------
                    * Go through the result to update the ArrayList
                    */
                    int conlen = rsmd.getColumnCount();             
                    while(rs.next()) { // iterate rows
                        HashMap<String, String> tableRow = new HashMap<>();
                        String rowData = "";
                        String colName;
                        String colValue;
                        for (int c = 1; c < conlen; c++){ // iterate column
                            colName = rsmd.getColumnName(c); // column name
                            colValue = rs.getString(c); // column value
                            
                            tableRow.put(colName, colValue); // store column pair in array
                            rowData += colValue; // DEBUG: stores only the column values
                        }
                        db_table.add(tableRow.toString()); // update db_table array with new row data
                    }
                }
            try { rs.close(); } catch (SQLException e) { /* ignored */ }
            try { stmt.close(); } catch (SQLException e) { /* ignored */ }
            }
            try { con.close(); } catch (SQLException e) { /* ignored */ }
        }
    }catch(ClassNotFoundException | SQLException e){ 
        //Error encountered: could not connect to database
        exception = e.getLocalizedMessage();
    }
  }

  public int mysqli_num_rows(){
    // fetches total number of rows from executed query
    return length;
  }
  
  public Map<String, String> mysqli_fetch_assoc(int index){
    String rowData = db_table.get(index); // get row by index from db_table
    /**
     * -----------------------------
     * VARIABLE CONVERSION
     * -----------------------------
     * get map from rowData string
     * convert the string back to map
     * and use the value as the method return value
     **/
    rowData = rowData.substring(1, rowData.length()-1); //remove curly brackets
    String[] keyValuePairs = rowData.split(",");//split the string to create key-value pairs
    Map<String,String> map = new HashMap<>();               

    for(String pair : keyValuePairs) //iterate over the pairs
    {
        String[] entry = pair.split("="); //split the pairs to get key and value 
        map.put(entry[0].trim(), entry[1].trim()); //add them to the hashmap and trim whitespaces
    }
    return map;
  }

  public String result(){ // method used to check for errors
      if(length > 0 && result != null){
          result = "true";
      } else {
          result += "<br>SQL Syntax: "+query;
          result += "<br>Exception: "+exception;
          result += " <font style='font-weight: bold;' color='res'>FAILED</font><br>";
      }
      return result;
  }
}