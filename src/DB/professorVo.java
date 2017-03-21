package DB;

public class professorVo {
	String professor_id;
	String professor_name;
	private String professor_address;
	private String professor_phone;
	private String professor_dept;
	private String password;
	public String getprofessor_id() {
		return professor_id;
	}
	public void setprofessor_id(String professor_id) {
		 this.professor_id = professor_id;
	}
	public String getprofessor_name() {
		return professor_name;
	}
	public void setprofessor_name(String professor_name) {
		this.professor_name = professor_name;
	}
	public String getprofessor_address() {
		return professor_address;
	}
	public void setprofessor_address(String professor_address) {
		this.professor_address = professor_address;
	}
	public String getprofessor_phone() {
		return professor_phone;
	}
	public void setprofessor_phone(String professor_phone) {
		this.professor_phone = professor_phone;
	}
	public String getprofessor_dept() {
		return professor_dept;
	}
	public void setprofessor_dept(String professor_dept) {
		this.professor_dept = professor_dept;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
