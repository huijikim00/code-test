import (
"fmt"
"os"
"log"
)

func main() {
// 로그 설정 (표준 출력)
log.SetOutput(os.Stdout)
// 로그 메시지 출력
log.Println("리케이션 시작...")
fmt.Println("Hello, World!")
log.Println("애플리케이션 종료...")
}
