
import Foundation
let main = readInput()

struct Register{
    var member :Int = 0
    var number: Int = 0
    var name: String = ""
    var home: Int = 0


    //회원등록 메인화면
    func inputInfo(){
        
        print("회원등록 페이지 입니다. ")
        print("회원등록을 하시고싶으시면 1번, 홈으로 돌아가려면 2번을 눌러주세요. ")
        
    }
    func inputMember() {
        var member: Int = 0
        inputInfo()
        member = Int(readLine() ?? "") ?? 0
        if member == 1 {
            memberName()
        }
        else if member == 2 {
            readInput() //메인화면으로 돌아가기
        }
        else{
            print("잘못입력하셨습니다 다시입력해주세요. ")
            print("회원등록을 하고싶으시면 1번, 홈으로 돌아가려면 2번을 눌러주세요. ")
            inputMember()
        }
    }
        
        func memberName(){
            var name: String = ""
            print("회원명을 입력해주세요. ")
            name = readLine() ?? "";
            phoneNumber()
    
        }
        
        func phoneNumber(){
            var number: Int = 0
            print("전화번호를 입력해주세요. ")
            number = Int(readLine()!)!
            emailId()
        }
        
        func emailId(){
            var email: String = ""
            print("이메일을 입력해주세요 . ")
            email = readLine() ?? "";
            memberCkeck()
        }
     
    func memberCkeck(){
        var check : String = "name" + String(number) + "email"
        print(check)
        print("위의 정보가 맞으실까요?")
        print("맞으시면 1번 재입력을 원하시면 2번을 눌러주세요. ")
        var number : Int = 0
        number = Int(readLine() ?? "") ?? 0
        if number == 1 {
            print("등록 완료 되었습니다. ")
            //check 의 입력값 배열에 넣기
            var check:[String]
        }
        else if number == 2 {
          return memberName()
            
        }}

    }
