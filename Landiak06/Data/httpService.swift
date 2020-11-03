import Foundation

class httpService {
    func request(url:String, subreddit:[String] = [], subredditValues:[String:String] = [:]) {
        var url = url
        
        subreddit.forEach { each in
            url.append("/" + each)
        }
        
        if subredditValues.count != 0 {
            url.append("?")
            subredditValues.forEach { key in
                url.append(key.key + "=" + key.value + "&" )
            }
            url = String(url.dropLast())
        }
        httpRequest().request(url: url) { (data, error) in
            if let data = data {
                if let root:Root = try? JSONDecoder().decode(Root.self, from: data)
                {
                    
                    PersistenceManager.sharedInstance.add(root.data.children[0].data)
                    
                    PersistenceManager.sharedInstance.printAll()
                    
                    NotificationCenter.default.post(Notification(name: notificationPost))
                    
                }
            } else {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
}
