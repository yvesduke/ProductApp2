//
//  ProductApp2App.swift
//  ProductApp2
//
//  Created by Yves Dukuze on 27/06/2023.
//

import SwiftUI

@main
struct ProductApp2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ProductViewModel(networkManager: NetworkManager()), isErrorOccured: false)
        }
    }
}
