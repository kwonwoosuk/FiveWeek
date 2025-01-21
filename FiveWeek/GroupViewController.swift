//
//  GroupViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/21/25.
//

import UIKit

class GroupViewController: UIViewController {
    
    let firstImageview = {
        let view = UIImageView()
        view.backgroundColor = .green
        return view
    }()
    
    let secondImageview = {
        let view = UIImageView()
        view.backgroundColor = .red
        return view
    }()
    
    let thirdImageview = {
        let view = UIImageView()
        view.backgroundColor = .brown
        return view
    }()
    
    
    let checkButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        return btn
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    
    func configureView() {
        view.backgroundColor = .white
        view.addSubview(firstImageview)
        view.addSubview(secondImageview)
        view.addSubview(thirdImageview)
        view.addSubview(checkButton)
        
        checkButton.addTarget(self, action: #selector(checkButtontapped), for: .touchUpInside)
        
        firstImageview.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.centerX.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        secondImageview.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(firstImageview.snp.bottom).offset(20)
        }
        
        thirdImageview.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(secondImageview.snp.bottom).offset(20)
        }
        
        
        checkButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.bottom.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        
    }
    @objc
    func checkButtontapped() {
        print(#function)
        
    }
}
