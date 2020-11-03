//
//  PostViewModel.swift
//  Landiak06
//
//  Created by Andrew Landiak on 03.11.2020.
//


import UIKit


class PSM {
    
    let author: String
    let domain: String
    let time: String
    let title: String
    let numComments: String
    let rating: String
    let photo: UIImage
    
    init(_ post: Post?) {
        let url = URL(string: post?.thumbnail ?? "")
        let data = try? Data(contentsOf: url!)
        let stringTime = String(Int(-(Date(timeIntervalSince1970: post!.created).timeIntervalSinceNow)/3600))
        
        self.author = post!.author
        self.domain = post!.domain
        self.time = "\(stringTime) hours"
        self.title = post!.title
        self.numComments = String(post!.numComments)
        self.rating = String(post!.ups - post!.downs)
        self.photo = UIImage(data:data!)!
    }
}
