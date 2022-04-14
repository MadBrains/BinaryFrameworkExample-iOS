//
//  DBCar.swift
//  BinaryFrameworkExample
//
//  Created by Alexander Khiger on 13.04.2022.
//

import RealmSwift

class DBCar: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var brand = ""
    @objc dynamic var model = ""
    @objc dynamic var maxSpeed = 0.0
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    convenience init(domain: DomainCar) {
        self.init()
        
        id = domain.id
        brand = domain.brand
        model = domain.model
        maxSpeed = domain.maxSpeed
    }
    
    var asDomain: DomainCar {
        DomainCar(id: id, brand: brand, model: model, maxSpeed: maxSpeed)
    }
    
}
