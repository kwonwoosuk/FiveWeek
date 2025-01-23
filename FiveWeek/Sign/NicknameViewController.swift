//
//  NicknameViewController.swift
//  SeSACFiveWeek
//
//  Created by Jack on 1/23/25.
//

import UIKit
import SnapKit

class NicknameViewController: UIViewController {
   
    let nicknameTextField = SignTextField(placeholderText: "닉네임을 입력해주세요")
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
        
        //뒤로 돌아가면 안되니까
//        let vc = MainViewController()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
        
        //window의 rooViewController를 교체 -> 새로운 앱처럼 보여주고 싶다
        // scene + window
        //UIApplication.shared.windows.first ios15부터 디프리케이트 됨
        
        
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//                let window = windowScene.windows.first else { return }
//        
//      
//        
//        window.rootViewController = UINavigationController(rootViewController: MainViewController())
//        window.makeKeyAndVisible()
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func configureLayout() {
        view.addSubview(nicknameTextField)
        view.addSubview(nextButton)
         
        nicknameTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(nicknameTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

}

