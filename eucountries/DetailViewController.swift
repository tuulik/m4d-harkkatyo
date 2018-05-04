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

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let nameLabel = name {
                nameLabel.text = detail.name
            }
            if let capitalLabel = capital {
                capitalLabel.text = detail.capital?.name
            }
            if let areaLabel = area {
                areaLabel.text = String(detail.area) + " km2"
            }
            if let populationLabel = population {
                populationLabel.text = String(detail.population)
            }
            if let joinLabel = joindate {
                joinLabel.text = detail.joinedUnionDate
            }
            if let partLabel = partdate {
                partLabel.text = detail.exitedUnionDate
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

