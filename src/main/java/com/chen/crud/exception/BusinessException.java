package com.chen.crud.exception;

import com.chen.crud.pojo.ErrorCodeEnum;

//处理业务逻辑异常
public class BusinessException extends RuntimeException {
    private ErrorCodeEnum errorCodeEnum;

    public BusinessException() {
    }

    public BusinessException(ErrorCodeEnum errorCodeEnum) {
        super(errorCodeEnum.toString());
        this.errorCodeEnum = errorCodeEnum;
    }

    public ErrorCodeEnum getErrorCodeEnum() {
        return errorCodeEnum;
    }
}
