//
//  ErrorAlertHandler.swift
//  ErrorAlertHandler
//
//  Created by Flavio Thomi on 24.09.2024.
//

import SwiftUI

public extension View{
    func errorAlertHandler() -> some View{
        modifier(ErrorViewWrapper())
    }
}

public extension EnvironmentValues{
    @Entry var showAlert: (Error) -> Void = {_ in}
}
