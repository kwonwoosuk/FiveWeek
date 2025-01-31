//
//  PhotoManager.swift
//  FiveWeek
//
//  Created by 권우석 on 1/21/25.
//
import Foundation
import Alamofire

// @frozen @unknown 
// 열거형의 케이스가 앞으로 추가 될 일이 절대 100%없으면 frozen 얼려 버림 ! >> 컴파일상의 최적화와 관련있다
// 열거형 열관값, Associated Value ⭐️
// moya
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
            return URL(string: baseURL + "photos/random?count=10")!
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
    
    var parameter: Parameters {
        return [
            "page": "1",
            "color": "white",
            "order_by": "relevant"
        ]
    }
}

//class jackVC: SearchViewController {
//    override func example() {
//        <#code#>
//    }
//}


class PhotoManager {
    
    // 타입 프로퍼티 
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
                        completionHandler: @escaping ([RandomPhoto]) -> Void,
                        failHandler: @escaping () -> Void ) {
        
        // parameters: 무조건 쿼리스트링은 아님 ! HTTP Body
        AF.request(api.endpoint,
                   method: api.method,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString), // <- 쿼리 스트링으로 사용하겠다 !
                   headers: api.header)
        .validate(statusCode: 200..<500)
        .responseDecodable(of: [RandomPhoto].self) { response in
            
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
    
    func example<T: Decodable>(
        api: UnsplashRequest,
        successHandler: @escaping (T) -> Void,
        failHandler: @escaping () -> Void
    ) {
            AF.request(api.endpoint, method: api.method, headers: api.header)
                .validate(statusCode: 200..<500)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        successHandler(value)
                    case .failure(let error):
                        print(error)
                        failHandler()
                    }
                }
        }
    
    // 두번째 방법 - 그냥 매개변수 만들기
    func example2<T: Decodable>(
        api: UnsplashRequest,
        type: T.Type, //타입을 안쓰더라도 함수 호출시 함수의 타입을 정의하기 위해 써놓는것
        successHandler: @escaping (T) -> Void,
        failHandler: @escaping () -> Void
    ) {
            AF.request(api.endpoint, method: api.method, headers: api.header)
                .validate(statusCode: 200..<500)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        successHandler(value)
                    case .failure(let error):
                        failHandler()
                    }
                }
        }
    
}
