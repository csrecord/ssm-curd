package com.chen.crud.dao;

import com.chen.crud.pojo.Employee;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
import com.chen.crud.pojo.Employee;
import com.chen.crud.pojo.EmployeeExample;

import java.util.List;
import java.util.Random;
import java.util.UUID;

/**
 * @Description
 * @Author OneIce
 * @Date 2021/3/21 14:31
 */
@SpringJUnitConfig(locations = "file:src/main/webapp/WEB-INF/applicationContext.xml")
class EmployeeMapperExtTest {
    @Autowired
    private EmployeeMapperExt employeeMapperExt;
    @Autowired
    private DepartmentMapperExt departmentMapperExt;
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Test
    void queryByExampleWithDept() {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdLessThan(5).andEmpIdGreaterThan(1);
        List<Employee> emps = employeeMapperExt.queryByExampleWithDept(example);
        emps.forEach(employee -> System.out.println(employee));
    }

    @Test
    void queryByIdWithDept() {
        Employee emp = employeeMapperExt.queryByIdWithDept(1);
        System.out.println(emp);
    }

    @Test
    void insert() {
    }

    @Test
    void init() {
        //插入几个部门
//        departmentMapperExt.insertSelective(new Department(null, "开发部"));
//        departmentMapperExt.insertSelective(new Department(null, "测试部"));
//        departmentMapperExt.insertSelective(new Department(null, "设计部"));
        //插入几个员工
        employeeMapperExt.insertSelective(new Employee(null, "Rack", 1, "Rack@qq.com", 1));
        employeeMapperExt.insertSelective(new Employee(null, "Jerry", 2, "Jerry@qq.com", 2));
        employeeMapperExt.insertSelective(new Employee(null, "Noddles", 1, "Noddles@qq.com", 2));
        employeeMapperExt.insertSelective(new Employee(null, "Mary", 2, "Noddles@qq.com", 1));
    }

    @Test
    void batchInsert() {
        EmployeeMapperExt mapperForBatch = sqlSessionTemplate.getMapper(EmployeeMapperExt.class);
        Random random = new Random();
        for (int i = 0; i < 300; i++) {
            String name = "chensheng" + UUID.randomUUID().toString().substring(0, 3) + i;
            int gender = random.nextInt(2) + 1;
            String email = name + "@qq.com";
            int dId =  random.nextInt(3) + 1;
            mapperForBatch.insertSelective(new Employee(null, name, gender, email, dId));
            //mapperForBatch.deleteByPrimaryKey(i);
        }
    }
}
