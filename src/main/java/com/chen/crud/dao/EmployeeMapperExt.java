package com.chen.crud.dao;

import com.chen.crud.pojo.Employee;
import com.chen.crud.pojo.EmployeeExample;

import javax.annotation.Resource;
import java.util.List;

@Resource
public interface EmployeeMapperExt extends EmployeeMapper{
    List<Employee> queryByExampleWithDept(EmployeeExample example);

    Employee queryByIdWithDept(Integer empId);
}
