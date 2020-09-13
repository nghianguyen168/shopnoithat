package com.doan.noithat.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
@ComponentScan("com.doan.noithat.*")
@EnableWebMvc // bắt buộc phải có nếu ko có ko chạy đc
public class WebMvcConfig implements WebMvcConfigurer{
	
	
	/*
	@Bean	//dùng để biết đối tượng não`
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver resover = new CommonsMultipartResolver();
		
		return resover;
		
	}
	*/
	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver resover = new CommonsMultipartResolver();
		return resover;
		
	}
	@Bean(name = "viewResolver")
    public ViewResolver getViewResolver() {
        UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
        // TilesView 3
        viewResolver.setViewClass(TilesView.class);
        return viewResolver;
    }
 
    @Bean(name = "tilesConfigurer")// giup tạo và đọc được file tiles.xml
    public TilesConfigurer getTilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        // TilesView 3
        tilesConfigurer.setDefinitions(new String [] {
        		"/WEB-INF/templates/tiles-admin.xml",
        		"/WEB-INF/templates/tiles-furniture.xml"
        });
        return tilesConfigurer;
    }

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");
		registry.addResourceHandler("/images/**").addResourceLocations("/uploads/");
		 registry.addResourceHandler("/ckeditor/**").addResourceLocations("/ckeditor/");
		
		registry.addResourceHandler("/librarie/**").addResourceLocations("/WEB-INF/librarie/");
	}
	
    
    
}
