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
                    .foregroundColor( nameCount < 3 ? .red : .green )
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .frame(width: 30, height: 30)
                        .font(.headline)
                    
                    Text("Ok")
                        .frame(width: 30, height: 30)
                        .font(.headline)
                        .disabled( nameCount < 3 ? true : false )
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
