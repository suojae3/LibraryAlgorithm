import Foundation


//MARK: 도서 데이터 =================================================================

struct Book {
    let title: String
    let author: String
    let isLend: Bool
    let genre: String
    var sales: Int
}


var library: [String: Book] = [

    "Book1": Book(title: "Book1", author: "Author1", isLend: false, genre: "Essay", sales: 1),
    "Book2": Book(title: "Book2", author: "Author2", isLend: false, genre: "Essay", sales: 2),
    "Book3": Book(title: "Book3", author: "Author3", isLend: false, genre: "Essay", sales: 3),
    "Book4": Book(title: "Book4", author: "Author4", isLend: false, genre: "Essay", sales: 4),
    "Book5": Book(title: "Book5", author: "Author5", isLend: false, genre: "Fiction", sales: 5),
    "Book6": Book(title: "Book6", author: "Author6", isLend: false, genre: "Fiction", sales: 6),
    "Book7": Book(title: "Book7", author: "Author7", isLend: false, genre: "Fiction", sales: 7),
    "Book8": Book(title: "Book8", author: "Author8", isLend: false, genre: "Non-Fiction", sales: 8),
    "Book9": Book(title: "Book9", author: "Author9", isLend: false, genre: "Non-Fiction", sales: 9),
    "Book10": Book(title: "Book10", author: "Author10", isLend: false, genre: "Non-Fiction", sales: 10)
    
]


//MARK: 초기화면 =================================================================


enum Options: Int {
    case close, lend, returnBook, search, reserve, register, info
}

func readInput() -> String? {
    print("안녕하세요 00도서관 도서관리 키오스크입니다\n\n도서대출을 원하신다면 1번\n도서반납을 원하신다면 2번\n도서검색을 원하신다면 3번\n좌석예약을 원하신다면 4번\n회원등록을 원하신다면 5번\n회원정보를 원하신다면 6번\n종료는 0번을 눌러주세요\n\n")
    return readLine()
}


mainLoop: while true {
    guard let input = readInput(), let inputNumber = Int(input), inputNumber >= 0, inputNumber <= 6 else {
        print("번호를 잘못 입력하셨습니다, 재안내를 시작합니다\n\n")
        continue
    }

    if let option = Options(rawValue: inputNumber) {
        
        switch option {
            
        case .close:
            print("도서관리 프로그램을 종료합니다")
            break mainLoop
            
        case .lend:
            print("도서대출 프로그램입니다")
            
            
        case .returnBook:
            print("도서반납 프로그램입니다")
            
        case .search:
            handleSearch()
            break
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

// search scene01 ===============================================================

enum SearchOptions: Int {
    case goBack, bookName, bestSeller
}
    
func handleSearch() {
searchLoop: while true {
        print("\n도서이름으로 검색하려면 1번\n베스트셀러를 검색하려면 2번\n처음 화면으로 돌아가려면 0번을 눌러주세요\n")
        guard let input = readLine(), let inputNumber = Int(input), inputNumber >= 0, inputNumber <= 3 else {
            print("\n번호를 잘못 입력하셨습니다, 재안내를 시작합니다\n\n")
            continue
        }
    
        if let searchOption = SearchOptions(rawValue: inputNumber) {
            switch searchOption {
            case .goBack:
                print("\n처음 화면으로 돌아갑니다\n")
                break searchLoop
            case .bookName:
                print("\n도서명을 입력해주세요\n")
                searchTitle()
                break searchLoop
            case .bestSeller:
                bestseller()
                break
                
            }
        }
    }
}
    

// search scene02 ===============================================================

//도서명 검색
func searchTitle() {
titleLoop : while true {
        guard let input = readLine(), !input.isEmpty else {
            print("\n아무것도 입력하지 않으셨습니다, 도서명을 재검색해주세요\n")
            continue
        }
    
        if let book = library[input] {
            print("\n책제목: \(book.title)\n작가: \(book.author)\n대출여부: \(book.isLend ? "대출중" : "대출가능")\n장르: \(book.genre)\n")
        } else {
            print("\n요청하신 도서는 소장되어 있지 않습니다, 다른 도서명을 입력해주세요\n")
            continue
        }
        bookReserve()
    }
}

//베스트 셀러 나열
func bestseller() {
    let saleSorted = library.values.sorted { $0.sales > $1.sales }
    print("베스트셀러 목록은 다음과 같습니다\n ")
    for i in 1...saleSorted.count {
        print("\n\(i)위: \(saleSorted[i-1].title)")
    }
    print("\n도서검색페이지로 이동합니다\n ")
    return
}

// search scene03 ===============================================================

//도서예약
func bookReserve() {
reserveLoop: while true {
    print("\n책예약을 원하신다면 1번 책제목 재검색을 원하신다면 2번을 눌러주세요\n")
    
    guard let input = readLine(), let inputNum = Int(input), inputNum >= 1, inputNum <= 2 else {
        print("\n잘못 입력했습니다. 다시 번호를 입력해주세요\n")
        continue
    }
    
    if inputNum == 1 {
        print("대출함수 호출")
    } else {
        print("도서명을 입력해주세요\n")
        break reserveLoop
    }
}
}

//MARK: 좌석 예약  =================================================================

//code


//MARK: 도서 정보  =================================================================

//code

