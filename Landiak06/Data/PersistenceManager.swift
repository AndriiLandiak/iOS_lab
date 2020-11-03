
class PersistenceManager {
    static let sharedInstance = PersistenceManager()

    var db: Array<Post?> = []
    func add(_ post: Post) {
        db.append(post)
    }
    func delete() {
        db.removeLast()
    }
    func fetchAll() -> Array<Post?> {
        return db
    }

    func printAll() {
        for element in db {
            print(element?.description ?? "Nothing")
        }
    }
}
