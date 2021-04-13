/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.labs.pkg;

import config.mysqli_query;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author YoungFox
 * YoungFox is my nickname, username and gaming name
 * Copyright - Osunrinde Adebayo Stephen
 */
public class lab {

    public static String LID; // Stores lab ID
    public static String NAME; // Stores labs name
    public static String CAPACITY; // Stores lab max capacity
    public static String SERVER; // Stores Server ID
    public static String ADMIN; // stores admin ID
    public static String DATE_CREATED; // stores the date of lab data creation
    public static int USER_COUNT; // store occupied students count
    public static String e_message = "";

    public lab(){
        // default constructor // to avoid errors
        LID = "";
    }
    
    public lab(String id) {
        LID = id;
        mysqli_query sql = new mysqli_query("SELECT * FROM labs WHERE labID = '"+id+"'");
        if(sql.mysqli_num_rows() == 0){
            // lab is invalid
            e_message += "[Lab does not exists.]";
        } else if(sql.mysqli_num_rows() == 1){
            // lab is valid
            e_message += "[Lab is valid.]";
            Map<String, String> data = sql.mysqli_fetch_assoc(0);
            NAME = data.get("labName");
            CAPACITY = data.get("labCapacity");
        }
    }
    
    // validate lab existence by name
    public boolean validateByName(String name) {
        boolean result;
        mysqli_query sql = new mysqli_query("SELECT * FROM labs WHERE labName = '"+name+"'");
        switch (sql.mysqli_num_rows()) {
            case 0:
                // lab is invalid
                e_message += "[Lab by name does not exists.]";
                result = false;
                break;
            case 1:
                // lab is valid
                e_message += "[Lab by name is valid.]";
                Map<String, String> data = sql.mysqli_fetch_assoc(0);
                LID = data.get("labID");
                CAPACITY = data.get("labCapacity");
                SERVER = data.get("labServer");
                ADMIN =  data.get("labAdminID");
                DATE_CREATED =  data.get("dateCreated");
                result = true;
                break;
            default:
                result = false;
                break;
        }
        return result;
    }
    
    public boolean create(HashMap<String,String> lab){
        boolean result;
        if(lab.size() > 0){
            // fetch field names and values
           NAME = lab.get("lab_name");
           CAPACITY = lab.get("lab_capty");
           SERVER = lab.get("lab_server");
           ADMIN = lab.get("lab_admin");
           // insert lab details into database
           String qry = "INSERT INTO labs(labID, labName, labCapacity, labServer, labAdminID) VALUES ('"+LID+"', '"+NAME+"', '"+CAPACITY+"', '"+SERVER+"', '"+ADMIN+"')";
           mysqli_query sql = new mysqli_query(qry);
           if(sql.result().equals("true")) { // validate query execution
               result = true;
           } else {
               e_message += "[SQL execution failed] Fetched => "+sql.result();
               result = false;
           }
        } else {
            e_message += "[Parsing parameter failed]";
            result = false;
        }
        return result;
    }
    
    // fetch all existing labs
    public ArrayList<String> get_labs(String fetchBy) {
        ArrayList<String> fetched = new ArrayList<>();
        String qry = "SELECT * FROM labs";
        mysqli_query sql = new mysqli_query(qry);
        
        if (sql.mysqli_num_rows() > 0){
                for(int i = 0; i < sql.mysqli_num_rows(); i++) {
                    Map<String, String> result = sql.mysqli_fetch_assoc(i);
                    if (fetchBy.equals("id")) {
                        if (result.get("labID") != null) {
                            fetched.add(result.get("labID"));
                        }
                    } else if (fetchBy.equals("name")) {
                        if (result.get("labName") != null) {
                            fetched.add(result.get("labName"));
                        }
                    }
                }
            }
        return fetched;    
    }
    
    public String get_name() {
        return NAME;
    }
    
    public String get_id() {
        return LID;
    }
    
    public String get_capty() {
        return CAPACITY;
    }
    
    public String error(){
        return e_message;
    }
}
