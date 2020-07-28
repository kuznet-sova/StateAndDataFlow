//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject var user: UserManager
    
    private var nameCount: Int {
        name.count
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 50)
                    .font(.headline)
                
                Text("\(nameCount)")
                    .frame(width: 30, height: 30)
                    .font(.headline)
//                    .foregroundColor()
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .frame(width: 30, height: 30)
                        .font(.headline)
                    
                    Text("Ok")
                        .frame(width: 30, height: 30)
                        .font(.headline)
                }
            }
        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister = true
        }
    }
    
    private func nameValidation() {
        var nameCountColor: Color
        var loginAction: Bool
        
        if nameCount < 3 {
            nameCountColor = .red
            loginAction = false
        } else {
            nameCountColor = .green
            loginAction = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
        .environmentObject(UserManager())
    }
}
