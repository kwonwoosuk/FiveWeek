//
//  PhotoManager.swift
//  FiveWeek
//
//  Created by 권우석 on 1/21/25.
//

import Alamofire


class PhotoManager {
    static let shared = PhotoManager()
    
    private init() {}
    
    func getRandomPhoto(completionHandler: @escaping (RandomPhoto) -> ()) {
        let url = "https://api.unsplash.com/photos/random"
        
        let header: HTTPHeaders = [
            "Authorization": "Client-ID \(Key.unplash)"
        ]
        
        AF.request(url, method: .get, headers: header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: RandomPhoto.self) { response in
                
                switch response.result {
                case .success(let value):
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
}
