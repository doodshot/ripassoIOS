//
//  NetworkManager.swift
//  ripassoIOS
//
//  Created by Guido Panzieri on 27/06/25.
//

import Foundation

enum NetworkManagerError: Error {
    case invalideURL
    case jsonDecode
}

class NetworkManager {
    private static let urlString = "https://jsonplaceholder.typicode.com"
    static let shared = NetworkManager()
    
    func getTodso() async throws -> [Todo] {
        guard let url = URL(string: "\(NetworkManager.urlString)/todos") else {
            throw NetworkManagerError.invalideURL
        }
        let request = URLRequest(url: url)
        
        do {
            let result = try await URLSession.shared.data(for: request)
            let todos = try JSONDecoder().decode([Todo].self, from: result.0)
            return todos
        } catch {
            throw NetworkManagerError.jsonDecode
        }
    }
}

