package com.chen.crud.service;

import com.chen.crud.pojo.Department;
import org.springframework.stereotype.Service;
import com.chen.crud.dao.DepartmentMapperExt;

import java.util.List;


@Service
public class DepartmentService {
    private DepartmentMapperExt departmentMapper;

    public DepartmentService(DepartmentMapperExt departmentMapper) {
        this.departmentMapper = departmentMapper;
    }

    /** 查询所有部门 */
    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
