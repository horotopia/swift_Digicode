//
//  ContentView.swift
//  Digicode
//
//  Created by Les Prodiges on 29/03/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseAuthCombineSwift

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
//    @State var connected = (Auth.auth().currentUser != .none)
    
    var body: some View {
        Group {
            if (viewModel.connected) {
                VStack {
                    Button("Logout", action: {
                        do {
                            try Auth.auth().signOut()
//                            connected = false
                        } catch {
                            print("Error: \(error.localizedDescription)")
                        }
                    })
                }
                .padding()
            }else {
                SignInView()
            }
        }
        .onReceive(Auth.auth().authStateDidChangePublisher()) { user in
            switch user {
            case .none:
                print("Disconnected")
//                connected = false
                
            case .some(let user):
                print("User \(user.uid) connected")
//                connected = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
