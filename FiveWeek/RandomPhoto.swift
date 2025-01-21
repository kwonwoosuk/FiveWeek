//
//  RandomPhoto.swift
//  FiveWeek
//
//  Created by 권우석 on 1/21/25.
//

import Foundation

struct RandomPhoto: Decodable {
    let id: String
    let width: Int
    let height: Int
    let urls: RandomPhotoURL
}

struct RandomPhotoURL: Decodable {
    let thumb: String
}
