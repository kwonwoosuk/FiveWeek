//
//  NetworkManager.swift
//  FiveWeek
//
//  Created by 권우석 on 1/20/25.
//

import UIKit


class NetworkManager {
    
    static let shared = NetworkManager()
    static let url = URL(string: "https://picsum.photos/200/200")!
    /*
     print(#function)
     //http://picsum.photos/200/200
     let url = URL(string: "https://apod.nasa.gov/apod/image/2308/sombrero_spitzer_3000.jpg")!
     
     */
    
    private init() {}
    
    func fetchImage(completionHandler: @escaping (UIImage) -> Void ) {
        
        DispatchQueue.global().async {
            
            if let data = try? Data(contentsOf: NetworkManager.url) { // 010101 로 안바꿀 수도 있기때문에 트라이 캐치문 ~ nil값이 아니라 담겨있다면 이미지로 반환하는 코드
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async { // ui업데이트는 메인 스레드만 할 수있숴!
                        completionHandler(image)
                    }
                }
            }
        }
    }
}
