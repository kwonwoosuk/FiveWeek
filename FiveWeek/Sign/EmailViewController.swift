//
//  EmailViewController.swift
//  SeSACFiveWeek
//
//  Created by Jack on 1/23/25.
//

import UIKit
import SnapKit

class EmailViewController: UIViewController {
   
    let emailTextField = SignTextField(placeholderText: "이메일을 입력해주세요")
    let nextButton = PointButton(title: "다음")
     
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureLayout()
         
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, // 관찰자 추가
                                               selector: #selector(jackReceivedNotification), // 밑에꺼 받으면 실행할 구문!
                                               name:NSNotification.Name("Jack"), // 어떤신호를 받을건데? "jack"이라는 이름 가진애 받을거야
                                               object: nil)
    }
    
    deinit {
        print(self)
    }
    
    @objc
    func jackReceivedNotification(value: NSNotification) {
        if let name = value.userInfo!["value"] as? String {
            print(self, name)
        } else {
            print(self, "안옴")
        }
        
        
    }
    
    
    @objc func nextButtonClicked() {
        navigationController?.pushViewController(PhoneViewController(), animated: true)
    }
    
    func configureLayout() {
        view.addSubview(emailTextField)
        view.addSubview(nextButton)
         
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

}
