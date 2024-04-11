package dto;

import java.util.Date;

public class UserDTO {
	private String userId;
	private String name;
	private String password;
	private int age;
	private String email;
	private String jobTitle;
	private Date joinDate;
	
	public UserDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public UserDTO(String userId, String name, String password, int age, String email, String jobTitle, Date joinDate) {
		this.userId = userId;
		this.name = name;
		this.password = password;
		this.age = age;
		this.email = email;
		this.jobTitle = jobTitle;
		this.joinDate = joinDate;
	}
	
	public UserDTO(String userId, String name, String password, int age, String email, String jobTitle) {
		this.userId = userId;
		this.name = name;
		this.password = password;
		this.age = age;
		this.email = email;
		this.jobTitle = jobTitle;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", name=" + name + ", password=" + password + ", age=" + age + ", email="
				+ email + ", jobTitle=" + jobTitle + ", joinDate=" + joinDate + "]";
	}
	
	
	
}
