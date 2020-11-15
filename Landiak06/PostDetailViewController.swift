//
//  PostDetailViewController.swift
//  Landiak07
//
//  Created by Andrew Landiak on 02.11.2020.
//


import UIKit

class PostDetailViewController: UIViewController {

    var saved = false

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func getInfoPostDetail(_ post: DataPost, pos: Int) {
        DispatchQueue.main.async {
            self.titleLabel.text = post.title
            self.usernameLabel.text = post.author
            self.commentsNumLabel.text = post.numComments
            self.ratingLabel.text = post.rating
            self.domainLabel.text = post.domain
            self.timeLabel.text = post.time
            self.markBut.isSelected = post.saved
        }
    }
    @IBOutlet private weak var markBut: UIButton!
    @IBOutlet private weak var imageURL: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var domainLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var commentsNumLabel: UILabel!
    @IBOutlet private weak var shareLabel: UILabel!


    @IBAction func buttonMark(_ sender: Any) {
        markBut.isSelected = !markBut.isSelected
        PersistenceManager.sharedInstance.save(titleLabel.text!)
    }

    
}

