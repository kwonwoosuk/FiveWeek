//
//  DelegateViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/23/25.
//

import UIKit

class DelegateViewController: UIViewController {
    
    
    private let textField = SignTextField(placeholderText: "딜리게이트를 통한 값전달")
    private let nextButton = PointButton(title: "저장하기")
    
    // 화면전환 시 값 전달
    var contents: PassDataDelegate?
    // texfield.delegate = self
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        view.backgroundColor = .white
        
        
    }
    
    @objc
    func nextButtonClicked() {
        print(#function)
        
        // 동일한 인스턴스의 메인뷰컨트롤러를 어케 가꼬오제?
        //MainViewController() // 이렇게 부를때마다 다른 녀석임
        
        // 타입으로서의 프로토콜을 활용해보자 !!
        
        contents?.nicknameReceived(value: textField.text!)
        
        navigationController?.popViewController(animated: true)
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
