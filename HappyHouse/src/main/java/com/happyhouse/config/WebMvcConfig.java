package com.happyhouse.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		List<String> list = new ArrayList<>();
		list.add("/api/**");
		list.add("/user/updatepage");
		list.add("/user/update");
		list.add("/userlist/**");
		list.add("/userinfo/**");
		list.add("/delete/**");
		
		registry.addInterceptor(new PermissionIntercepter()).addPathPatterns(list);
	}
}
