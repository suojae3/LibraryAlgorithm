//
//  Lend.swift
//  algorithm
//
//  Created by 배은서 on 2023/07/25.
//

import Foundation

class Lend {
    var book: String = ""
    var id: String = ""
    
    func start() {
        inputInfo()
        lend()
    }
    
    func inputInfo() {
        print("도서명을 입력해주세요.")
        book = readLine() ?? ""
        while book == "" {
            print("잘못된 도서명입니다. 다시 입력해주세요.")
            book = readLine() ?? ""
        }
        
        print("회원ID를 입력해주세요.")
        id = readLine() ?? ""
        while id == "" {
            print("잘못된 ID입니다. 다시 입력해주세요.")
            id = readLine() ?? ""
        }
    }
    
    func lend() {
        print("""
        -----------------------------
        도서명: \(book)
        회원ID: \(id)
        -----------------------------
        이 정보로 도서를 대출할까요?
        맞다면 1번, 수정하고 싶으시다면 2번을 눌러주세요.
        """)
        
        guard let input = readLine(), var option = Int(input) else { return }
        
        option = checkOptionNumber(option)
        
        if option == 1 {
            print("""
            대출되었습니다. 반납 예정일은 \(calculateReturnDate())입니다.
            대출을 계속 하고싶으시다면 1번, 종료하고 싶으시다면 2번을 눌러주세요.
            """)
        } else {
            start()
        }
        
        var lastOption = Int(readLine() ?? "") ?? 0
        lastOption = checkOptionNumber(lastOption)
        
        if lastOption == 1 {
            start()
        }
    }
    
    func checkOptionNumber(_ number: Int) -> Int {
        var inputNumber = number
        while inputNumber > 2 || inputNumber < 1 {
            print("잘못된 번호입니다. 다시 입력해주세요.")
            let input = readLine() ?? ""
            inputNumber = Int(input) ?? 0
        }
        return inputNumber
    }
    
    func calculateReturnDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let returnDate = Calendar.current.date(byAdding: .day, value: 14, to: date) ?? Date()
        return dateFormatter.string(from: returnDate)
    }
    
}
