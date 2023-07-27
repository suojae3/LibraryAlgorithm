//
//  Return.swift
//  algorithm
//
//  Created by 배은서 on 2023/07/25.
//

import Foundation

class Return {
    var memberList = [Member(id: "123", bookList: ["세이노의 가르침", "아기 판다 푸바오", "도둑맞은 집중력"]),
                      Member(id: "456", bookList: ["건널목의 유령"]),
                      Member(id: "789", bookList: [])]
    
    var id = ""
    var memberIndex = 0
    var bookList: [String] = []
    
    func start() {
        inputInfo()
        returnBook()
    }
    
    func inputInfo() {
        print("회원ID를 입력해주세요.")
        var inputID = readLine() ?? ""
        checkID(inputID)
        
        while id.isEmpty {
            print("잘못된 ID입니다. 다시 입력해주세요.")
            inputID = readLine() ?? ""
            checkID(inputID)
        }
    }
    
    func checkID(_ inputID: String) {
        memberList.enumerated().forEach {
            if inputID == $0.element.id {
                id = inputID
                memberIndex = $0.offset
                bookList = $0.element.bookList
            }
        }
    }
    
    func returnBook() {
        if bookList.isEmpty {
            print("반납할 도서가 없습니다.\n")
        } else {
            print("대출하신 도서 목록입니다.")
            print("-------------------------")
            bookList.enumerated().forEach {
                print("\($0.offset): \($0.element)")
            }
            print("-------------------------")
            print("반납하실 책 번호를 입력해주세요.")
            
            var bookNumber = Int(readLine() ?? "") ?? 0
            
            while bookNumber > bookList.count || bookNumber < 0 {
                print("잘못된 번호입니다. 다시 입력해주세요.")
                bookNumber = Int(readLine() ?? "") ?? 0
            }
            
            memberList[memberIndex].bookList.remove(at: bookNumber)
            
            print("반납 완료되었습니다.")
            
            if !memberList[memberIndex].bookList.isEmpty {
                print("대출하신 도서 목록입니다.")
                print("\(memberList[memberIndex].bookList)")
            }
            
            print("계속 반납하고 싶으시다면 1번, 종료하고 싶으시다면 2번을 눌러주세요.")
            
            var lastOption = Int(readLine() ?? "") ?? 0
            lastOption = checkOptionNumber(lastOption)
            
            if lastOption == 1 {
                start()
            }
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
}
