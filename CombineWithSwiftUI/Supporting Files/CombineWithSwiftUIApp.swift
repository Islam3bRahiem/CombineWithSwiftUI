//
//  CombineWithSwiftUIApp.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import SwiftUI

@main
struct CombineWithSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = HomeViewModel()
            HomeView(viewModel: viewModel)
        }
    }
}
