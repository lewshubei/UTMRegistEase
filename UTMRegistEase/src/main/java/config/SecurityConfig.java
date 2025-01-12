package config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	 private DataSource dataSource;
		
			@Override
		    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		        auth.jdbcAuthentication()
		            .dataSource(dataSource)
		            .passwordEncoder(new BCryptPasswordEncoder())
		            .usersByUsernameQuery("SELECT username, password, enabled FROM users WHERE username = ?")
		            .authoritiesByUsernameQuery("SELECT username, role AS authority FROM users WHERE username = ?");
		    }
		    
			@Override
		    protected void configure(HttpSecurity http) throws Exception {
		        http
		                .authorizeRequests(requests -> requests
		                        .antMatchers("/student/**").hasRole("STUDENT")
		                        .antMatchers("/admin/**").hasRole("ADMIN")
		                        .antMatchers("/academic/**").hasRole("ACADEMIC")
		                        .antMatchers("/home/**").authenticated()
		                        .anyRequest().permitAll())
		                .formLogin(login -> login
		                        .loginPage("/login")
		                        .loginProcessingUrl("/login") 
		                        .successHandler(customAuthenticationSuccessHandler())
		                        .permitAll())
		                .logout(logout -> logout
		                        .logoutUrl("/logout")
		                        .logoutSuccessUrl("/login")
		                        .permitAll())
		                .csrf(csrf -> csrf.disable());
			}

		    @Bean
		    public BCryptPasswordEncoder passwordEncoder() {
		        return new BCryptPasswordEncoder();
		    }
		    
		    @Bean
		    public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
		        return new AuthenticationSuccessHandler() {
		            @Override
		            public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
		                                                Authentication authentication) throws IOException, ServletException {
		                Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		                if (roles.contains("ROLE_STUDENT")) {
		                    response.sendRedirect("/UTMRegistEase/student/viewTimetable");
		                } else if (roles.contains("ROLE_ADMIN")) {
		                    response.sendRedirect("/UTMRegistEase/admin/viewTimetable");
		                } else if (roles.contains("ROLE_ACADEMIC")) {
		                    response.sendRedirect("/UTMRegistEase/academic/home");
		                } else {
		                    response.sendRedirect("/home/dashboard");
		                }
		            }
		        };
		    }
}
