package sy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sy.model.User;
import sy.service.UserServiceI;
/**
 * 
 * @author 超红
 * 访问加*.do      例如:http://love137:8080/springMvcMabatics/showUser.do
 */
@Controller
public class testController {
	
	@Autowired
	private UserServiceI userService;
	
	private static final Logger LOGGER = Logger.getLogger(testController.class);
	
	@RequestMapping("/showUser")
	public String showUser(HttpServletRequest request,HttpServletResponse response) {
		
//		User u = userService.getUserById("12301");
//		request.setAttribute("user", u);
//		LOGGER.info("查询id为"+u.getId()+"的用户");

		return "jsp/MyJsp";
	}
}
