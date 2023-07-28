//
//  reserve.swift
//  Library-Reserve
//
//  Created by t2023-m0045 on 2023/07/27.
//

import Foundation

class Reserve {
    var userID: String = ""
    var numCheck: Int?
    var id: String = ""
    
    
    func start() {
        readInput()
    }
    
    //--- 좌석예약 프로그램 메인 화면 ------------------------------------------------------------------------------------
    func readInput() {
        var option = 0
        print("-------------------------------------")
        print(" 좌석예약 프로그램입니다. 열람실을 선택해 주세요.")
        print("-------------------------------------\n")
        print("1. 제 1 열람실")
        print("2. 제 2 열람실\n")
        print("0. 돌아가기")
        
        // 메뉴 선택 번호
        option = Int(readLine() ?? "") ?? 0
        
        if option == 1{
            handleRoom1()
        }
        else if option == 2{
            handleRoom2()
        }
        // else if option == 3{메인화면 변수 ?()}
        
        else{print("번호를 다시 입력해 주세요.")
            return readInput()
        }
    }
    
    
    //--- 제 1 열람실 메인 화면 ----------------------------------------------------------------------------------------
    func handleRoom1(){
        var room1 = 0
        
        print("--------------------------------------")
        print(" 제 1 열람실입니다. 원하시는 메뉴를 선택해 주세요.")
        print("--------------------------------------\n")
        print("1. 좌석 확인")
        print("2. 예약 확인\n")
        print("0. 돌아가기\n")
        
        room1 = Int(readLine() ?? "") ?? 0
        if room1 == 1{
            roomSeatCheck1()
        }
        else if room1 == 2{
            reserveCheck1()
        }
        else if room1 == 0{
            readInput()
        }
        else{print("번호를 다시 입력해 주세요.")
            return handleRoom1()
        }
    }
    
    
    //--- 제 1 열람실 좌석확인 및 예약 -----------------------------------------------------------------------------------
    var option = 0
    let seat1 : [Int: Int] = [1: 01, 2: 06, 3: 19, 4: 52, 5: 70]
    
    func roomSeatCheck1(){
        if seat1.isEmpty{
            print("예약 가능한 좌석이 없습니다.")
        } else {
            print("---------------------------------------")
            print("[제 1 열람실] 의 잔여석은 [\(seat1.count)] 석입니다.")
            print("잔여 좌석번호를 확인하여 좌석번호를 입력해 주세요.\n")
            print("예약 가능 좌석번호 : \(seat1.values)")
            print("--------------------------------------\n")
            print("1. 좌석번호 입력")
            print("2. 이전으로 돌아가기")
            
            option = Int(readLine() ?? "") ?? 0
            if option == 1{
                seatNumber1()
            } else if option == 2{
                handleRoom1()
            } else {
                print("번호를 다시 입력해 주세요.")
                return roomSeatCheck1() // 제1열람실 예약 페이지
            }
            
            // 좌석번호 입력 후 예약
            func seatNumber1() {
                print("예약하실 좌석번호를 입력해 주세요.")
                numCheck = Int(readLine() ?? "")
                guard let numCheck = numCheck
                else {
                    return
                }
                while !seat1.values.contains(numCheck) {
                    print("잘못 입력하셨습니다. 예약이 가능한 좌석번호를 입력해 주세요.")
                    var numCheck = Int(readLine() ?? "")
                    guard let numCheck = numCheck
                    else {
                        continue
                    }
                    print("예약하실 회원님의 ID를 입력해 주세요.")
                    break
                }
                
                print("예약하실 회원님의 ID를 입력해 주세요.")
                id = readLine() ?? ""
                while id == "" {
                    print("잘못된 ID입니다. ID를 다시 입력해 주세요.")
                    id = readLine() ?? ""
                }
                return seatReserveCheck()
                
                func seatReserveCheck() {
                    print("""
                    --------------------------------
                     좌석번호  \(numCheck)
                     회원 ID  \(id)
                    --------------------------------
                     이 정보로 좌석을 예약하시겠습니까?
                     예약하기는 1번, 뒤로가기는 2번을 눌러주세요.
                    """)
                    
                    guard let input = readLine(), let option = Int(input) else {return}
                    if option == 1{
                        seatResert()
                    } else if option == 2{
                        seatNumber1()
                    } else {
                        print("번호를 다시 입력해 주세요.")
                        return seatNumber1()
                    }
                }
                func seatResert() {
                    print("예약이 완료되었습니다.")
                    print("1. 예약 내역 확인")
                    print("2. 홈으로 돌아가기")
                    
                    guard let input = readLine(), let option = Int(input) else {return}
                    if option == 1{
                        reserveCheck1()
                    } else if option == 2{
                        start()
                    } else {
                        print("번호를 다시 입력해 주세요.")
                        return seatResert()
                    }
                }
            }
            
        }
        
    }
    
    
    //--- 제 1 열람실 예약확인 -----------------------------------------------------------------------------------------
    func reserveCheck1() {
        print("--------------------------")
        print("예약할 때 사용한 ID를 입력해주세요.")
        print("--------------------------")
        
        
    }
    
    
    
    
    
    
    //--- 제 2 열람실 메인 화면 ----------------------------------------------------------------------------------------
    func handleRoom2(){
        var room2 = 0
        
        print("--------------------------------------")
        print(" 제 2 열람실입니다. 원하시는 메뉴를 선택해 주세요.")
        print("--------------------------------------\n")
        print("1. 좌석 확인")
        print("2. 예약 확인\n")
        print("0. 돌아가기\n")
        
        room2 = Int(readLine() ?? "") ?? 0
        if room2 == 1{
            roomSeatCheck2()
        }
        else if room2 == 2{
            reserveCheck2()
        }
        else if room2 == 0{
            readInput()
        }
        else{print("번호를 다시 입력해 주세요.")
            return handleRoom2()
        }
    }
    
    
    //--- 제 2 열람실 좌석확인 및 예약 -----------------------------------------------------------------------------------
    func roomSeatCheck2(){
        var option = 0
        let seat2 : [Int] = [] // 좌석이 없을 때
        
        if seat2.isEmpty {
            print("----------------------")
            print(" 예약 가능한 좌석이 없습니다.")
            print(" 이전 화면으로 돌아갑니다.")
            print("----------------------\n")
            return handleRoom2()
        }
        else {
            print("----------------------------------------")
            print("[제 2 열람실] 의 잔여석은 [\(seat2.count)] 석입니다.")
            print("잔여 좌석번호를 확인하여 좌석번호를 입력해 주세요.\n")
            print("예약 가능 좌석번호 : \(seat2)")
            print("----------------------------------------\n")
            print("1. 좌석번호 입력")
            print("2. 이전으로 돌아가기")
        }
        
        option = Int(readLine() ?? "") ?? 0
        if option == 1{
            seatNumber2()
        }
        else{print("번호를 다시 입력해 주세요.")
            return roomSeatCheck2() // 제 2 열람실 예약 페이지
        }
        
        func seatNumber2() {
            // 좌석번호 입력 창
            // 좌석번호를 입력해주세요.
        }
    }
    
    
    //--- 제 2 열람실 예약확인 -----------------------------------------------------------------------------------------
    func reserveCheck2() {
        
    }
    
}
