package com.chen.crud.controller;


import com.chen.crud.pojo.Employee;
import com.chen.crud.pojo.ErrorCodeEnum;
import com.chen.crud.pojo.Msg;
import com.chen.crud.service.EmployeeService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.regex.Pattern;


@Controller
public class EmployeeController {
    //Controller调用Service层
    private EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    /**
     * 分页查询员工信息, 返回Json数据
     * @param page    页码
     * @param rows    记录数
     * @param type    查询条件, 可以为null
     * @param keyword 搜索词, 可以为null
     * @return 分页数据(包含查询到的员工数据), 由MappingJackson2CborHttpMessageConverter解析成Json字符串
     */
    //ResponseBody用于处理ajax请求
    @ResponseBody
    @GetMapping("/emps")
    public Msg getEmpsWithJson(@RequestParam(value = "page", defaultValue = "1") int page,
                               @RequestParam(value = "rows", defaultValue = "10") int rows,
                               @RequestParam(value = "type", required = false) String type,
                               @RequestParam(value = "keyword", required = false) String keyword) {
        PageInfo<Employee> pageInfo = employeeService.getEmps(page, rows, type, keyword);
        Msg msg = Msg.success();
        msg.add("pageInfo", pageInfo);
        //返回的json数据
        return msg;
    }

    /* 保存员工*/
    @PostMapping("/emps")
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if (result.hasErrors()){
            Msg msg = new Msg(ErrorCodeEnum.REQUEST_PARAM_ERROR);
            for (FieldError fieldError : result.getFieldErrors()) {
                msg.add(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return msg;
        }else{
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    /** 检查员工姓名是否可用 */
    @GetMapping("/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(@RequestParam("empName") String empName) {
        String regex = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,8}$)";
        if (Pattern.matches(regex, empName)) {
            return employeeService.checkEmpName(empName) ? Msg.success() : new Msg(ErrorCodeEnum.USERNAME_EXIST);
        } else {
            return new Msg(ErrorCodeEnum.USERNAME_FORMAT_ERROR);
        }
    }

    //根据员工ID查询员工
    @GetMapping(value = "/emps/{id}")
    @ResponseBody
    public Msg getEmpById(@PathVariable("id") int id){
        Employee employee = employeeService.getEmpById(id);
        return  Msg.success().add("emp",employee);
    }

    //更新员工
    @PutMapping(value = "/emps/{empId}")
    @ResponseBody
    public Msg updateEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    //删除
    @DeleteMapping(value = "/emps/{empIds}")
    @ResponseBody
    public Msg deleteEmp(@PathVariable("empIds") List<Integer> ids){
        if (ids.size() == 1){
            employeeService.deleteEmp(ids.get(0));
        }else {
            employeeService.deleteBatch(ids);
        }
        return Msg.success();
    }
}
