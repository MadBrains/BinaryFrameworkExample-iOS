//
//  CarSDK.swift
//  BinaryFrameworkExample
//
//  Created by Alexander Khiger on 13.04.2022.
//

public let CarSDK = CarSDKCore.shared

public class CarSDKCore {
    
    static let shared = CarSDKCore()
    
    private init() {}
    
    private let dbService = DBService.shared
    private let apiService = APIService.shared
    
    public func getAvailableCars(completion: @escaping (([DomainCar]) -> Void)) {
        apiService.getAvailableCars(completion: completion)
    }
    
    public func getSavedCars(completion: @escaping (([DomainCar]) -> Void)) {
        dbService.getSavedCars(completion: completion)
    }
    
    public func saveCar(_ car: DomainCar, completion: @escaping (() -> Void)) {
        dbService.saveCar(car, completion: completion)
    }
    
    public func removeCarFromSaved(_ car: DomainCar, completion: @escaping (() -> Void)) {
        dbService.removeCarFromSaved(car, completion: completion)
    }
    
}
