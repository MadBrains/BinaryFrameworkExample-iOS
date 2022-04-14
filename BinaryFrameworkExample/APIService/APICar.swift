//
//  APICar.swift
//  BinaryFrameworkExample
//
//  Created by Alexander Khiger on 13.04.2022.
//

import Foundation
import Alamofire

struct APICar: Decodable {
    
    let id: String
    let brand: String
    let model: String
    let maxSpeed: Double
    
    var asDomain: DomainCar {
        DomainCar(id: id, brand: brand, model: model, maxSpeed: maxSpeed)
    }
    
}
