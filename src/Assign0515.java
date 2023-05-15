import java.util.Scanner;

// 문제 파악 : 
// 1. 입력값을 두 개 받는다.
// 2. 'a'의 값만큼 'b'에 입력된 숫자를 더한다

// 유추 파악 : b의 값 String 변환/ loop / Math.min / 아스키코드

// 단어 선정 : 정수 a / 문자열 b  / 결과값 rs  
public class Assign0515 {
    
        public static void main(String[] args) {
            Scanner scanner = new Scanner(System.in);
    
            System.out.print("a의 값을 입력하세요: ");
            int a = scanner.nextInt(); //정수
    
            System.out.print("b의 값을 입력하세요: ");
            String b = scanner.next(); //문자열
    
            int rs = addNumbers(a, b);
            System.out.println("결과값: " + rs);
        }
    
        public static int addNumbers(int a, String b) {
            int sum = 0;
    
            for (int i = 0; i < Math.min(a, b.length()); i++) {
                int add = b.charAt(i) - '0';
                sum += add;
            }
    
            return sum;
        }
    }
    