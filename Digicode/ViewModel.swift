//
//  ViewModel.swift
//  Digicode
//
//  Created by Les Prodiges on 30/03/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseAuthCombineSwift

class ViewModel: ObservableObject {
    @Published var connected = (Auth.auth().currentUser != .none)
    
    init() {
        Auth.auth().authStateDidChangePublisher()
            .map { user in
                switch user {
                case .none: return false
                case .some(_): return true
                }
            }
            .assign(to: &$connected)
    }
    
    static func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {(_, error) in
            if let error = error {
                print("Error: \(error)")
            }
        }
    }
    
    static func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}
