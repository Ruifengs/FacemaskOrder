package com.facemask.exception;


/**
 * 重复预约处理器
 * @author 许锐锋
 */

public class RepeatOrderException extends RuntimeException{

    private String message;

    public RepeatOrderException(String message) {
        super(message);
    }

    public RepeatOrderException(String message, Throwable cause) {
        super(message, cause);
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
