package com.chen.crud.controller;

import com.chen.crud.pojo.Department;
import com.chen.crud.pojo.Msg;
import com.chen.crud.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    private DepartmentService departmentService;

    public DepartmentController(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    /** 查询部门列表 */
    @GetMapping("/depts")
    @ResponseBody
    public Msg getDepts() {
        List<Department> depts = departmentService.getDepts();
        Msg msg = Msg.success();
        msg.add("depts", depts);
        return msg;
    }
}