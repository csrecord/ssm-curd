package com.chen.crud.controller;

import com.chen.crud.pojo.Employee;
import com.chen.crud.service.EmployeeService;
import org.springframework.stereotype.Controller;

@Controller
public class EmployeeController {
    //Controller层调用service层
    private EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

}
