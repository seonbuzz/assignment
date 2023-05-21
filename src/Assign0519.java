import java.util.Arrays;
import java.util.Scanner;

public class Assign0519 {
    // 문제 파악 : 
    // 1. 찾고자 하는 숫자의 위치
    // 2. 숫자 찾기
    // 3. 정렬 과정에서 숫자 찾기
    
    // 유추 파악 : 찾고자 하는 숫자의 위치 :index, if문
    //           숫자 - [], for문
    
    // 변수 이름 선정 :   

    public static void main(String[] args) {
        
    int[] arr = {1, 5, 9, 2, 3, 8, 4, 10, 6, 7};
    int a ;

    for(int i=0; i<10; i++){
        for(int j=0; j< 9 -i; j++){
            if(arr[j] > arr[j] +1){
                a = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = a;
            }
        }

    }

    
    for(int i=0; i <10; i++){
        System.out.println(arr[i]);
        System.out.println(Arrays.asList(arr).indexOf('1'));
    }
 }
}
