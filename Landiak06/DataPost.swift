//
//  Data.swift
//  Landiak06
//
//  Created by Andrew Landiak on 15.11.2020.
//

import UIKit

struct DataPost {
    let author: String
    let domain: String
    let time: String
    let title: String
    let numComments: String
    let rating: String
    var saved: Bool = false
    let photo: UIImage
    
    init(_ post: Post?) {
        if post?.thumbnail ?? "" != "self" {
            let url = URL(string: post?.thumbnail ?? "")!
            let data = try? Data(contentsOf: url)
            self.photo = UIImage(data:data!)!
        } else {
            let imageIcon = UIImage(systemName: "questionmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            self.photo = imageIcon!
        }
        let stringTime = String(Int(-(Date(timeIntervalSince1970: post!.created).timeIntervalSinceNow)/3600))
        
        self.author = post!.author
        self.domain = post!.domain
        self.time = "\(stringTime) hours"
        self.title = post!.title
        self.numComments = String(post!.numComments)
        self.rating = String(post!.ups - post!.downs)
    }
    
    var description: String {
        return """
        Author: \(author), domain: \(domain), created: \(time), title: \(title), numComments: \(numComments), rating: \(rating), saved: \(saved), photo: \(photo)
        """
    }
}
