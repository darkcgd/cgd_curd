package com.cgd.crud.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cgd.crud.bean.Employee;
import com.cgd.crud.bean.User;
import com.cgd.crud.bean.UserExample;
import com.cgd.crud.dao.DepartmentMapper;
import com.cgd.crud.dao.EmployeeMapper;
import com.cgd.crud.dao.UserMapper;

/**
 * 测试dao层的工作
 * @author lfy
 *推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们�?要的组件
 *1、导入SpringTest模块
 *2、@ContextConfiguration指定Spring配置文件的位�?
 *3、直接autowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 测试DepartmentMapper
	 */
	@Test
	public void testCRUD(){
	/*	//1、创建SpringIOC容器
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		//2、从容器中获取mapper
		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);*/
		//System.out.println(departmentMapper);
		
		//1、插入几个部�?
		//departmentMapper.insertSelective(new Department(null, "开发部"));
		//departmentMapper.insertSelective(new Department(null, "测试部"));
		
		//2、生成员工数据，测试员工插入
		//employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "Jerry@cgd.com", 1));
		
		//3、批量插入多个员工；批量，使用可以执行批量操作的sqlSession�?
		
//		for(){
//			employeeMapper.insertSelective(new Employee(null, , "M", "Jerry@cgd.com", 1));
//		}
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i = 0;i<1000;i++){
			String uid = UUID.randomUUID().toString().substring(0,5)+i;
			mapper.insertSelective(new Employee(null,uid, "M", uid+"@cgd.com", 1));
		}
		System.out.println("批量完成");
		
	}
	
	//自定义条件来查询  
    @Test  
    public void testSelectByExample() {  
        UserExample userExample=new UserExample();  
        //通过Criteria构造查询条件  
        UserExample.Criteria criteria=userExample.createCriteria();  
        criteria.andNameEqualTo("dark_cgd_1").andPwdEqualTo("123456");  
        //可能返回多条记录  
        List<User> list=userMapper.selectByExample(userExample);  
        for (int i = 0; i < list.size(); i++) {  
        	User it=list.get(i);  
            System.out.println(it.getId()+":"+it.getName());  
        }  
        System.out.println("查询结束");
    }  


}
