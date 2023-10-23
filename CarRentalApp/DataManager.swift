//
//  DataManager.swift
//  CarRentalApp
//
//  Created by Uzeyir on 22.10.23.
//

import Foundation
import RealmSwift

struct CarData {
    var name: String
    var price: Double
    var engineDescription: String
    var segmentCarImage: String
}

enum CarSegment: String, CaseIterable {
    case suv
    case standard
    case elite
}

class Car: Object {
    @Persisted var segment: String = ""
    @Persisted var name: String = ""
    @Persisted var price: Double = 0.0
    @Persisted var engineDescription: String = ""
    @Persisted var carImage: String = ""
}

func populateRealmWithCars() {
    let realm = try! Realm()

    try! realm.write {
        for segment in CarSegment.allCases {
            let carsForSegment: [CarData]
            switch segment {
            case .suv:
                carsForSegment = [
                    CarData(name: "Audi Q5", price: 75000.0, engineDescription: "2.0L Turbocharged", segmentCarImage: "car_3"),
//                    CarData(name: "BMW X5", price: 80000.0, engineDescription: "2.5L 4-Cylinder")
                    
                ]
            case .standard:
                carsForSegment = [
                    CarData(name: "Toyota Camry", price: 35000.0, engineDescription: "2.0L 4-Cylinder", segmentCarImage: "car_1"),
//                    CarData(name: "Honda Civic", price: 25000.0, engineDescription: "1.8L 4-Cylinder")
                    
                ]
            case .elite:
                carsForSegment = [
                    CarData(name: "Mercedes-Benz S-Class", price: 100000.0, engineDescription: "3.0L V6 Turbo", segmentCarImage: "car_2"),
//                    CarData(name: "Lexus LS", price: 120000.0, engineDescription: "3.5L V6 Hybrid")
                    
                ]
            }
            
            for carData in carsForSegment {
                let car = Car()
                car.segment = segment.rawValue
                car.name = carData.name
                car.price = carData.price
                car.engineDescription = carData.engineDescription
                realm.add(car)
            }
        }
    }
    //populateRealmWithCars()
}







