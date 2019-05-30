~~~ java
class Solution {
    public int solution(int[] A) {
        int result = 0;
        for(int i=0; i<A.length; i++) {
            result = result ^ A[i];
        }
        return result;
    }
}
~~~

## 중복 값 제거

배열안에 값 중 중복 값을 제거하고 남은 값을 리턴한다.

XOR연산자를 이용하여 입력 값이 같지 않을때만 result에 값을 저장한다.

