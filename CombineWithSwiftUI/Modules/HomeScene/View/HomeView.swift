//
//  HomeView.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import SwiftUI

struct HomeView<ViewModel: HomeViewModelProtocol>: View {
    
    @StateObject
    var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").edgesIgnoringSafeArea(.all)
                VStack {
                    List(viewModel.output.dataSource, id: \.id) { writer in
                        NavigationLink(destination: WriterDetailsView(viewModel: WriterDetailsViewModel(writer: writer))) {
                            DynamodbWriterCellView(writer: writer)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.horizontal)
                    .listStyle(.plain)
                }
                
                if viewModel.output.isFetching {
                    LoadingView()
                        .frame(maxWidth: .infinity)
                }
                
            }
            .navigationTitle("HOME")
            .alert(item: $viewModel.output.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .onLoad {
                self.viewModel.input.viewDidLoad()
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
