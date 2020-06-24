package com.facemask.exception;

/**
 * 预约异常
 */
public class OrderException extends Exception {

    public OrderException(String message){
        super(message);
    }
    public OrderException(String message, Throwable cause) {
        super(message, cause);
    }
}
