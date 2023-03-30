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
    @State var showingSheet = false
    @State private var codeInput = ""
    
    let validCodes = ["1234", "5678", "9012"]
    
    var body: some View {
        VStack {
            List(viewModel.codes) { code in
                Text(code.name)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            Spacer()
            HStack {
                Spacer()
                Button("Logout", action: ViewModel.signOut)
                    .sheet(isPresented: $showingSheet) {
                        SignInView()
                    }
                    .onReceive(viewModel.$connected) { connected in
                        print("connected received")
                        showingSheet = !connected
                    }
            }
            .sheet(isPresented: $showingSheet) {
                SignInView()
            }
            .onReceive(viewModel.$connected) { connected in
                print("connected received")
                showingSheet = !connected
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
