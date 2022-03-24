package com.chen.crud.converter;

import org.springframework.core.convert.converter.Converter;

import java.util.ArrayList;
import java.util.List;



public class StringToIntegerListConverter implements Converter<String, List<Integer>> {
    private String delimiter = "-";

    public StringToIntegerListConverter() {
    }

    public StringToIntegerListConverter(String delimiter) {
        this.delimiter = delimiter;
    }

    @Override
    public List<Integer> convert(String source) {
        ArrayList<Integer> list = new ArrayList<>();
        if (source.contains(delimiter)) {
            String[] params = source.split(delimiter);
            for (String param : params) {
                list.add(Integer.parseInt(param));
            }
        } else {
            list.add(Integer.parseInt(source));
        }
        return list;
    }
}
