//
//  ViewController.swift
//  FiveWeek
//
//  Created by 권우석 on 1/20/25.
//

import UIKit

import SnapKit
import Kingfisher
/*
 1. GCD ... SwiftConcurrency
     - GCD: sync / async / serial / concurrent  매년 공부 계속 공부 -> DispatchGroup  - 코드 내부 동작 원리 측면
  코드 구조적 관점의 접근
    - 네트워크 통신이 여러개면 url은 어떻게 관리 하지? 사이트가 갑자기 바뀌면 링크도 바뀌어야하는데...
     AF.request 똑같이 나오네? 와 같은 고민들이 들면 좋을것 같다
 2. router pattern 한 화면에서 여러 통신이 일어날때 관리?  -- 코드 개선적 측면
    
 */
class ViewController: UIViewController {
    //kingfisher 안쓰고 어떻게 불러오나?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        //serialSync()
        //serialASync()
        //concurrentSync()
        //concurrentAsync()
        example2()
        configureView()
    }
    
    
    //DispatchGroup
    func example2() { //  중요한거 한다잉
        
        let group = DispatchGroup()
        
        print("START")// 모두 끝났을때 alert 띄주고 싶다면?
        DispatchQueue.global().async(group: group) {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        
        print("=====1111=====")
        DispatchQueue.global().async(group: group) {
            for i in 101...200 {
                print(i, terminator: " ")
            }
        }
        
        print("=====2222=====")
        DispatchQueue.global().async(group: group) {
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        print("END")
        
        group.notify(queue: .main) { // 보통은 앱이기때문에 ui업데이트를 한다 -> main으로 신호를 주는겨 그래서
            print("신호받음!")
        }
        
    }
    
    func example() {
        print("START")
        DispatchQueue.global(qos: .userInteractive).async {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        print("=====1111=====")
        DispatchQueue.global(qos: .background).async {
            for i in 101...200 {
                print(i, terminator: " ")
            }
        }
        print("=====2222=====")
        DispatchQueue.global().async {
            for i in 201...300 {
                print(i, terminator: " ")
            }
        }
        print("END")
        
    }
    
    
    func serialSync() { // 직렬 동기  : 일이 끝날때 까지 기다리면서 한곳에서 처리함 :: 아무것도 작성안하고실행시키면 MainTread가 다 합니다 원래
        print("START", terminator: " ")
        
        for i in 1...100 {
            print(i, terminator: " ")
        }
        
        //        DispatchQueue.main.sync { //  모든작업이 끝나고 실행할게 ! 응 나 기다릴게 ! 이거 해달라니까? 응 실행 할거라니까?
        //            //동시성이슈중 교착 상태에 해당한다 ! DeadLock 서로서로 기다리다 죽었따! - 무조건은 아니다
        //            for i in 101...200 {
        //                print(i , terminator: " ")
        //            }
        //        }
        
        print("END", terminator: " ")
    }
    
    func serialASync() { // 직렬 비동기
        print("START", terminator: " ")
        
        DispatchQueue.main.async{
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        for i in 101...200 {
            print(i , terminator: " ")
        }
        print("END", terminator: " ")
    }
    
    func concurrentSync() { // 동시 동기 여러군데에서 실행할건데 그친구 끝나면 실행할거야 //  써봤자 한놈만 일하는 상황이여서 잘 안쓰는 코드 !
        print("START", terminator: " ")
        
        DispatchQueue.global().sync {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        for i in 101...200 {
            print(i , terminator: " ")
        }
        
        print("END", terminator: " ")
    }
    
    func concurrentAsync() { //  끝나는대로 막 그냥 실행 하는거 처럼 보인다 ? <- 내생각
        
        print("START", terminator: " ")
        
        
        for i in 1...100 {
            DispatchQueue.global().async{
                print(i, terminator: " ")
            }
        }
        
        for i in 101...200 {
            print(i , terminator: " ")
        }
        
        print("END", terminator: " ")
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
    // 다른 알바생: 네트워크 통신, 파일 다운로드
    
    // Data(contentOf: url) 동기 코드 -- 끝날때 까지 기다림 ui
    @objc// opensource를 사용하지 않고 url을 이미지로 바꾸는법
    func checkButtontapped() {
        //작업이 빠르게 끝날 수 있음
        // 여러작업이 모두 종료되었다는 신호를 받기가 어렵다
        
        let group = DispatchGroup()
        group.enter() // +1
        
        NetworkManager.shared.fetchImage { image in
            print("first good")
            group.leave()
        }
        
        group.enter()
        NetworkManager.shared.fetchImage { image in
            print("second good")
            group.leave()
        }
        
        group.enter()
        NetworkManager.shared.fetchImage { image in
            print("third good")
            group.leave()
        }
        
        group.notify(queue: .main) {
            print(#function, "END")
        }
        
    }
}

