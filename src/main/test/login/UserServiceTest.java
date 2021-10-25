//package login;
//
//import static org.junit.Assert.assertEquals;
//
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import com.wemccm.common.pojo.UserListPojo;
//import com.wemccm.user.dao.UserDao;
//import com.wemccm.user.service.UserService;
//
//@RunWith(SpringRunner.class)
//@ContextConfiguration("classpath:application.yml")
//@SpringBootTest
//public class UserServiceTest {
//
//	@Autowired
//	UserService service;
//
//	@Autowired
//	UserDao dao;
//
//	@Test
//	public void test() {
//
//		ApplicationContext context = new ClassPathXmlApplicationContext("classpath*:application.yml");// 这里路径之前没有配对于是一直出错
//		service = (UserService) context.getBean("service");
//
//		List<UserListPojo> list = service.listAllUser();
//
//		for (UserListPojo userListPojo : list) {
//			System.out.println(userListPojo.getEmail());
//		}
//
//		assertEquals(1, 1);
//
//	}
//
//}
