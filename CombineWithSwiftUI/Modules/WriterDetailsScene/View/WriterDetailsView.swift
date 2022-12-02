//
//  WriterDetailsScene.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation

import SwiftUI

struct WriterDetailsView<ViewModel: WriterDetailsViewModel>: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var viewModel: ViewModel
    
    
    var body: some View {
        
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    ImageViewCache(urls: (urlString: self.viewModel.output.imageURL,
                                          lowResURLString: self.viewModel.output.imageURL),
                                   errorImage: UIImage(named: "PlaceholderImage"))
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                    
                    Text(self.viewModel.output.name)
                        .foregroundColor(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack() {
                        Text("Price")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(self.viewModel.output.price)
                            .foregroundColor(.secondary)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                    self.mode.wrappedValue.dismiss()
                }){
                    Image(systemName: "chevron.left")
                        .padding(.all, 10)
                        .background(Color.white)
                        .cornerRadius(10)
                })
            }
            .edgesIgnoringSafeArea(.top)
            
        }
    }
    
}

struct WriterDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        WriterDetailsView(viewModel: WriterDetailsViewModel(writer: nil))
    }
}
