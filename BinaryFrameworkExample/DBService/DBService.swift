//
//  DBService.swift
//  BinaryFrameworkExample
//
//  Created by Alexander Khiger on 13.04.2022.
//

import Foundation
import RealmSwift

class DBService {
    
    static let shared = DBService()
    
    private init() {}
    
    func deleteData() {
        DispatchQueue.global().async {
            let realm = try! Realm()
            
            try? realm.write {
                realm.delete(realm.objects(DBCar.self))
            }
        }
    }
    
    func getSavedCars(completion: @escaping (([DomainCar]) -> Void)) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            let objects = Array(realm.objects(DBCar.self)).map { $0.asDomain }
            
            DispatchQueue.main.async {
                completion(objects)
            }
        }
    }
    
    func saveCar(_ car: DomainCar, completion: @escaping (() -> Void)) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            
            let obj = DBCar(domain: car)
            
            try? realm.write {
                realm.add(obj, update: .modified)
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func removeCarFromSaved(_ car: DomainCar, completion: @escaping (() -> Void)) {
        DispatchQueue.global().async {
            let realm = try! Realm()
            
            guard let obj = realm.object(ofType: DBCar.self, forPrimaryKey: car.id) else {
                DispatchQueue.main.async {
                    completion()
                }
                
                return
            }
            
            try? realm.write {
                realm.delete(obj)
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
}
