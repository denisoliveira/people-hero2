//
//  HomeVC.swift
//  people-hero2
//
//  Created by Denis Oliveira on 19/10/17.
//  Copyright © 2017 Denis Oliveira. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import CoreLocation

class HomeVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var dataProvider: HomeMapDataProvider?
    var viewModel: MendingoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataProvider = HomeMapDataProvider()
        dataProvider?.delegate = self
        dataProvider?.getAllMendingos()
    }
    
    @IBAction func btnCheckingTap(_ sender: Any) {
        
    }
}

extension HomeVC: HomeDataProviderProtocol {
    
    func success(viewModel: Any) {
        if let viewModel = viewModel as? MendingoViewModel {
            viewModel.mendingos?.forEach {
                
                let region = MKCoordinateRegionMakeWithDistance(
                    CLLocationCoordinate2DMake(
                        $0.latitude ?? 0.00,
                        $0.longitude ?? 0.00
                    ), 800, 800)
                self.mapView.setRegion(region, animated: true)
                
                let point = MKPointAnnotation()
                point.coordinate = CLLocationCoordinate2DMake(
                    $0.latitude ?? 0.00,
                    $0.longitude ?? 0.00
                )
                point.title = "Mendingo \($0.identifier ?? 0)"
                point.subtitle = "Ajude o mendingo."
                
                self.mapView.addAnnotation(point)
            }
        }
    }
    
    func failure(error: NSError?) {
        let alert = UIAlertController(
            title: "Ops ...",
            message: "Ocorreu um erro de comunicação com a API.",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                alert.dismiss(animated: true)
            }
        ))
        self.present(alert, animated: true)
    }
}

extension HomeVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let maker = MKMarkerAnnotationView()
        
        maker.markerTintColor = UIColor(
            red: 194/255, green: 206/255,
            blue: 103/255, alpha: 1.0
        )
        
        return maker
    }
}
