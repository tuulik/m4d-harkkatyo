//
//  MapViewController.swift
//  eucountries
//
//  Created by Tuuli Kähkönen on 09/05/2018.
//  Copyright © 2018 Tuuli Kähkönen. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var countries = [eucountries.Country]()
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for country in countries {
            if let latitude = country.capital?.location.latitude {
                if let longitude = country.capital?.location.longitude {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    map.addAnnotation(annotation)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
