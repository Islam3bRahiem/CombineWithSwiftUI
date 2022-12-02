//
//  ViewDidLoadModifier.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    
    @State
    private
    var isViewDidLoad: Bool = false
    
    private let action: (() -> Void)?
    
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            if !self.isViewDidLoad {
                self.isViewDidLoad.toggle()
                self.action?()
            }
        }
    }
    
}
