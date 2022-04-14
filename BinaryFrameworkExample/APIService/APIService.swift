//
//  APIService.swift
//  BinaryFrameworkExample
//
//  Created by Alexander Khiger on 13.04.2022.
//

import Foundation
import Alamofire

class APIService {
    
    static let shared = APIService()
    
    private init() {}
    
    private let defaultSession = Session(interceptor: APIRequestRetrier())
    
    func getAvailableCars(completion: @escaping (([DomainCar]) -> Void)) {
        defaultSession
            .request(URL(string: "https://google.com")!)
            .responseData { _ in
                let cars = [
                    APICar(id: "1", brand: "Honda", model: "Civic", maxSpeed: 210),
                    APICar(id: "2", brand: "Lada", model: "Granta", maxSpeed: 184),
                    APICar(id: "3", brand: "Peel", model: "P50", maxSpeed: 45),
                    APICar(id: "4", brand: "Bugatti", model: "Chiron", maxSpeed: 416)
                ]
                
                completion(cars.map { $0.asDomain })
            }
    }
    
}
