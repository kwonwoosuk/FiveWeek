//
//  NotifcationViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/23/25.
//

import UIKit

class NotificationViewController: UIViewController {
    
    let textField = SignTextField(placeholderText: "노티피케이션을 통한 값전달")
    let nextButton = PointButton(title: "저장하기")
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
        
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, // 관찰자 추가
                                               selector: #selector(jackReceivedNotification), // 밑에꺼 받으면 실행할 구문!
                                               name:NSNotification.Name("Jack"), // 어떤신호를 받을건데? "jack"이라는 이름 가진애 받을거야
                                               object: nil)
        NotificationCenter.default.addObserver(self, // 관찰자 추가
                                               selector: #selector(sesacReceived), // 밑에꺼 받으면 실행할 구문!
                                               name:NSNotification.Name("sesac"), // 어떤신호를 받을건데? "jack"이라는 이름 가진애 받을거야
                                               object: nil)
    }
    
    @objc
    func sesacReceived() {
        print(#function)
    }
    
    @objc
    func nextButtonClicked() {
        print(#function)
        
        // notification을 통해 값을 보내기 - 코드 외울 필요 없음 이런맥락이구나 ~
        NotificationCenter.default.post(name: NSNotification.Name("Jack"),
                                        object: nil,
                                        userInfo: ["nickname":"나야", "value": textField.text!])
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func jackReceivedNotification(value: NSNotification) {
        if let name = value.userInfo!["value"] as? String {
            print(self, name)
        } else {
            print(self, "안옴")
        }
        
        
    }
    
    func configureLayout() {
        view.addSubview(textField)
        view.addSubview(nextButton)
         
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
    
    
    
    
    
}
