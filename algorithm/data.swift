
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
var test = "test"
//도서관 책 소장 목록
var library: [String: Book] = [
    
    "book1": Book(title: "book1", author: "Author1", isLend: true, genre: "Essay", sales: 1),
    "book2": Book(title: "book2", author: "Author2", isLend: false, genre: "Essay", sales: 2),
    "book3": Book(title: "book3", author: "Author3", isLend: false, genre: "Essay", sales: 3),
    "book4": Book(title: "book4", author: "Author4", isLend: false, genre: "Essay", sales: 4),
    "book5": Book(title: "book5", author: "Author5", isLend: false, genre: "Fiction", sales: 5),
    "book6": Book(title: "book6", author: "Author6", isLend: false, genre: "Fiction", sales: 6),
    "book7": Book(title: "book7", author: "Author7", isLend: false, genre: "Fiction", sales: 7),
    "book8": Book(title: "book8", author: "Author8", isLend: false, genre: "Non-Fiction", sales: 8),
    "book9": Book(title: "book9", author: "Author9", isLend: false, genre: "Non-Fiction", sales: 9),
    "book10": Book(title: "book10", author: "Author10", isLend: false, genre: "Non-Fiction", sales: 10)
    
]

//회원정보
struct Member {
    let id: Int
    let name: String
    let phoneNumber: String
    var borrowedBooks: [String]
}

var members: [String: Member] = [
    "jonhyuck": Member(id: 1, name: "종혁", phoneNumber: "1", borrowedBooks: ["book1"]),
    "juyeon_k": Member(id: 2, name: "주연k", phoneNumber: "2", borrowedBooks: []),
    "juyeon_j": Member(id: 3, name: "주연j", phoneNumber: "3", borrowedBooks: []),
    "seojin": Member(id: 4, name: "서진", phoneNumber: "4", borrowedBooks: []),
    "eunseo": Member(id: 5, name: "은서", phoneNumber: "5", borrowedBooks: []),
]
