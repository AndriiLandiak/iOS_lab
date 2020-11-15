

class UseCase {
    func requestRepository() {
        Repository().requestService()
    }
    func takeInformation() -> Array<DataPost> {
        Repository().getFromDB()
    }
}
