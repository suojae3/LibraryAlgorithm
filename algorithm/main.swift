import Foundation

//MARK: 초기화면 =================================================================

enum Options: Int {
    case close, lend, returnBook, search, reserve, register, info
}

func readInput() -> String? {
    print("안녕하세요 00도서관 도서관리 키오스크입니다\n\n도서대출을 원하신다면 1번\n도서반납을 원하신다면 2번\n도서검색을 원하신다면 3번\n좌석예약을 원하신다면 4번\n회원등록을 원하신다면 5번\n회원정보를 원하신다면 6번\n종료는 0번을 눌러주세요\n\n")
    return readLine()
}

OUTER: while true {
    guard let input = readInput(), let inputNumber = Int(input), inputNumber >= 0, inputNumber <= 6 else {
        print("번호를 잘못 입력하셨습니다, 재안내를 시작합니다\n\n")
        continue
    }

    if let option = Options(rawValue: inputNumber) {
        switch option {
        case .close:
            print("도서관리 프로그램을 종료합니다")
            break OUTER
        case .lend:
            print("도서대출 프로그램입니다")
            let lend = Lend()
            lend.start()
        case .returnBook:
            print("도서반납 프로그램입니다")
        case .search:
            handleSearch()
        case .reserve:
            print("도서예약 프로그램입니다")
        case .register:
            print("도서등록 프로그램입니다")
        case .info:
            print("도서정보 프로그램입니다")
        }
    }
}

//MARK: 도서 대출  =================================================================

//code

//MARK: 도서 반납  =================================================================

//code

//MARK: 도서 검색  =================================================================

// search data

var bookList: [Int: String] = [:]

// search scene 01
enum SearchOptions: Int {
    case goBack, bookName, bestSeller, searchISBN
}

func handleSearch() {
    while true {
        print("도서이름으로 검색하려면 1번\n베스트셀러를 검색하려면 2번\n이전 검색을 실행하려면 3번\n처음 화면으로 돌아가려면 0번을 눌러주세요\n\n")
        guard let input = readLine(), let inputNumber = Int(input), inputNumber >= 0, inputNumber <= 3 else {
            print("번호를 잘못 입력하셨습니다, 재안내를 시작합니다\n\n")
            continue
        }

        if let searchOption = SearchOptions(rawValue: inputNumber) {
            switch searchOption {
            case .goBack:
                print("처음 화면으로 돌아갑니다\n\n")
                return
            case .bookName:
                print("도서이름으로 검색합니다")
            case .bestSeller:
                print("베스트셀러를 검색합니다")
            case .searchISBN:
                print("ISBN 번호검색을 실행합니다")
            }
        }
    }
}

//MARK: 좌석 예약  =================================================================

//code


//MARK: 도서 정보  =================================================================

//code

