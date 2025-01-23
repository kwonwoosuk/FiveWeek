//
//  SearchViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/22/25.
//

import UIKit
import SnapKit


final class SearchViewController: UIViewController, UITextFieldDelegate {
    
    let textField = UITextField()
    func example() { //  얘가 실행되는건지 상속받은곳에서 실행되는건지 컴파일타임에 알지 못한다 - 나의 메서드가 어디까지 영향을 미칠까... 컴파일 타임엔 몰러...
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = . white
        view.addSubview(textField)
        
        textField.backgroundColor = .yellow
        textField.delegate = self
        
        textField.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.top.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
//        override func viewDidDisappear(_ animated: Bool) {
//            textField.resignFirstResponder()
//        }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("리턴키 클릭")
        textField.resignFirstResponder() //  직접 코드로 설정해주어야한다 <- 키보드를 내리는 기능은 아님 방법중 하나일 뿐
        return true   // 키보드 리턴키 클릭했을때 키보드 내려줌
    }
    
    
}

