
class Repository {
    func requestService() {
        httpService().request(url: "https://www.reddit.com", subreddit:["r","ios","top.json"],subredditValues: ["limit":"5"])
    }
    
    func getFromDB() -> Array<DataPost> {
        PersistenceManager.sharedInstance.fetchAll()
    }
    
}
