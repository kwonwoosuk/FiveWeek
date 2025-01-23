//
//  UIViewController+Extension.swift
//  FiveWeek
//
//  Created by 권우석 on 1/22/25.
//

import UIKit

// Generic
extension UIViewController {
    // 타입만 다르고 기능은 똑같은 메서드를 한개만 작성하고싶다...! -> 제네릭
    // 타입에 유연하게 대응할 수 있다
    // T: Type Parameter - 플레이스 홀더 ( 무슨 타입인지 모르지만 동일한 타입이 들어올거라는걸 알려줌
    // Type Constraints 타입의 제약조건 설정 + 기능을 사용할거라면 T에 + 기능이 있는애만 들어와야하기때문에
    // 함수의 구성에서는 타입을 알 수 없고 함수를 호출 할때 타입이 결정된다
    //정의할떈 몰라요~  실제로 호출 할때 값을 넣어서 쓸때 알 수 있어요~ 를 윗줄처럼 정제해서 말한것
    
    // 그래도 컴파일타임에 어떤 타입이 들어올지는 알아야 한다 !
    
    func example<T>(completionHandler: @escaping (T) -> Void ) -> String {
        return "안녕하세요 "
    }
    func plus<T: Numeric>(a: T, b: T) -> T  {
        return a + b
    }
    
    func plus<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }
    
    
    func configureBorder<T: UIView>(view: T){
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = .clear
    }
    
}
