//
//  PracticeViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/23/25.
//

import UIKit

class PracticeViewController: UIViewController {

    let textField = SignTextField(placeholderText: "값전달 연습")
    private let saveButton = PointButton(title: "저장하기")
    
    var contents: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        view.backgroundColor = .white

        
        
        
    }
    
    func showSetTextField() {
        
    }
    
    @objc
    func saveButtonClicked() {
        print(#function)
        guard let text = textField.text else { return }
        contents?(text) // -> 실행한 후의 동작은 mainviewcon에서 하는데 파라미터로 입력받은 text: String을 가져가서 value에 넣어준다 
        
      
        navigationController?.popViewController(animated: true)
    }
    
    
    func configureLayout() {
        view.addSubview(textField)
        view.addSubview(saveButton)
        
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        saveButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
    }
}
