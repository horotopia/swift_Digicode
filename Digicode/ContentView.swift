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
            Spacer()
            TextField("Entrez le code", text: $codeInput)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(validCodes, id: \.self) { code in
                    Button(action: {
                        // Vérifier si le code entré est valide
                        if code == codeInput {
                            print("Code valide!")
                            // Faire quelque chose ici pour indiquer que le code est valide
                        } else {
                            print("Code invalide.")
                            // Faire quelque chose ici pour indiquer que le code est invalide
                        }
                    }) {
                        Text(code)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
