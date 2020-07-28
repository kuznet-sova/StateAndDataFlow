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
    
    var body: some View {
        VStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 50)
                .font(.headline)
            
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
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
        .environmentObject(UserManager())
    }
}
