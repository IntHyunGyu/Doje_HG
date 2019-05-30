##	중복된 문자열 제거 후 출력

* 해결 해야 되는 점

  * 입력 받은 문자열에서 중복된 값을 제거

* 수도코드

  문자열 입력받음

  결과 저장 변수 선언

  ​	for(입력받은 문자열의 길이만큼) {

  ​		if(결과 저장 변수안에 입력받은 변수의 i번째가 포함되어 있지 않은가) {

  ​			결과 값 += 입력변수 i번째

  ​		}

  ​	}

  결과 값 출력​	

* 코드 화

  ~~~ java
  package code;
  
  import java.util.Scanner;
  
  public class code2 {
  
  	public static void main(String[] args) {
  		System.out.println("문자열 입력해 주세요");
  		Scanner in = new Scanner(System.in);
  		String str = in.next();
  		String result = "";  // 중복 제거 후 출력 값을 저장할 변수
  		
  		for(int i=0; i<str.length(); i++) {
  			if(!result.contains(String.valueOf(str.charAt(i)))) { // result 안에 입력받은 값에 i 번째 값이 있는지 확인
  				result += String.valueOf(str.charAt(i)); // 없을 경우 result에 추가
  			}
  		}
  		System.out.println(result);
  	}
  
  }
  ~~~

* 새로 알게 된 것

  * constains() : 특정 문자열이 포함되어 있는지 확인