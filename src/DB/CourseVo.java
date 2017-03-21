package DB;

public class CourseVo {
	String course_id;
	String title;
	String professor_id;
	String type;
	int year;
	int term;
	String classroom;
	int nop;
	public int getNop() {
		return nop;
	}
	public void setNop(int nop) {
		this.nop = nop;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	private int credits;
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		 this.course_id = course_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		 this.title = title;
	}
	public int getCredits() {
		return credits;
	}
	public void setCredits(int credits) {
		this.credits = credits;
	}
	
	public String getprofessor_id() {
		return professor_id;
	}
	public void setprofessor_id(String professor_id) {
		this.professor_id = professor_id;;
	}

}
