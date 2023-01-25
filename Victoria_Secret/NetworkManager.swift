//
//  NetworkManager.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    private init(){
    }
    
    func getDataFromServer<T: Codable>(_ urlString: String,_ completion: @escaping (Result<T,Error>) -> Void){
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            do {
                let model = try JSONDecoder().decode(T.self, from: data!)
                completion(.success(model))
            }catch(let error){
                print(error)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
