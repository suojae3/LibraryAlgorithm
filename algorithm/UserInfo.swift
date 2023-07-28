//
//  userInfo.swift
//  algorithm
//
//  Created by Jooyeon Kang on 2023/07/26.
//

import Foundation

//대출 목록 데이터
struct TestCase {
    let userId: String
    let tilte: String
    var date: String
}

var testCaseList: [Int:TestCase] = [
    1:TestCase(userId: "userId1", tilte: "momo", date: "2023-06-30"),
    2:TestCase(userId: "userId2", tilte: "삼국지", date: "2023-07-30"),
    3:TestCase(userId: "userId1", tilte: "slam dunk", date: "2023-08-30"),
    4:TestCase(userId: "userId3", tilte: "그해여름", date: "2023-09-30")
]

//예약 목록 데이터
struct TestCaseReserve {
    let userId: String
    let tilte: String
    var reserve: Int
}

var testCaseReserveList: [Int:TestCaseReserve] = [
    1:TestCaseReserve(userId: "userId1", tilte: "모모", reserve: 1),
    2:TestCaseReserve(userId: "userId2", tilte: "삼국지", reserve: 2),
    3:TestCaseReserve(userId: "userId1", tilte: "슬램덩크", reserve: 1),
    4:TestCaseReserve(userId: "userId3", tilte: "그해여름", reserve: 1)
]

//회원 정보 데이터
struct TestCaseUserInfo {
    var name: String
    var email: String
}

var testCaseUserInfoList: [String:TestCaseUserInfo] = [
    "userId1":TestCaseUserInfo(name: "강유저", email: "test1@test.com"),
    "userId2":TestCaseUserInfo(name: "김유저", email: "test2@test.com"),
    "userId3":TestCaseUserInfo(name: "고유저", email: "test3@test.com"),
]

enum UserInfoError: Error {
    case isEmpty, isMissMatch
}

enum UserInfoOption: Int {
    case backMain, lendBook, reserveBook, userInfo
}

class UserInfo {
    
    var showMenuSwitch = true
    
    var userId: String = ""
    
    func start() {

        while userId.isEmpty {
            do {
                try userId = checkUserId()
            } catch {
                inputErrorMessage(error: error)
            }
        }
        
        
        while showMenuSwitch {
            do {
                try showMenu()
            } catch {
                inputErrorMessage(error: error)
            }
        }
    }
    
    func inputErrorMessage(error: Error) {
        switch error {
        case UserInfoError.isEmpty: print("빈칸입니다")
        case UserInfoError.isMissMatch: print("일치하지 않습니다")
        default: print("에러가 발생했습니다")
        }
    }
    
    func checkUserId() throws -> String {
        let userIdList: [String] = ["userId1", "userId2", "userId3", "userId4", "userId5"]
        
        print("ID를 입력해 주세요")
        
        guard let input = readLine(), !input.isEmpty else {
            throw UserInfoError.isEmpty
        }
        
        if userIdList.contains(input) {
            return input
        } else {
            throw UserInfoError.isMissMatch
        }
    }
    
    func showMenu() throws {
        
        print("""
            
            1 대출 도서 목록
            2 예약 도서 목록
            3 회원 정보 수정
            0 돌아가기
            메뉴를 입력해 주세요
            """)
        
        guard let input = readLine(), !input.isEmpty else {
            throw UserInfoError.isEmpty
        }
        
        guard let option = Int(input), option >= 0, option < 4 else {
            throw UserInfoError.isMissMatch
        }
        
        let number = UserInfoOption(rawValue: option)
        
        switch number {
        case .backMain: break
        case .lendBook: showLendBook()
        case .reserveBook: showReserveBook()
        case .userInfo: showUserInfo()
        default: break
        }
        
        showMenuSwitch = false
    }
    
