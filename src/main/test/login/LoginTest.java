package login;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.login.service.LoginService;
import com.wemccm.project.service.AvoidedCostDataService;

@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class LoginTest {
//	@Autowired
//	private LoginService serivce;

	@Test
//    @Disabled
//    @DisplayName("wrong email")
	public void email() {
		LoginService serivce=new LoginService();
		String email = "123";
		String password = "123";

		String s = serivce.login(email, password);
		assertEquals(s, "-1");
	}

	@Test
//  @Disabled
//  @DisplayName("wrong password")
	public void password() {
		LoginService serivce=new LoginService();
		String email = "123";
		String password = "123";

		String s = serivce.login(email, password);
		assertEquals(s, "-2");
	}

	@Test
//  @Disabled
//  @DisplayName("right")
	public void right() {
		LoginService serivce =new LoginService();
		String email = "123";
		String password = "123";

		String s = serivce.login(email, password);
		assertEquals((s!="-1")&&(s!="-2"), true);
//		assertEquals((s != "-1") && (s != "-2"), true);
	}

}
