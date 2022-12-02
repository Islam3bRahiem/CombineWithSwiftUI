//
//  UIViewExtension.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import SwiftUI

extension View {
    
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
    
}
