//
//  ViewController.swift
//  Landiak06
//
//  Created by Andrew Landiak on 02.11.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s = UseCase()
        s.requestRepository()
        let a = s.takeInformation()
        
        
    }
    @IBOutlet weak var buttonName: UIButton!
    
//    @IBAction func savedButton(_ sender: Any) {
//        buttonName.isSelected = !buttonName.isSelected
//    }
    
    
    @IBOutlet private weak var imageURL: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var domainLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var commentsNumLabel: UILabel!
    @IBOutlet private weak var shareLabel: UILabel!
    
}

