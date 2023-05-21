public class Assign0521 {
        private static void bubbleSort(int[] arr){
            bubbleSort(arr, arr.length - 1); // 재귀함수 호출
             /*
            배열의 주소와 배열에서 정리가 안 된 부분 마지막 인덱스를 같이 넘김
            처음에는 모든 배열 방이 다 정렬이 안 된 상태 -> 정렬이 안 된 부분의 마지막 인덱스 == 배열의 마지막 인덱스
        */
        }
    
        private static void bubbleSort(int[] arr, int last){
            if(last > 0){ // 마지막 인덱스가 0보다 클 때까지 재귀 함수 호출
         // 버블 정렬을 한 번 마칠 때마다(한 번의 루프롤 돌 때마다) 정렬이 완료되는 값이 +1씩 생김 == 정렬이 완료 되지 않은 값들이 -1씩 줄어듦(배열의 끝부터 차례대로 정렬)
                for(int i = 1 ; i <= last; i++){
                    if(arr[i - 1] > arr[i]){ //내 앞에 있는 애가 나보다 자리가 크면
                        swap(arr, i - 1, i); //자리를 바꾼다
                    }
                }
                bubbleSort(arr, last - 1);
                //// 루프를 한 번 돌면 기존의 정렬이 안 된 부분의 마지막 인덱스가 정렬이 완료 된 상태이므로 마지막 인덱스는 빼고(== -1을 해준 후) 다시 재귀 함수 호출
            }
        }
    
        private static void swap(int[] arr, int source, int target) {
             /*
            ex. arr = [5, 3];
                       0  1
                source = 0 (== 내 앞에 존재하는 값의 인덱스)
                target = 1 (== 나의 인덱스)*/
            int temp = arr[source]; //내 앞에 존재하는 값을(arr[0]==5)을 temp에 넣어줌==5
            arr[source] = arr[target]; //나의 값(arr[1] == 3)을 내 앞의 인덱스(arr[0] = 3)에 넣어줌
            arr[target] = temp;
        }
        // 저장해뒀던 내 앞에 존재하는 값(temp == 5)을 내 인덱스(arr[1] = 5)에 넣어줌

        // 결과 -> [3, 5]
    
        private static void printArray(int[] arr){
            for(int data : arr){
                System.out.print(data + ", ");
            }
            System.out.println();
        }
    
        public static void main(String[] args) {
            int[] arr = {3, 5, 4, 2, 1};
            printArray(arr); //정렬 전
            bubbleSort(arr); //정렬
            printArray(arr); //정렬 한 뒤 결과
        }
    }
