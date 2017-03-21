package DB;

public class StudentVo {
	String student_id;
	String student_name;
	private String student_address;
	private String student_phone;
	private int tot_cred;
	private String password;
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getStudent_name() {
		 return student_name;
	}
	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStudent_address() {
		return student_address;
	}
	public void setStudent_address(String student_address) {
		this.student_address = student_address;
	}
	public String getStudent_phone() {
		return student_phone;
	}
	public void setStudent_phone(String student_phone) {
		this.student_phone = student_phone;
	}
	public int getTot_cred() {
		return tot_cred;
	}
	public void setTot_cred(int tot_cred) {
		this.tot_cred = tot_cred;
	}
}
