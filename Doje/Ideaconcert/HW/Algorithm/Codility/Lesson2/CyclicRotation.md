~~~java
// you can also use imports, for example: // import java.util.*;
// you can write to stdout for debugging purposes, e.g. // System.out.println("this is a debug message");
class Solution {
    public int[] solution(int[] A, int K) {
        int imsi;
        for (int i = 0; i < K; i++) {
            imsi = A[A.length - 1];
            for (int j = A.length - 1; j > 0; j--) {
                A[j] = A[j - 1];
            }
            A[0] = imsi;
        }
        return A;
    }
}
~~~

# 배열 Shift

A[]의 마지막 자리에 수를 imsi 변수에 저장 후 역순으로 한 자리씩 옮긴다. 그 후 마지막으로 저장해 두었던 imsi 변수에 값을 A[]의 첫번째에 저장한다.