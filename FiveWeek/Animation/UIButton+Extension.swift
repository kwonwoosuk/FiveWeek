//
//  UIButton+Extension.swift
//  FiveWeek
//
//  Created by 권우석 on 1/31/25.
//

import UIKit


extension UIButton.Configuration {
    
    static func sesacStyle() -> UIButton.Configuration {
    
        var config = UIButton.Configuration.filled()
        config.title = "로그인하기"
        config.subtitle = "환영합니다"
        config.image = UIImage(systemName: "star")
        config.baseForegroundColor = .green
        config.baseBackgroundColor = .brown
        
        return config
    }
}
