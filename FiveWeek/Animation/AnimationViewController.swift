//
//  AnimationViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/31/25.
//

import UIKit
import SnapKit
import Lottie
// 0131
final class AnimationViewController: UIViewController {
    
    
    private let animationImageView = LottieAnimationView(name: "test1")
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none //  자동으로 첫글자 대문자
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let loginButton =  UIButton()
//    {
//        let button = UIButton(type: .system)
//        button.setTitle("로그인", for: .normal)
//        button.backgroundColor = .systemPurple
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 5
//        return button
//    }()
//    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "계정이 없으신가요? 회원가입"
        label.textColor = .systemBlue
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "S-CoreDream-9Black", size: 14)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupAnimation()
        setupLoginButton()
        
        
        // 실제 폰트명과 파일명은 다름. 찍어보자!
        for family in UIFont.familyNames {
            print(family)
            for name in UIFont.fontNames(forFamilyName: family) {
                print(">>> \(name)")
            }
        }
        
        /* 실제이름
         S-Core Dream
         >>> S-CoreDream-1Thin
         >>> S-CoreDream-5Medium
         >>> S-CoreDream-9Black
         */
    }
    
    func setupLoginButton() {
        
//        loginButton.tintColor = .red // 프로퍼티
        // 입맛대로 바꺼
        loginButton.configuration = .sesacStyle()
        
        
            
        
        
    }
    
    func setupAnimation() {
        // 시작 isHidden => false 서서히 안보이고 보이도록
        emailTextField.alpha = 0
        passwordTextField.alpha = 0
        logoImageView.alpha = 0
        loginButton.alpha = 0
        signUpLabel.alpha = 0
        logoImageView.alpha = 0
        logoImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform(rotationAngle: 500)
        } completion: { _ in // 애니메이션 끝난후에 처리할 것들을 적어주는 곳
            self.animationEmailTextField()
        }
           
        
    }
    
    
    private func animationEmailTextField() {
        UIView.animate(withDuration: 0.3) {
            self.emailTextField.alpha = 1
        } completion: { _ in
            self.animationPasswordTextField()
        }
    }
    
    
    private func animationPasswordTextField() {
        UIView.animate(withDuration: 0.3) {
            self.passwordTextField.alpha = 1
        } completion: { _ in
            self.animationButton()
        }
    }
    
    private func animationButton() {
        UIView.animate(withDuration: 0.3) {
            self.loginButton.alpha = 1
        } completion: { _ in
            self.animationLabel()
        }
    }
    
    private func animationLabel() {
        UIView.animate(withDuration: 0.3) {
            self.signUpLabel.alpha = 1
        } completion: { _ in
            self.animationImageView.play()
        }
    }
    

    private func setupViews() {
        view.backgroundColor = .white
        
        [logoImageView, emailTextField, passwordTextField, loginButton, signUpLabel]
            .forEach { view.addSubview($0) }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.width.height.equalTo(100)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(44)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.left.right.height.equalTo(emailTextField)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.left.right.equalTo(emailTextField)
            make.height.equalTo(44)
        }
        
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
        view.addSubview(animationImageView)
        
        animationImageView.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.bottom.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    
    
}
