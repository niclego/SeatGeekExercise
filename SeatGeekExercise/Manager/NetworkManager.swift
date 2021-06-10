//
//  NetworkManager.swift
//  SeatGeekExercise
//
//  Created by Nicolas Le Gorrec on 6/10/21.
//

import Foundation

class NetworkManager {
    static func request<T: Codable>(enpoint: Endpoint, completion: @escaping (Result<T,Error>) -> ()) {
        var components = URLComponents()
        components.scheme = enpoint.scheme
        components.host = enpoint.baseURL
        components.path = enpoint.path
        components.queryItems = enpoint.parameters
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = enpoint.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard response != nil, let data = data else { return }
            
            DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(responseObject))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response"])
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
