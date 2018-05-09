//
//  DetailViewController.swift
//  eucountries
//
//  Created by Tuuli Kähkönen on 28/04/2018.
//  Copyright © 2018 Tuuli Kähkönen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var countries = [eucountries.Country]()
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var capital: UIButton!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var joindate: UILabel!
    @IBOutlet weak var partdate: UILabel!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var wikibutton: UIButton!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let country = detailItem {
            if let nameLabel = name {
                nameLabel.text = country.name
            }
            if let capitalButton = capital {
                capitalButton.setTitle(country.capital?.name, for: .normal) 
            }
            if let areaLabel = area {
                areaLabel.text = String(country.area) + " km2"
            }
            if let populationLabel = population {
                populationLabel.text = String(country.population)
            }
            if let joinLabel = joindate {
                joinLabel.text = country.joinedUnionDate
            }
            if let partLabel = partdate {
                partLabel.text = country.exitedUnionDate
            }
            if let flagImage = flag {
                flagImage.image = UIImage(named: country.code)
            }
            if let button = wikibutton {
                button.setImage(#imageLiteral(resourceName: "wikipedia"), for: .normal)
            }
        }
    }

    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countryWikipedia" {
            let controller = (segue.destination as! UINavigationController).topViewController as! WebViewController
            if let name = detailItem?.name {
                controller.urlText = "https://en.wikipedia.org/wiki/" + name
            }
        }
        if segue.identifier == "map" {
            let controller = (segue.destination as! UINavigationController).topViewController as! MapViewController
            controller.countries = countries
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Country? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

