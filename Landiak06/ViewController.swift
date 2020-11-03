//
//  ViewController.swift
//  Landiak06
//
//  Created by Andrew Landiak on 02.11.2020.
//

let notificationPost = Notification.Name("testing")

import UIKit

//protocol Observer: class {
//    func update(subject: NotifCenter)
//}
//
//class NotifCenter {
//    var state: Array<Post?> = []
//    
//    private lazy var observers = [Observer]()
//    
//    func add(_ observer: Observer) {
//        observers.append(observer)
//    }
//    func remove(_ observer: Observer) {
//        if let index = observers.firstIndex(where: {$0 === observer}) {
//            observers.remove(at: index)
//        }
//    }
//    func notify() {
//        observers.forEach({$0.update(subject: self)})
//    }
//    
//    func logic() {
//        let s = UseCase()
//        s.requestRepository()
//        state = s.takeInformation()
//    }
//}

class ViewController: UIViewController {

//    let notificationCetner = NotifCenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                                       selector: #selector(updatePostNotification),
                                                       name: notificationPost, object: nil)
        
        UseCase().requestRepository()
    
    }
    let main = DispatchQueue.main

        // Do any additional setup after loading the view.
//        let s = UseCase()
//        s.requestRepository()
//        sleep(3)
//        let check = s.takeInformation()
//        self.usernameLabel.text = check[0]?.author
//        self.titleLabel.text = check[0]?.title
//    func update(subject: NotifCenter) {
//        self.usernameLabel.text =         notificationCetner.state[0]?.author
//        self.timeLabel.text = ""
//        self.domainLabel.text =         notificationCetner.state[0]?.domain
//        self.titleLabel.text = notificationCetner.state[0]?.title
////        ratingLabel.text = (notificationCetner.state[0]!.ups - notificationCetner.state[0]!.downs)
////        commentsNumLabel.text = notificationCetner.state[0]?.numComments
//    }
    @objc
    func updatePostNotification() {
        updatePost()
    }
    
    func updatePost() {
        let use = UseCase()
        use.requestRepository()
        let post = use.takeInformation()
        
//        var timeInterval = ""
//        var timeStr = ""
//        timeInterval = -timeInterval
//        if(timeInterval < 60){
//            timeStr = "\(Int(timeInterval)) sec"
//        } else if(timeInterval < 3600){
//            timeStr = "\(Int(timeInterval/60)) min"
//        }  else if(timeInterval < (3600 * 24)){
//            timeStr = "\(Int(timeInterval/3600)) hour"
//        } else if(timeInterval < (3600  * 24*7)){
//            timeStr = "\(Int(timeInterval/3600/24)) days"
//        } else if(timeInterval < (2592000)){
//            timeStr = "\(Int(timeInterval/3600/24/7)) weeks"
//        } else if(timeInterval < (31556926)){
//            timeStr = "\(Int(timeInterval/3600/24/7/4)) months"
//        } else {
//            timeStr = "\(Int(timeInterval/3600/24/7/4/12)) years"
//        }
        
        func stringFromTimeInterval(interval:TimeInterval) -> String {

            let ti = NSInteger(interval)
            let ms = ti * 1000
            let seconds = ti % 60
            let minutes = (ti / 60) % 60
            let hours = (ti / 3600)

            return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds,ms)
        }
        
    
        main.async {
            self.usernameLabel.text = post[0]?.author
            self.titleLabel.text = post[0]?.title
            self.timeLabel.text = stringFromTimeInterval(interval: post[0]!.created)
            self.ratingLabel.text = String((post[0]?.ups ?? 0) - (post[0]?.downs ?? 0))
            self.commentsNumLabel.text = String(post[0]?.numComments ?? 0)
            self.domainLabel.text = post[0]?.domain
        }
        
       
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

