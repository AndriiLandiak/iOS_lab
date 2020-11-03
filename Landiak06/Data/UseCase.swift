

class UseCase {
    func requestRepository() {
        Repository().requestService()
    }
    func takeInformation() -> Array<Post?> {
        Repository().getFromDB().description
    }
}
