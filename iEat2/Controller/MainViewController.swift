//
//  ViewController.swift
//  iEat2
//
//  Created by Adithep on 6/24/20.
//  Copyright © 2020 Adithep. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    static var foodList = ["Pizza", "Sushi", "Cheeseburger", "Burrito", "Suki-Yaki"]

    
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var customizeButton: UIButton!
    @IBOutlet weak var randomButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomButton.layer.cornerRadius = 10
        customizeButton.layer.cornerRadius = 10

    }
    

    @IBAction func randomButtonPressed(_ sender: UIButton) {
        
        let random = Int.random(in: 0..<MainViewController.foodList.count)
        foodName.text = MainViewController.foodList[random]
    }
    
}

