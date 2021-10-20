package login;

import static org.junit.Assert.*;

import org.junit.Test;

import com.wemccm.common.pojo.AvoidedCostassetReplacementItermDataPojo;
import com.wemccm.login.service.LoginService;
import com.wemccm.project.service.AvoidedCostDataService;

public class LoginTest {

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
		LoginService serivce=new LoginService();
		String email = "123";
		String password = "123";

		String s = serivce.login(email, password);
		assertEquals((s!="-1")&&(s!="-2"), true);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
