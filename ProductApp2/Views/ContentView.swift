//
//  ContentView.swift
//  ProductApp2
//
//  Created by Yves Dukuze on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ProductViewModel
    @State var isErrorOccured: Bool
    
    var body: some View {
        
        if (viewModel.customError != nil) {
            ProgressView().alert(isPresented: $isErrorOccured) {
                Alert(title: Text(viewModel.customError?.errorDescription ?? ""),
                      message: Text("Please try again"), dismissButton: .default(Text("Ok")))
            }
        } else {
            NavigationStack {
                ForEach(viewModel.product) { product in
                    NavigationLink {
                        EmptyView()
                    }label: {
                        Text(product.title)
                    }
                }
            }.onAppear{
                viewModel.getProducts()
                if (viewModel.customError != nil) {
                    isErrorOccured = true
                } else {
                    isErrorOccured = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ProductViewModel(networkManager: NetworkManager()), isErrorOccured: false)
    }
}
