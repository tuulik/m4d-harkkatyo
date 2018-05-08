//
//  WebViewController.swift
//  eucountries
//
//  Created by Tuuli Kähkönen on 08/05/2018.
//  Copyright © 2018 Tuuli Kähkönen. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var urlText = ""
    
    @IBOutlet weak var wikipage: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = URL(string: urlText) {
            wikipage.load(URLRequest(url: url))
        }
        wikipage.scrollView.contentInset = .zero
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
