package com.chen.crud.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 封装了错误码和错误描述信息
 * @author OneIce
 * @since 2021/3/22 23:10
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ErrorCodeEnum {
    OK("00000", "一切正确"),
    USER_ERROR("A0001", "用户端错误"),
    REQUEST_PARAM_ERROR("A0400", "用户请求参数错误"),
    REQUIRED_REQUEST_PARAM_EMPTY("A0410", "请求必填参数为空"),
    USERNAME_EXIST("A0111", "用户名已存在"),
    USERNAME_FORMAT_ERROR("A0113", "用户名格式错误"),
    SYSTEM_EXECUTION_ERROR("B0001", "系统执行出错");


    /** 错误码 */
    private String value;
    /** 错误描述信息 */
    private String desc;


    ErrorCodeEnum(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    @Override
    public String toString() {
        return "[" + value + "]" + desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }
}
