//
//  ProductViewModel.swift
//  ProductApp2
//
//  Created by Yves Dukuze on 27/06/2023.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    
    @Published var product:[ProductInfo] = []
    @Published var customError: NetworkError?
    
    let networkManager: Networkable
    
    private var canceallable = Set<AnyCancellable>()
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
    
    func getProducts() {
        
        guard let url = URL(string: APIEndPoint.productApiUrl) else {
            return
        }
        
        self.networkManager.getDataFromAPI(url: url, type: Product.self)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    switch error {
                    case is URLError:
                        self.customError = NetworkError.invalidURL
                    case NetworkError.dataNotFound:
                        self.customError = NetworkError.dataNotFound
                    case NetworkError.parsingError:
                        self.customError = NetworkError.parsingError
                    default:
                        self.customError = NetworkError.dataNotFound
                    }
                }
            }receiveValue: { product in
                DispatchQueue.main.async {
                    self.customError = nil
                    self.product = product.products
                }
            }.store(in: &canceallable)
                
    }
     
}
