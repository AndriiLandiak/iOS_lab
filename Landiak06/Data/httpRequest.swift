
struct Root: Codable {
    let data: RootData
    
    var description: String {
        return data.description
    }
    
    enum Data: String, CodingKey {
        case data
    }
}

struct RootData: Codable {
    var children: [PostData]
    
    var description: String {
        var res: String = ""
        for item in children {
            res = res + item.description
        }
        return res
    }
    
    
    enum Data: String, CodingKey {
        case children
    }
}

struct PostData: Codable {
    let data: Post
    
    var description: String {
        return data.description
    }
    enum Data: String, CodingKey {
        case data
    }
}

struct Post: Codable {
    let author: String
    let domain: String
    let created: TimeInterval
    let title: String
    let numComments: Int
    let ups: Int
    let downs: Int
    let thumbnail: String?
    
    
    var description: String {
        if let thumbnail = thumbnail {
            return """
            Author: \(author), domain: \(domain), created: \(NSDate(timeIntervalSince1970: created)), title: \(title), numComments: \(numComments), ups: \(ups), downs: \(downs), thumbnail: \(thumbnail)
            """
        }
        return """
        Author: \(author), domain: \(domain), created: \(NSDate(timeIntervalSince1970: created)), title: \(title), numComments: \(numComments), ups: \(ups), downs: \(downs)
        """
    }
    
    enum CodingKeys: String, CodingKey {
        case numComments = "num_comments"
        case domain
        case author
        case created
        case title
        case thumbnail
        case ups
        case downs
    }
}

class httpRequest {
    func request(url:String, onCompletion: @escaping (Data?, Error?) -> Void) {
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?
        dataTask?.cancel()
        if let urlComponents = URLComponents(string: url) {
            if let url = urlComponents.url {
                dataTask =
                    defaultSession.dataTask(with: url)  { data, response, error in
                        if let data = data,
                                  let response = response as? HTTPURLResponse,
                                  response.statusCode == 200 {
                            onCompletion(data, nil)
                        } else {
                            onCompletion(nil, NSError(domain:"", code:401, userInfo:[ NSLocalizedDescriptionKey: "Invalid url"]))
                        }
                    }
                dataTask?.resume()
            }
        }
    }
}
