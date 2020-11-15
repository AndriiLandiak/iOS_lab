//
//  PostListViewController.swift
//  Landiak07
//
//  Created by Andrew Landiak on 15.11.2020.
//

import UIKit

let notificationPost = Notification.Name("testing")
private let showDetailViewContoller = "showDetailViewContoller"

class PostListViewController: UITableViewController {
    
    
    var saved = false
    var allPost: Array<DataPost> = []
    var savedPost: Array<DataPost> = []
    let use: UseCase = UseCase()
    
    var premiumButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Subreddit"
        
        self.premiumButton.setImage(UIImage(systemName: "bookmark.fill"), for: .selected)
        self.premiumButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        self.premiumButton.tintColor = UIColor.black
        self.premiumButton.addTarget(self, action: #selector(self.showSubscriptions), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.premiumButton)
                                                                  
        NotificationCenter.default.addObserver(self,selector: #selector(updatePostNotification),name: notificationPost, object: nil)
        
        if allPost.count == 0 {
            use.requestRepository()
        }
    }
    
    @objc
    func showSubscriptions() {
        premiumButton.isSelected = !premiumButton.isSelected
    }

    
    @objc
    func updatePostNotification() {
        updatePost()
    }
    
    func updatePost() {
        let post = use.takeInformation()
        allPost = post
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.allPost.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as! PostTableViewCell
//        if premiumButton.isSelected {
            cell.configure(for: self.allPost[indexPath.row])
//        }else {
//            cell.configure(for: self.savedPost[indexPath.row])
//        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("0")
        tableView.deselectRow(at: indexPath, animated: true)
        print("1")
        self.performSegue(withIdentifier: showDetailViewContoller, sender: indexPath)

    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            switch segue.identifier {
            case showDetailViewContoller:
                if let indexPath = (sender as? IndexPath)?.row {
                    let a = segue.destination as! PostDetailViewController
                    a.getInfoPostDetail(allPost[indexPath], pos:indexPath)
                }
            default:()
            }
        }

}
