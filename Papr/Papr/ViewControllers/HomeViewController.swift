//
//  HomeViewController.swift
//  Papr
//
//  Created by Mitchell Sturba on 2020-03-22.
//  Copyright © 2020 Mitchell Sturba. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class HomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        GMSServices.provideAPIKey("AIzaSyD2WE9hGBy3VMWh6RNDFPK_3yoCnJMUBWo")
        GMSPlacesClient.provideAPIKey("AIzaSyD2WE9hGBy3VMWh6RNDFPK_3yoCnJMUBWo")
        
        let camera = GMSCameraPosition.camera(withLatitude: 42.3149, longitude: -83.0364, zoom: 10)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let curLocation = CLLocationCoordinate2DMake(42.3149, -83.0364)
        let marker = GMSMarker(position: curLocation)
        marker.title = "Windsor"
        marker.map = mapView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
