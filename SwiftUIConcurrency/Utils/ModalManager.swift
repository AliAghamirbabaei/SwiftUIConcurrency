//
//  ModalManager.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 3/8/22.
//

import Foundation

class ModalManager: ObservableObject {
    enum ActiveModals {
        case signIn
        case signUp
        case resetPassword
    }
    
    @Published var showModal: Bool = false
    @Published var activeModal: ActiveModals = .signIn
}
