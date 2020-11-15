import Foundation

class PersistenceManager {
    static let sharedInstance = PersistenceManager()
    private init() {}

    var db: Array<DataPost> = []
    func add(_ post: DataPost) {
        db.append(post)
    }
    func delete() {
        db.removeLast()
    }
    func fetchAll() -> Array<DataPost> {
        return db
    }
    
    func save(_ title: String) {
        for el in (0...db.count - 1) {
            if db[el].title == title {
                db[el].saved = !db[el].saved
                print(db[el])
            }
        }
        NotificationCenter.default.post(Notification(name: notificationPost))
    }
    
//    func

    func printAll() {
        for element in db {
            print(element.description)
        }
    }
}
