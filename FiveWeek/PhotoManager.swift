//
//  PhotoManager.swift
//  FiveWeek
//
//  Created by 권우석 on 1/21/25.
//
import Foundation
import Alamofire


// 열거형 열관값, Associated Value ⭐️
// 통신할때의 준비사항을 구조화 하고 따로 뺍니당
enum UnsplashRequest {
    
    case randomPhoto
    case topic(id: String) // 필요할거 같으면 이 공간 써~!
    case photo(query: String)
    
    var baseURL: String {
        return "https://api.unsplash.com/"
    }
    
    var endpoint: URL {
        switch self {
        case .randomPhoto:
            return URL(string: baseURL + "photos/random")!
        case .topic(let id):
            return URL(string: baseURL + "topics/\(id)")!
        case .photo(let query):
            return URL(string: baseURL + "photos/\(query)")!
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": "Client-ID \(Key.unsplash)"]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
}




class PhotoManager {
    static let shared = PhotoManager()
    
    private init() {}
    
//    func getRandomPhoto(
//        completionHandler: @escaping (RandomPhoto) -> Void,
//        failHandler: @escaping () -> Void ) {
//            let url = "https://api.unsplash.com/photos/random"
//            
//            let header: HTTPHeaders = [
//                "Authorization": "Client-ID \(Key.unsplash)"
//            ]
//            
//            AF.request(url, method: .get, headers: header)
//                .validate(statusCode: 200..<500)
//                .responseDecodable(of: RandomPhoto.self) { response in
//                    
//                    switch response.result {
//                    case .success(let value):
//                        print(value)
//                        completionHandler(value)
//                    case .failure(let error):
//                        print(error)
//                    }
//                }
//        }
    func getRandomPhoto(api: UnsplashRequest,
        completionHandler: @escaping (RandomPhoto) -> Void,
        failHandler: @escaping () -> Void ) {
           
            
        AF.request(api.endpoint, method: api.method, headers: api.header)
                .validate(statusCode: 200..<500)
                .responseDecodable(of: RandomPhoto.self) { response in
                    
                    switch response.result {
                    case .success(let value):
                        print(value)
                        completionHandler(value)
                    case .failure(let error):
                        print(error)
                    }
                }
        }
    
    func callRequest(api: UnsplashRequest) {
        
        AF.request(api.endpoint, method: api.method, headers: api.header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: RandomPhoto.self) { response in
                switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getATopic(api: UnsplashRequest) {
       
        AF.request(api.endpoint, method: api.method, headers: api.header)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: Topic.self) { response in
                switch response.result {
                case .success(let value):
                    print(value)
                case .failure(let error):
                    print(error)
                }
            }
        
        
    }
    
}
