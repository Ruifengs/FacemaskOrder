package com.facemask.exception;

/**
 * 库存不足异常
 */
public class NoNumberException extends RuntimeException{
    private String message;
    public NoNumberException(String message) {
        super(message);
    }

    public NoNumberException(String message, Throwable cause) {
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
