## 로그인 처리를 하는 서블릿

~~~java
package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import biz.LoginBiz;
import entity.LoginEntity;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id + " " + pwd);
	try {
		LoginBiz biz = new LoginBiz();
		LoginEntity entity = biz.getLoginUser(id, pwd);
		
		if(entity != null) {
			HttpSession session = request.getSession();
			session.setAttribute("logOK", entity);	
			RequestDispatcher rd = request.getRequestDispatcher("/log/menu.jsp");
			rd.forward(request, response);		
			response.sendRedirect("/log/logtest/loginOK.jsp");
		}else {
			response.sendRedirect("/log/logtest/loginFail.jsp");
		}
	  }catch(SQLException e) {}
	}
}


~~~

* 코드 설명 : 넘어온 ID와 PW 값을 request.getParameter로 받아와서 biz로 넘긴다. biz에서는 DB처리를 하는 Dao로 값을 넘겨 해당 ID와 PW가 존재하는지 확인하고 있다면 entity에 회원 정보를 넘겨서 Servlet으로 반환 해준다. entity에 값이 존재하면 session을 logOK로 설정후 로그인 성공 페이지로 넘긴다.

* 모르는 것 
  *  세션 객체가 어떻게 쓰이는지랑 왜 쓰였는지 잘 이해가 안된다.
     *  세션이란 웹 서버 쪽의 웹 컨테이너에 상태를 유지하기 위한 정보를 저장하는 것 이다.
     *  웹 브라우저당 하나씩 생성되어 웹 컨테이너에 저장 된다.

* 단어 정리 

  * request.getParameter() : 서버로 날아온 값을 지정 해준다.

  * session : 서버가 해당 서버로 접근한 클라이언트를 식별하는 방법 
