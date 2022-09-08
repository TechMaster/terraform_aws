package vn.techmaster.demoupload.config;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {
  @Value("${upload.path}")
  private String uploadPath;

  @Value("${photo.path}")
  private String photoPath;

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    System.out.println("/" + photoPath + "/**");
    System.out.println("file:" + uploadPath + "/");
    registry.addResourceHandler("/" + photoPath + "/**").addResourceLocations("file:" + uploadPath + "/");
  }
}