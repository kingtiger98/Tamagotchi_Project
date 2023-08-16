//
//  Error.swift
//  TamagotchiProject
//
//  Created by 황재하 on 8/17/23.
//

import Foundation

// 컴파일 시 오류 타입 알 수 있음, Error 프로토콜 꼮 채택
enum ValidationError: Int, Error {
    case emptyNumber = 404
    case isNotNumber = 401
    case isOverNumber = 500
}
