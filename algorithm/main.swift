import Foundation

enum Options: Int {
    case close, lend, returnBook, search, reserve, register, info
}

func readInput() -> String? {
    print("안녕하세요 00도서관 도서관리 키오스크입니다\n\n도서대출을 원하신다면 1번\n도서반납을 원하신다면 2번\n도서검색을 원하신다면 3번\n좌석예약을 원하신다면 4번\n회원등록을 원하신다면 5번\n회원정보를 원하신다면 6번\n종료는 0번을 눌러주세요")
    return readLine()
}

var keepRunning = true

while keepRunning {
    guard let input = readInput(), let inputNumber = Int(input), inputNumber >= 0, inputNumber <= 6 else {
        print("번호를 잘못 입력하셨습니다, 재안내를 시작합니다\n\n")
        continue
    }

    if let option = Options(rawValue: inputNumber) {
        switch option {
        case .close:
            print("도서관리 프로그램을 종료합니다")
        case .lend:
            print("도서대출 프로그램입니다")
        case .returnBook:
            print("도서반납 프로그램입니다")
        case .search:
            print("도서검색 프로그램입니다")
        case .reserve:
            print("도서예약 프로그램입니다")
        case .register:
            print("도서등록 프로그램입니다")
        case .info:
            print("회원정보 프로그램입니다")
            let userInfo = UserInfo()
            userInfo.start()
        }
    }

    keepRunning = false
}

