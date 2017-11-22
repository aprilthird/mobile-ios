//
//  ViewController.swift
//  iFitGym
//
//  Created by Luis Jeffrey Rojas Montes on 11/16/17.
//  Copyright © 2017 Luis Jeffrey Rojas Montes. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        testNetworking()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testNetworking() {
        Alamofire.request(FitGymApiService.gymCompaniesUrl)
            .responseJSON (completionHandler: {
                response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    
                    var gymCompanies: [GymCompany] = []
                    let jsonObjects = json["gymCompanies"].arrayValue
                    for i in 0...jsonObjects.count - 1 {
                        gymCompanies.insert(GymCompany.init(from: jsonObjects[i]), at: i)
                        print("\(gymCompanies[i].name)")
                    }
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
}

