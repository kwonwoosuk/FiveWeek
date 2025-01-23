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
    
    // 매개변수에 T타입 명시 - T.Type (메타 타입)
        PhotoManager.shared.example2(api: .randomPhoto, type: RandomPhoto.self) { value in
            print("통신성공")
            dump(value)
        } failHandler: {
            print("통신 실패")
        }

        
        
        let a = plus(a: 3, b: 2)
       // let b = plus(a: "3", b: "2")
        
        Dummy(mainContents: 67, subContents: 67, others: 67)
        Dummy(mainContents: "2", subContents: "12", others: 7)
        
        PhotoManager.shared.example(api: .randomPhoto) { (value: RandomPhoto) in
            print("통신 성공")
            dump(value)
        } failHandler: {
            print("통신 실패한 경우 얼럿")
        }
        
        // 타입어노테이션으로 타입 명시 - 첫번째 방법
        PhotoManager.shared.example(api: .topic(id: "wallpapers")) { (value: Topic) in
            print("통신 성공")
            dump(value)
        } failHandler: {
            print("통신 실패한 경우 얼럿")
        }

        var age: Int = 3
        var name: String = "고래밥"
        var test: String.Type = String.self
        
        
        
        

        var number = Int.random(in: 1...3)
        
        switch number {
        case 1: print("")
        case 2: print("")
        case 3: print("")
        default:
            break
            
            
            
            
        }
        
        
        
        
        
        
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
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
//        becomeFirstResponder()
        
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
