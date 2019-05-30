# 모듈화 실습

###### LoginBiz() : Dao에서 entity를 받아와 Servlet으로 전달

~~~java
/*
	* 파라미터 값 없음
	* entity를 반환
	* Dao에 입력된 ID와 PWD값을 넘겨 회원정보 entity 값을 받아와 Servlet으로전달
*/
package biz;

import dao.LoginDao;
import entity.USERSentity;

public class LoginBiz {
	public USERSentity getLoginUser(String id, String pwd) {
		LoginDao dao = new LoginDao();
		USERSentity entity = dao.getLoginUser(id,pwd);
		System.out.println(entity.getId());
		return entity;
	}
}
~~~

* Entity 객체를 LoginServlet으로 보냄

---

###### getLoginUser() : Dao에서 가장 먼저 실행되는 함수

~~~java
/*
	* 파라미터 값 없음 
	* Select()에서 id, pwd값을 넘겨 회원정보를 받아온후 close()로 객체들을 close시킨다.
	* select에서 담아온 entity를 반환
*/
public LoginEntity getLoginUser(String id, String pwd) {
    Select(id, pwd);		
    close();

    return entity;
}	
~~~

* entity를 반환함

---

###### select() : 두번째로 실행 되는 함수

~~~java
/*
	* 파라미터 값 없음
	* Resultset을 반환
	* tableName()과  makeWheresql()에서 테이블 이름과 where 조건을 가져와 DB에서 해당 ID,PWD에 해당하는 정보를 담아와 Resultset에 담은후 	     rscheck() 메소드에 담아 보냄
*/
private Object Select(String id, String pwd) {
    conn = MyConnectionPool.getInstance().getConnection();

    String tableName = this.getTableName(new USERSentity());
    String wheresql = makeWheresql(tableName);

    String sql = "SELECT * FROM " + tableName + " WHERE " + wheresql;		

    try {
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pwd);		
        rs = pstmt.executeQuery();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return rscheck(rs);
}
~~~

* DB에서 값을 받아와 ResultSet객체에 담아 rscheck()함수에 보냄

---

###### getTableName() : 테이블 명을 가져오는 함수

~~~java
/*
	* 파라미터 값 없음
	* ?????VO에서 VO를 뺀 나머지 결과를 리턴
	* 넘어온 USEREVO에서 VO를 뺀 이름 즉 테이블 이름을 리턴한다.
*/
private String getTableName(Object ob) {
		String className = ob.getClass().getSimpleName().split("VO")[0];
		String vo = className.substring(className.length() - 2, className.length());
		
		if ("VO".equals(vo)) {
			return className.substring(0, className.length() - 2);
		} else {
			throw null;
		}
	}
~~~

* table 이름을 entity에서 잘라와 리턴

---

###### makeWheresql() : table 이름별 where조건문을 리턴하는 함수
/*
​	* 파라미터 값 없음
​	* table 이름 별 where 조건 리턴
​	* 넘어온 tableName별로 where조건을 리
*/
~~~java
private String makeWheresql(String tableName) {
    if(tableName.equals("USERS")) {
        return "id = ? and pwd = ?";
    }
    return null;
}
~~~

* table 이름별로 where조건을 리턴

---

###### rscheck() : 세번째로 실행되는 함수

~~~java
/*
	* 파라미터 값 없음
	* entity 반환
	* rs.next()로 rs에 공백여부를 확인하고 값이 존재하면 set()함수로 넘김
*/
private USERSentity rscheck(ResultSet rs) {
    entity = new  USERSentity();

    try {
        if(rs.next()) {
            set(entity);	
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return entity;
}	
~~~

* rs에 값이 존재하는지 확인하는 함수

---

###### set() : 4번째로 실행되는 함수

~~~java
/*
	* 파라미터 값 없음
	* 리턴 값 없음
	* entity에 값을 저장함
*/
private Object set(Object entity){
    for(Field f : entity.getClass().getDeclaredFields()) {

        f.setAccessible(true);
        String name = f.getName();

        try {
            if(name.equals("point")) {
                f.set(entity, rs.getDouble(name));
            }else {
                f.set(entity, rs.getString(name));
            }
        } catch (IllegalArgumentException | IllegalAccessException | SQLException e) {
            e.printStackTrace();
        }		
    }
    return entity;
}
~~~

* 넘어온 entity에 값을 설정함

---

###### close() : 마지막으로 실행되는 함수(객체들을 close시킴)

~~~java
/*
	* 파라미터 값 없음
	* 리턴 값 없음
	* 최종적으로 DB연동에 사용되었던 객체들을 close 시킴
*/
private void close() {		
    try {
        rs.close();
        pstmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
~~~

* DB연동에 사용되었던 객체들을 종료시킴.

---

* 전역변수란?

  * 전역 이름공간에 정의되어 프로그램 어디서든 부를수 있는	변수이다.

    ~~~ java
    public class test {
        int a;
        public static void main(String args[]){
            int b;
        }
    }
    ~~~

    test라는 클래스 안에 a는 전역변수이고 b는 지역변수이다.
