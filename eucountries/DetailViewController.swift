//
//  DetailViewController.swift
//  eucountries
//
//  Created by Tuuli Kähkönen on 28/04/2018.
//  Copyright © 2018 Tuuli Kähkönen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var joindate: UILabel!
    @IBOutlet weak var partdate: UILabel!
    @IBOutlet weak var flag: UIImageView!

    func configureView() {
        // Update the user interface for the detail item.
        if let country = detailItem {
            if let nameLabel = name {
                nameLabel.text = country.name
            }
            if let capitalLabel = capital {
                capitalLabel.text = country.capital?.name
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

