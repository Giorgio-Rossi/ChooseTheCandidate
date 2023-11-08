package com.servlets.pw2.controller;


import javax.servlet.http.HttpServletRequest;

public class ErrorManager {
    static String Error = "NO";
    static String SuccessMessage = "OK";

    static String Other = "OTHER";

    public static void setErrorMessage(String msg, HttpServletRequest request){
        request.setAttribute(Error, msg);
    }

    public static String getErrorMessage(HttpServletRequest request) {
        String error = (String) request.getAttribute(Error);
        if(error == null){
            return "";
        }else{
            return error;
        }
    }

    public static void setSuccessMessage(String msg, HttpServletRequest request){
        request.setAttribute(SuccessMessage, msg);
    }

    public static String getSUccessMessage(HttpServletRequest request) {
        String success = (String) request.getAttribute(SuccessMessage);
        if(success == null){
            return "";
        }else{
            return success;
        }
    }

    public static void setOtherMessage(String msg, HttpServletRequest request){
        request.setAttribute(Other, msg);
    }

    public static String getOtherMessage(HttpServletRequest request) {
        String other = (String) request.getAttribute(Other);
        if(other == null){
            return "";
        }else{
            return other;
        }
    }


}
