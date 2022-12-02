//
//  AlertItem.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    var dismissButton: Alert.Button?
}

enum AlertContext {
    
    static let emptyData = AlertItem(title: Text("No Writers Found"),
                                           message: Text("There is no Writers currently available, it may be available soon."),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Oops"),
                                           message: Text("Invalid response from the server. Please try again or contact support."),
                                           dismissButton: .default(Text("Ok")))
    
}
