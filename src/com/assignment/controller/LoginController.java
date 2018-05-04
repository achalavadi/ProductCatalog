package com.assignment.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.assignment.model.LoginBean;

@Controller
public class LoginController {
	
	private Logger logger = Logger.getLogger(LoginController.class);
	
	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public ModelAndView init(Model model) {
		model.addAttribute("msg", "Please Enter Your Login Details");
		return new ModelAndView("login","login", new LoginBean());

	}
	@Value("${userName1}")
	private String userName1;
	@Value("${password1}")
	private String password1;
	@Value("${userName2}")
	private String userName2;
	@Value("${password2}")
	private String password2;
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView processLogin(@ModelAttribute("loginBean") LoginBean loginBean,BindingResult result) {
		
		logger.info("UserName::" + loginBean.getUserName());

		ModelAndView view=null;
		if (loginBean != null && !StringUtils.isEmpty(loginBean.getUserName())
				&& !StringUtils.isEmpty(loginBean.getPassword() != null)) {
			logger.info("Inside Login Verification");
			
			if ((loginBean.getUserName().equals(userName1) && loginBean.getPassword().equals(password1))
					|| (loginBean.getUserName().equals(userName2) && loginBean.getPassword().equals(password2))) {
				logger.info("Login Successful");
				view = new ModelAndView("redirect:/products");
			}else {
				view = new ModelAndView("loginError","loginError", new LoginBean());
			}
			
		}else {
			view =  new ModelAndView("redirect:login");
		}
		return view;
	}
	

}
