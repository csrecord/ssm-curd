package com.chen.crud.service;

import com.chen.crud.exception.BusinessException;
import com.chen.crud.pojo.EmployeeExample;
import com.chen.crud.pojo.ErrorCodeEnum;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import com.chen.crud.dao.EmployeeMapperExt;
import com.chen.crud.pojo.Employee;


import java.util.List;

//核心：处理和员工相关的业务逻辑
@Service
public class EmployeeService {
    private EmployeeMapperExt employeeMapper;

    public EmployeeService(EmployeeMapperExt employeeMapper) {
        this.employeeMapper = employeeMapper;
    }

    /**
     * 根据要查询的页码和页大小, 分页查询员工数据
     * @param page    当前页码
     * @param rows    当前页大小, 即查询多少条记录
     * @param type    查询条件, 可以为null
     * @param keyword 搜索词, 可以为null
     * @return 所有员工信息
     */
    public PageInfo<Employee> getEmps(int page, int rows, String type, String keyword) {
        PageHelper.startPage(page, rows);
        EmployeeExample example = new EmployeeExample();
        if (StringUtils.hasLength(type) && StringUtils.hasLength(keyword)) {
            switch (type) {
                case "byEmpName":
                    example.createCriteria().andEmpNameLike("%" + keyword + "%");
                    break;
                case "byEmail":
                    example.createCriteria().andEmailLike("%" + keyword + "%");
                    break;
                case "byId":
                    example.createCriteria().andEmpIdEqualTo(Integer.parseInt(keyword));
                    break;
            }
        }
        //将查询到的员工信息放入List中
        List<Employee> emps = employeeMapper.queryByExampleWithDept(example);
        return new PageInfo<>(emps, 5);
    }

    //保存员工信息
    public void saveEmp(Employee employee) {
        if (!StringUtils.hasLength(employee.getEmpName())) {
            throw new BusinessException(ErrorCodeEnum.REQUIRED_REQUEST_PARAM_EMPTY);
        }
        employee.setEmpId(null);
        if (employeeMapper.insertSelective(employee) != -1){
            throw new BusinessException(ErrorCodeEnum.SYSTEM_EXECUTION_ERROR);
        }
    }

    /** 检查员工姓名是否可用, 若可用返回true, 否则返回false */
    public boolean checkEmpName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        return employeeMapper.countByExample(example) == 0; //数据库中不存在
    }

    //根据员工ID查询员工
    public Employee getEmpById(int id){
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpIdEqualTo(id);
        return employeeMapper.queryByExampleWithDept(example).get(0);
    }

    //更新员工
    public void updateEmp(Employee employee){
        if (employeeMapper.updateByPrimaryKeySelective(employee) != 1){
            throw new BusinessException(ErrorCodeEnum.SYSTEM_EXECUTION_ERROR);
        }
    }

    /** 根据员工id删除员工 */
    public void deleteEmp(int empId) {
        if (employeeMapper.deleteByPrimaryKey(empId) != 1) {
            throw new BusinessException(ErrorCodeEnum.SYSTEM_EXECUTION_ERROR);
        }
    }

    /** 批量删除员工 */
    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        example.createCriteria().andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }

}
