//
//  VehiclesController.swift
//  CarRentalApp
//
//  Created by Uzeyir on 21.10.23.
//



import UIKit
import RealmSwift

class VehiclesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cars: Results<Car>!
    var carsimage: [String] = []
    var segment: [String] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carsimage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "segmentCell", for: indexPath) as! SegmentCell
        if indexPath.row < carsimage.count {
            cell.segmenImage.image = UIImage(named: carsimage[indexPath.row])
        } else {
            print("Xeta \(indexPath.row)")
        }
        return cell
    }

    @IBOutlet weak var collection: UICollectionView!
    
    
    @IBOutlet weak var subCollection: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let realm = try Realm()
            cars = realm.objects(Car.self)
            carsimage = cars.map { $0.carImage }
            print("Number of cars: \(cars.count)")
        } catch {
            print("Hata: \(error)")
        }
        
        collection.reloadData()
    }
}
