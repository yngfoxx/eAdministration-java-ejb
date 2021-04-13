/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stlib.pkg;

/**
 *
 * @author YoungFox
 */
public class keygen {
    public static int LENGTH;
    public static String CASE;
    
    public keygen(int length, String caseSens){
        LENGTH = length;
        switch(caseSens){
            case "upper":
                CASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789";
                break;
                
            case "lower":
                CASE = "0123456789" + "abcdefghijklmnopqrstuvxyz";
                break;
            
            case "mixed":
                CASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";
                break;
            
            default:
                break;
        }
    }
    
    public String create() {
        StringBuilder s = new StringBuilder(LENGTH);
        for ( int y = 0; y < LENGTH; y++) {
            // generating a random number
            int index = (int)(CASE.length() * Math.random());
            // add Character one by one in end of s
            s.append(CASE.charAt(index));
        }
        return s.toString();
    }
}
