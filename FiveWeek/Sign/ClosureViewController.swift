//
//  ClosureViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/23/25.
//

import UIKit

class ClosureViewController: UIViewController {

    private let textField = SignTextField(placeholderText: "클로저를 통한 값전달")
    private let nextButton = PointButton(title: "저장하기")
    
    // 화면전환 시 값 전달
    var contents: ((String) -> Void)?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        view.backgroundColor = .white
        
//        textField.text = contents
    }
    
    @objc
    func nextButtonClicked() {
        print(#function)
//        contents?(textField.text!)
        contents?("123")
        
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
