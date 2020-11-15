//
//  PostTableViewCell.swift
//  Landiak07
//
//  Created by Andrew Landiak on 15.11.2020.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    // MARK: -ReuseIdentifier
    static let reuseIdentifier = "postCell"
    
    // MARK: - Outlets
    @IBOutlet private weak var usernameOutlet: UILabel!
    @IBOutlet private weak var timeOutlet: UILabel!
    @IBOutlet private weak var domainOutlet: UILabel!
    @IBOutlet private weak var bookmartOutlet: UIButton!
    @IBOutlet private weak var titleLabelOutlet: UILabel!
    @IBOutlet private weak var ratingOutlet: UILabel!
    @IBOutlet private weak var commentsOutlet: UILabel!
    @IBOutlet private weak var shareButtonOutlet: UIButton!
    @IBOutlet private weak var questionMarkImage: UIImageView!
    
    
    // MARK: -Lifecycle
    override func prepareForReuse() {
        self.usernameOutlet.text = nil
        self.timeOutlet.text = nil
        self.domainOutlet.text = nil
        self.bookmartOutlet.isSelected = false
        self.titleLabelOutlet.text = nil
        self.ratingOutlet.text = nil
        self.commentsOutlet.text = nil
        self.questionMarkImage.image = nil
    }

    
    //MARK: -Configure
    func configure(for post: DataPost) {
        self.usernameOutlet.text = post.author
        self.timeOutlet.text = post.time
        self.domainOutlet.text = post.domain
        self.titleLabelOutlet.text = post.title
        self.ratingOutlet.text = post.rating
        self.commentsOutlet.text = post.numComments
        self.questionMarkImage.image = post.photo
        self.bookmartOutlet.isSelected = post.saved
    }
}
