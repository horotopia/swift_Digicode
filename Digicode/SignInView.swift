//
//  SignInView.swift
//  Digicode
//
//  Created by Les Prodiges on 30/03/2023.
//

import SwiftUI
import FirebaseAuth
import FirebaseAuthCombineSwift

struct SignInView: View {
//    @Binding var connected: Bool
    @State var email = ""
    @State var password = ""
    @State var error = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "key")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Digicode")
            }
            Spacer()
            Text(error)
                .foregroundColor(.red)
            Spacer()
            TextField("E-mail", text: $email)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $password)
            Button("Login", action: {
                print("e-mail: \(email), password: \(password)")
                ViewModel.signIn(withEmail: email, password: password)})
            Spacer()
        }
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
