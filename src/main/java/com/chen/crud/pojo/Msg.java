package com.chen.crud.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 这是一个通用的【返回信息】类
 */
public class Msg {

    /** 错误码 */
    private ErrorCodeEnum errorCode;
    /** 返回给用户的数据 */
    private Map<String, Object> dataMap = new HashMap<>();

    public Msg(ErrorCodeEnum errorCode) {
        this.errorCode = errorCode;
    }

    /** 方便地获取一个表示"OK"的Msg对象 */
    public static Msg success() {
        Msg msg = new Msg(ErrorCodeEnum.OK);
        return msg;
    }

    /**
     * 添加返回数据
     * @param name  数据的名称
     * @param value 数据的内容
     * @return this本身
     */
    public Msg add(String name, Object value) {
        dataMap.put(name, value);
        return this;
    }

    public ErrorCodeEnum getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(ErrorCodeEnum errorCode) {
        this.errorCode = errorCode;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    @Override
    public String toString() {
        return "Msg{" +
                "errorCode=" + errorCode +
                ", dataMap=" + dataMap +
                '}';
    }
}
