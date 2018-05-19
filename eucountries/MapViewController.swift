//
//  MapViewController.swift
//  eucountries
//
//  Created by Tuuli Kähkönen on 09/05/2018.
//  Copyright © 2018 Tuuli Kähkönen. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    var countries = [eucountries.Country]()
    var currentLocation = CLLocationCoordinate2D()
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.map.delegate = self
        for country in countries {
            if let latitude = country.capital?.location.latitude {
                if let longitude = country.capital?.location.longitude {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    map.addAnnotation(annotation)
                }
            }
        }
        locationManager.requestWhenInUseAuthorization()
        var region = MKCoordinateRegion()
        region.center = currentLocation
        region.span.latitudeDelta = 3
        region.span.longitudeDelta = 3
        map.setRegion(region, animated: false)
        map.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        let reuseIdentifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseIdentifier)
        } else {
            annotationView?.annotation = annotation
        }
        if (annotation.coordinate.latitude == currentLocation.latitude && annotation.coordinate.longitude == currentLocation.longitude) {
            if let marker = annotationView as? MKMarkerAnnotationView {
              marker.markerTintColor = UIColor.green
            }
        } else {
            print("not current location")
            if let marker = annotationView as? MKMarkerAnnotationView {
              marker.markerTintColor = UIColor.red
            }
        }
        return annotationView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
