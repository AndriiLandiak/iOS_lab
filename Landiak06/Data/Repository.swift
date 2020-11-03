

class Repository {
    func requestService() {
        httpService().request(url: "https://www.reddit.com", subreddit:["r","ios","top.json"],subredditValues: ["limit":"1"])
    }
    
    func getFromDB() -> Array<Post?> {
        PersistenceManager.sharedInstance.fetchAll()
    }
    
}
