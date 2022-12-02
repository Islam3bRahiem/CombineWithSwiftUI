//
//  DynamodbWriterCellView.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import SwiftUI

struct DynamodbWriterCellView: View {
    
    var writer: DynamodbWriterViewModel?
    
    var body: some View {
        ZStack {
            HStack(spacing: 10) {
                ImageViewCache(urls: (urlString: writer?.thumbnail,
                                      lowResURLString: writer?.thumbnail),
                               errorImage: UIImage(named: "PlaceholderImage"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(5)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(writer?.name ?? "")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text(writer?.price ?? "")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct DynamodbWriterCellView_Previews: PreviewProvider {
    static var previews: some View {
        DynamodbWriterCellView(writer: nil)
    }
}