    func showLendBook() {
        
        let lendBookList = testCaseList.filter({ $0.1.userId == userId })
    
        if lendBookList.isEmpty {
            print("대출한 책이 없습니다")
        }
        
        for i in lendBookList {
            
            let result = checkOverdue(dateString: i.value.date)
            
            print("""
            
            대출도서명 : \(i.value.tilte)
            반납예정일 : \(i.value.date)
            연체 : \(result)
            """)
        }
        
        showRenewBook()
    }
    
    func showRenewBook() {
        
        print("""

        1 대출 연장하기
        0 돌아가기
        """)
        
        var input = readLine() ?? ""
        
        while input == "" {
            print("빈칸입니다")
            input = readLine() ?? ""
        }
        
        if let number = Int(input) {
            if number == 1 {
                inputRenewBookInfo()
            } else {
                start()
                showMenuSwitch = true
            }
        }
    }
    
    func inputRenewBookInfo() {
        print("연장할 도서명을 입력해 주세요")
        
        var title = readLine() ?? ""
        
        while title == "" {
            print("빈칸입니다")
            title = readLine() ?? ""
        }

        let renewBook = testCaseList.filter({ $0.1.userId == userId && $0.1.tilte == title })
    

        guard let lendDate = renewBook.first?.value.date else { return }


        let result = checkOverdue(dateString: lendDate)

        if result == "연체중입니다" {
            print("연체중입니다. 대출 연장 불가")
            start()
            showMenuSwitch = true
        }
        
        
        //형식 체크, 과거 날짜 체크 등 많지만 일단 생략..
        print("연장할 날짜를 입력해 주세요 (형식 2023-07-12)")
        
        var renewDate = readLine() ?? ""
        
        while renewDate == "" {
            print("빈칸입니다")
            renewDate = readLine() ?? ""
        }
        
        testCaseList[renewBook.first!.key]?.date = renewDate
        
        print("""
            대출 연장되었습니다
            """)
        
        showRenewBook()
    }
    
    func checkOverdue(dateString: String) -> String {
        
        let today = Date()
        
        let fomatter = DateFormatter()
        fomatter.dateFormat = "yyyy/MM/dd"
        
        let date = fomatter.date(from: dateString)

        //orderedAscending 반납예정일 6/29 < 오늘 날짜 7/27
        let isOerdue = date?.compare(today) == .orderedAscending ? "연체중입니다" : ""

        return isOerdue
    }
    
    func showReserveBook() {
        
        let lendReserveList = testCaseReserveList.filter({ $0.1.userId == userId })
    
        if lendReserveList.isEmpty {
            print("대출한 책이 없습니다")
        }
        
        for i in lendReserveList {
            
            print("""
            
            예약도서명 : \(i.value.tilte)
            예약대기자 : \(i.value.reserve)
            """)
        }
        
        start()
        
        //내가 몇 번째 대기자인지도 원래라면 나오지 않을까..
        //대기 취소도 할 수 있지 않아야할까..?
    }
    
    func showUserInfo() {
        
        let userInfo = testCaseUserInfoList.filter({ $0.key == userId })

        for i in userInfo {
            print("""
            아이디 : \(i.key)
            a 이름 : \(i.value.name)
            b 이메일 : \(i.value.email)
            """)
        }

        print("변경할 것을 선택해 주세요")
        
        guard let input = readLine(), !input.isEmpty else {
            print("빈칸입니다")
            return
        }
        
        changeUserInfo(option: input)
    }
    
    func changeUserInfo(option: String) {
        
        print("변경할 사항을 입력해 주세요")
        
        var changeText = ""
        changeText = readLine() ?? ""
        
        while changeText == "" {
            print("빈칸입니다. 다시 입력해 주세요")
            changeText = readLine() ?? ""
        }
        
        if option == "a" {
            testCaseUserInfoList[userId]?.name = changeText
        } else if option == "b" {
            testCaseUserInfoList[userId]?.email = changeText
        }

        showUserInfo()
    }
}

