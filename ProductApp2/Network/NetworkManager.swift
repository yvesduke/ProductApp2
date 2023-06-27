//
//  NetworkManager.swift
//  ProductApp2
//
//  Created by Yves Dukuze on 27/06/2023.
//

import Foundation
import Combine

protocol Networkable {
    func getDataFromAPI<T:Decodable>(url: URL, type: T.Type) -> AnyPublisher<T,Error>
}

class NetworkManager:Networkable {
    
    func getDataFromAPI<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data} //.delay(for: .seconds(5.0), scheduler: DispatchQueue.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError {
                error -> NetworkError in
                switch error {
                case is URLError:
                    return NetworkError.invalidURL
                case NetworkError.dataNotFound:
                    return NetworkError.dataNotFound
                case is DecodingError:
                    return NetworkError.parsingError
                default:
                    return NetworkError.dataNotFound
                }
            }
            .eraseToAnyPublisher()
    }
    
    
}
