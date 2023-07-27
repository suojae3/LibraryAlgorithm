
import Foundation


//MARK: 도서 데이터 =================================================================

struct Book {
    let title: String
    let author: String
    var isLend: Bool
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
