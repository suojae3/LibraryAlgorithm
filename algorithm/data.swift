
import Foundation

//MARK: 도서 데이터 ==================================================================

//책정보
struct Book {
    let title: String
    let author: String
    var isLend: Bool
    let genre: String
    var sales: Int
}

//도서관 책 소장 목록
var library: [String: Book] = [
    
    "Book1": Book(title: "Book1", author: "Author1", isLend: true, genre: "Essay", sales: 1),
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

//회원정보
struct Member {
    let name: String
    let phoneNumber: String
    var borrowedBooks: [String]
}

var members: [String: Member] = [
    "종혁": Member(name: "종혁", phoneNumber: "1", borrowedBooks: ["Book1"]),
    "주연k": Member(name: "주연k", phoneNumber: "2", borrowedBooks: []),
    "주연j": Member(name: "주연j", phoneNumber: "3", borrowedBooks: []),
    "서진": Member(name: "서진", phoneNumber: "4", borrowedBooks: []),
    "은서": Member(name: "은서", phoneNumber: "5", borrowedBooks: []),
]

