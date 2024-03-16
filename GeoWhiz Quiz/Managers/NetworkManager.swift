//
//  NetworkManager.swift
//  GeoWhiz Quiz
//
//  Created by user on 7/3/24.
//

import Foundation

struct NetworkManager {
    
    // Step 1: Create a Network Manager to handle networking/fetching of quiz data from public API
    
    static let shared = NetworkManager()
    
    func fetchQuizData(for difficulty: String) async throws -> [Quiz] {
        
        let urlString: String
        
        switch difficulty {
        case "Easy":
            urlString = "https://opentdb.com/api.php?amount=10&category=22&difficulty=easy&type=multiple"
        case "Medium":
            urlString = "https://opentdb.com/api.php?amount=10&category=22&difficulty=medium&type=multiple"
        case "Hard":
            urlString = "https://opentdb.com/api.php?amount=10&category=22&difficulty=hard&type=multiple"
        default:
            throw NSError(domain: "Unknown difficulty", code: 0)
        }
        
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid URL", code: 1)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodedResponse = try decoder.decode(QuizResponse.self, from: data)
        return decodedResponse.results
    }
}


