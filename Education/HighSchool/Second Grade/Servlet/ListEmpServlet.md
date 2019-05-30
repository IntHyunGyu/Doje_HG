## 사원 리스트를 검색하는 서블릿

~~~java
package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmpDao;
import entity.Emp;

@WebServlet(name = "List", urlPatterns = { "/list" })
public class ListEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmpDao dao = new EmpDao();
		List<Emp> list = dao.getList();
		
		if(list != null) {
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
			rd.forward(request, response);
		}
	}

}
~~~

* 코드 설명 : dao객체를 생성 후 list에 dao.getList에서 return 한 값을 받아온다.

  list가 nulldl 아니라면 request에 담는다. 그리고 RequestDispatcher를 이용하여 

  List.jsp로 간다.

* 모르는 것

  * RequestDispatcher를 어떻게 사용했는지 기억이 안난다.

    ~~~java
    request.setAttribute("list", list);
    RequestDispatcher rd =  request.getRequestDispatcher("list.jsp");
    ~~~

    * 이런식으로 사용되며 request에 데이터를 담아 그 다음 페이지에서도 볼수 있게 해주는 기능이다.

  * Dao에서 insertDao 부분 

    ~~~java
    public int insertDao(Emp ob) {
    		SqlSession session=factory.openSession();
    		int n=0;
    		try {                      // namespace: id��  
    			n=session.insert("mybatis.empMapper.insertEmp", ob); 
    			session.commit();
    		}catch(Exception e) {
    			session.rollback();
    		}finally {
    			session.close();
    		}
    		return n;
    	}
    ~~~

    이 부분을 잘 모르겠다.

    * mybatis를 이용하여 ob의 데이터를 insert하는 코드 이다.

* 단어 정리

  * RequestDispatcher : 현재 request에 담고 있는 정보를 저장하고 있다가 그 다음페이지, 다음페이지에서도 해당 정보를 볼 수 있게 저장하는 기능을한다.
