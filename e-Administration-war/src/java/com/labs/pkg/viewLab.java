/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.labs.pkg;

import config.mysqli_query;
import java.util.Map;

/**
 *
 * @author YoungFox
 */
public class viewLab {

    private String name;
    private String capacity;

    public viewLab(String labName) {
        mysqli_query sql = new mysqli_query("SELECT * FROM labs WHERE labName = '"+labName+"'");
        if(sql.mysqli_num_rows() > 0){
            Map<String, String> lab = sql.mysqli_fetch_assoc(0);
            this.name = lab.get("labName");
            this.capacity = lab.get("labCapacity");
        }
    }
    
    protected void finalize()
    {
        capacity = null;
        name = null;
    }
    
    public String get_name(){
        return name;
    }
    
    public String get_capacity(){
        return capacity;
    }
}
