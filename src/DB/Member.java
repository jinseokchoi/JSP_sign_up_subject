package DB;
import java.sql.Timestamp;

//자바빈
public class Member {
    //프로퍼티
     protected String id;
    protected String pw;
    protected String name;
    
    //getter
    public String getId() {
        return id;
    }
    //setter
    public void setId(String id) {
        this.id = id;
    }
    public String getpw() {
        return pw;
    }
    public void setpw(String pw) {
        this.pw = pw;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}