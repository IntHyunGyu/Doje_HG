##  중복이 횟수가 많은 것 부터 내림차순으로 정렬 

* 해결 해야 되는 점

  * 각 각의 문자열의 갯수를 알아내고 문자열을 정렬
  * 값이 같을 때 아스키 코드 값을 비교 하여 스왑

* 수도 코드

  * 문자열에 종류와 갯수를 세어서 Map의 key와 value값으로 저장
  * 문자열을 갯수와 아스키 코드 로 비교하여 위치를 조정

* 코드화

  ~~~ java
  package code;
  
  
  import java.util.HashMap;
  import java.util.Iterator;
  import java.util.Map;
  
  public class Code3B {
  
  	public static void main(String[] args) {
  		String text = "abbbcccdddd";
  		// 사용된 문자별로 개수를 저장
  		Map<Character, Integer> sMap = getCharCountMap(text);
  		
  		String sortStr = sortStr(sMap);
  		System.out.println(sortStr);
  	}
  	
  	// map에 각각 문자열 종류와 갯수를 담아오는 메소드
  	public static Map<Character, Integer> getCharCountMap(String text)
  	{
  		Map<Character, Integer> sMap = new HashMap<Character, Integer>();
  		
  		// 사용된 문자와 개수 구하기
  		for(int i = 0; i < text.length(); i++) {
  			char key = text.charAt(i);
  			
  			// 이미 존재하는 key 일때
  			if(sMap.containsKey(key)) {
  				// 예전에 등록된 개수 가져오기
  				int cnt = sMap.get(key);
  				
  				// 현재 개수 + 1
  				sMap.put(key, cnt + 1); 
  			} else { // 아니라면, 개수를 1로 저장
  				sMap.put(key, 1);
  			}
  		}
  		
  		return sMap;
  	}
      // 정렬 메소드 
      public static String sortStr(final Map<Character, Integer> sMap){
  
          String result = "";
          Iterator<Character> it = sMap.keySet().iterator();
          
          // result 안에 key 값 나열
  		while(it.hasNext()) {
  			result += it.next();
  		}
  		
  		int length = result.length();
  		
  		// result의 길이 만큼 
  		for(int i = 0; i < length; i++) {
  			// result의 j번째와 j+1번째를 비교
  			for(int j = 0; j < length - 1; j++) {
  				char a1 = result.charAt(j);
  				char a2 = result.charAt(j + 1);
  				
  				// j보다 j+1이 크다면
  				if(sMap.get(a1) < sMap.get(a2)) {
  					// result에 j번째 문자열과 j+1번째 문자열을 바꿈
  					result = swap(result, j, j + 1);
  					
  					// 만약 갯수가 같다면
  				} else if(sMap.get(a1) == sMap.get(a2)) {
  					// 둘의 아스키 코드를 비교하여 a1이 크면 문자열을 바꿈
  					if(a1 > a2) {
  						result = swap(result, j, j + 1);
  					}	
  				}	
  			}
  		}
  		return result;
      }
      
      // 문자열 위치를 바꿔주는 메소드
      public static String swap(String str, int i, int j) 
      { 
          char ch[] = str.toCharArray(); 
          char temp = ch[i]; 
          ch[i] = ch[j]; 
          ch[j] = temp; 
          return new String(ch); 
      } 
  }
  ~~~
