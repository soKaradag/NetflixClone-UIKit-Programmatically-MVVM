//
//  APICaller.swift
//  ProgrammaticUI
//
//  Created by Serdar Onur KARADAĞ on 26.05.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "8545e309c25a053623734a7c512cc8dd"
    static let baseURL = "https://api.themoviedb.org"
}


enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func GetTrendingMOvies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch  {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}
