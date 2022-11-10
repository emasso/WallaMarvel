import Foundation

protocol APIClientProtocol {
    func getHeroes(offset: String?, completionBlock: @escaping (CharacterDataContainer) -> Void)
    func getHeroDetail(characterId: Int, completionBlock: @escaping (CharacterDetailDataContainer) -> Void)
}

final class APIClient: APIClientProtocol {
    enum Constant {
        static let privateKey = "188f9a5aa76846d907c41cbea6506e4cc455293f"
        static let publicKey = "d575c26d5c746f623518e753921ac847"
    }
    
    init() { }
    
    func getHeroes(offset: String?, completionBlock: @escaping (CharacterDataContainer) -> Void) {
        let ts = String(Int(Date().timeIntervalSince1970))
        let privateKey = Constant.privateKey
        let publicKey = Constant.publicKey
        let hash = "\(ts)\(privateKey)\(publicKey)".md5
        var parameters: [String: String] = ["apikey": publicKey,
                                            "ts": ts,
                                            "hash": hash]
        
        if let offset = offset {
            parameters["offset"] = offset
        }
        
        let endpoint = "https://gateway.marvel.com:443/v1/public/characters"
        var urlComponent = URLComponents(string: endpoint)
        urlComponent?.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        let urlRequest = URLRequest(url: urlComponent!.url!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let dataModel = try! JSONDecoder().decode(CharacterDataContainer.self, from: data!)
            completionBlock(dataModel)
            print(dataModel)
        }.resume()
    }
    
    func getHeroDetail(characterId: Int, completionBlock: @escaping (CharacterDetailDataContainer) -> Void) {
        let ts = String(Int(Date().timeIntervalSince1970))
        let privateKey = Constant.privateKey
        let publicKey = Constant.publicKey
        let hash = "\(ts)\(privateKey)\(publicKey)".md5
        let parameters: [String: String] = ["apikey": publicKey,
                                            "ts": ts,
                                            "hash": hash]
        
        let endpoint = "https://gateway.marvel.com:443/v1/public/characters/\(characterId)"
        var urlComponent = URLComponents(string: endpoint)
        urlComponent?.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        let urlRequest = URLRequest(url: urlComponent!.url!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            print(String(data: data!, encoding: .utf8)!)
            let dataModel = try! JSONDecoder().decode(CharacterDetailDataContainer.self, from: data!)
            completionBlock(dataModel)
            print(dataModel)
        }.resume()
    }
    
}
