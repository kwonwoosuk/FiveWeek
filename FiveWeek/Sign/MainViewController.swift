//
//  MainViewController.swift
//  SeSACFiveWeek
//
//  Created by Jack on 1/23/25.
//

import UIKit
import SnapKit

protocol PassDataDelegate {
    func nicknameReceived(value: String)
}




class MainViewController: UIViewController {
    
    let statusLabel = UILabel()
    let nextButton = PointButton(title: "처음으로")
    
    let profileButton = PointButton(title: "프로필")
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureLayout()
        
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(closureButtonClicked), for: .touchUpInside)
        
        
        
        NotificationCenter.default.addObserver(self, // 관찰자 추가
                                               selector: #selector(jackReceivedNotification), // 밑에꺼 받으면 실행할 구문!
                                               name:NSNotification.Name("Jack"), // 어떤신호를 받을건데? "jack"이라는 이름 가진애 받을거야
                                               object: nil)
    }
    
    
    
    @objc
    func delgateButtonClicked() {
        
        let vc = DelegateViewController()
        vc.contents = self // mainViewController
        navigationController?.pushViewController(vc, animated: true)
    }
        
    @objc
    func closureButtonClicked() { // ⭐️
        let vc = PracticeViewController()
        
//        func contents(value: String) {
//            print("TEST")
//            self.statusLabel.textColor = .blue
//            self.statusLabel.text = value
//        }
        
//        vc.contents = { value in //  ->  value ==  TextField.text
//            print("TEST")
//            self.statusLabel.textColor = .blue
//            self.statusLabel.text = value
//        }
        vc.textField.text = statusLabel.text
        vc.contents = { value in
            self.statusLabel.textColor = .red
            self.statusLabel.text = value
        }
        
        
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    func sample() {
        print("TEST")
        statusLabel.textColor = .blue
    }
    
    
    @objc
    func jackReceivedNotification(value: NSNotification) {
        print("신호받음")
        statusLabel.text = "5656565656"

        if let name = value.userInfo!["value"] as? String {
            statusLabel.text = name
        } else {
            statusLabel.text = "데이터 안옴"
        }
         
    }
    
    
    
    @objc
    func profileButtonClicked() {
        print(#function)
        //post 전에 observer가 먼저 등록되어 있어야한다.
        NotificationCenter.default.post(name: NSNotification.Name("Jack"),
                                        object: nil,
                                        userInfo: ["value": statusLabel.text!])
        
        
        
        
        
        let vc = NotificationViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
//    @objc
//    func profileButtonClicked(a: Int) {
//    }
    
    
    
    deinit {
        print(self)
    }
    
    
    @objc func nextButtonClicked() {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let window = windowScene.windows.first else { return }
        
      
        
        window.rootViewController = UINavigationController(rootViewController: EmailViewController())
        window.makeKeyAndVisible()
    }
    
    func configureLayout() {
        view.addSubview(statusLabel)
        view.addSubview(nextButton)
        view.addSubview(profileButton)
         
        statusLabel.text = "메인 화면"
        
        
        profileButton.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(200)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(statusLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }

}

extension MainViewController: PassDataDelegate {
    func nicknameReceived(value: String) {
        print(#function)
        statusLabel.textColor = .red
        statusLabel.text = value
    }
    
    
}
