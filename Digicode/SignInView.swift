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
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "key")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Digicode")
            }
            Spacer()
            TextField("E-mail", text: $email)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
            
            Button("Login", action: {
                ViewModel.signIn(withEmail: email, password: password)})
            Spacer()
        }
        .padding()
        .interactiveDismissDisabled()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
