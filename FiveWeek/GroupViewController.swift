//
//  GroupViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/21/25.
//

import UIKit
import Kingfisher

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
    //링크만 담을 곳
    var firstValue = ""
    var secondValue = ""
    var thirdValue = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        PhotoManager.shared.getAPhoto(id: "yd4daZHEtcA")
//        PhotoManager.shared.getATopic(id: "wallpapers")
        PhotoManager.shared.callRequest(api: .randomPhoto)
        PhotoManager.shared.callRequest(api: .photo(query: "yd4daZHEtcA"))
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
        
//        let group = DispatchGroup()
//        
//        
//        
//        
//        group.enter()
//        PhotoManager.shared.getRandomPhoto { photo in
//            //print(photo.urls.thumb) // kf.setImage
//            self.firstValue = photo.urls.thumb
//            group.leave()
//        } failHandler: {
//            group.leave()
//        }
//        
//        group.enter()
//        PhotoManager.shared.getRandomPhoto { photo in
//            self.secondValue = photo.urls.thumb
//            group.leave()
//        } failHandler: {
//            group.leave()
//        }
//        
//        group.enter()
//        PhotoManager.shared.getRandomPhoto { photo in
//            self.thirdValue = photo.urls.thumb
//            group.leave()
//        } failHandler: {
//            group.leave()
//        }
//        // 누가 먼저 끝나는지는 핸들링 할 수는 없음 그래도 셋다 끝난 시점을 알 수 있다 !
//        // 뷰 갱신이 보통 들어가게 되는데 일반적으로 queue부분에 Main을 넣어준다 !
//        group.notify(queue: .main) {
//            print("끝") // -> true일 경우 메인에서 동작중
//            self.firstImageview.kf.setImage(with: URL(string: self.firstValue))
//            self.secondImageview.kf.setImage(with: URL(string: self.secondValue))
//            self.thirdImageview.kf.setImage(with: URL(string: self.thirdValue))
            
//        }
    }
}
