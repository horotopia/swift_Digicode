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
                    Button("Logout", action: ViewModel.signOut)
                }
                .padding()
            }else {
                SignInView()
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
