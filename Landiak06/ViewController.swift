//
//  ViewController.swift
//  Landiak06
//
//  Created by Andrew Landiak on 02.11.2020.
//

let notificationPost = Notification.Name("testing")

import UIKit

class ViewController: UIViewController {
    
    var saved = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                                       selector: #selector(updatePostNotification),
                                                       name: notificationPost, object: nil)
        
        UseCase().requestRepository()
    
    }

    @objc
    func updatePostNotification() {
        updatePost()
    }
    
    func updatePost() {
        let use = UseCase()
        use.requestRepository()
        let post = use.takeInformation()
        let postViewModel = PSM(post[0])
        DispatchQueue.main.async {
            self.usernameLabel.text = postViewModel.author
            self.titleLabel.text = postViewModel.title
            self.timeLabel.text = postViewModel.time
            self.ratingLabel.text = postViewModel.rating
            self.commentsNumLabel.text = postViewModel.numComments
            self.domainLabel.text = postViewModel.domain
            self.imageURL.image = postViewModel.photo
        }
    }

    @IBOutlet private weak var markBut: UIButton!
    
    @IBAction func buttonMark(_ sender: Any) {
        markBut.isSelected = !markBut.isSelected
        saved = !saved
        
    }
    
    
    @IBOutlet private weak var imageURL: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var domainLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var commentsNumLabel: UILabel!
    @IBOutlet private weak var shareLabel: UILabel!
    
}

