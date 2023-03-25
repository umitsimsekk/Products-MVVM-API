//
//  APIManager.swift
//  ProductMVVM
//
//  Created by Ümit Şimşek on 25.03.2023.
//

import Foundation

enum DataError : Error {
    case invalidData
    case invalidUrl
    case network(Error?)
}
final class APIManager {
    static let shared = APIManager()
    private init(){}
    
    func getAllProduct(completion: @escaping(Result<[Product], DataError>) -> Void ) {
        guard let url = URL(string: Constant.API.productAPI) else {
            completion(.failure(.invalidUrl))
            return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data , error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                guard  let results = try? JSONDecoder().decode([Product].self, from: data) else { return }
                completion(.success(results))
            }catch {
                completion(.failure(.network(error)))
            }
        }.resume()
    }
    
}
