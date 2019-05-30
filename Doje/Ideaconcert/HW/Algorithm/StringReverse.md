## 문자열 반대로 찍기

* 해결 해야 되는 점

  * 문자열을 입력받고 거꾸로 출력 해야함
  * StringBuffer를 이용

* 수도 코드

  스트링 버퍼 선언

  문자열 입력 받음

  ​	버퍼에 문자열 append

  버퍼.reverse()출력

* 코드 화

  ~~~ java
  package code;
  
  import java.util.Scanner;
  
  public class Code1 {
  
  	public static void main(String[] args) {
  		Scanner in = new Scanner(System.in);
  		StringBuffer stb = new StringBuffer(); // 스트링 버퍼 선언
  		
  		System.out.println("문자열 입력해 주세요.");
  		String str = in.next();
  		
  		stb.append(str); // 버퍼안에 append
  		
  		System.out.println(stb.reverse()); // 거꾸로 출력
  	}
  
  }
  ~~~
