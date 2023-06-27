//
//  Product.swift
//  ProductApp2
//
//  Created by Yves Dukuze on 27/06/2023.
//

import Foundation


struct Product: Codable {
    let products: [ProductInfo]
    let total, skip, limit: Int
}


struct ProductInfo: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
