//
//  ErrorViewWrapper.swift
//  ErrorAlertHandler
//
//  Created by Flavio Thomi on 24.09.2024.
//

import SwiftUI

internal struct ErrorViewWrapper:ViewModifier {
    
    @State private var error:Error?
    @State private var isPresented = false
    
    func body(content: Content) -> some View {
        content
            .environment(\.showAlert){ error in
                self.error = error
            }
            .alert(
                "Error",
                isPresented: $isPresented,
                actions: {},
                message: {
                    Text(error?.localizedDescription ?? "Missing description")
                })
    }
}


