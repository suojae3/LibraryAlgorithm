//
//  Search.swift
//  algorithm
//
//  Created by ㅣ on 2023/07/27.
//

import Foundation


class Search {
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

            print("도서대출 함수 실행")
        } else {
            print("도서명을 입력해주세요\n")
            break reserveLoop
        }
    }
    }
}

