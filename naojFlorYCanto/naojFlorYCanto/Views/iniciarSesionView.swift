//
//  iniciarSesionView.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 23/03/26.
//

import SwiftUI

struct iniciarSesionView: View {
    @State private var irAPrincipal = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Text("Usuario/Correo")
                    .font(.title2.bold())
                TextField("Usuario", text: .constant(""))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .font(.title3)
                    .padding(.horizontal, 40)
                    .frame(maxWidth: 400)
                
                Text("Contraseña")
                    .font(.title2.bold())
                TextField("Contraseña", text: .constant(""))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .font(.title3)
                    .padding(.horizontal, 40)
                    .frame(maxWidth: 400)
                
                NavigationLink(destination: paginaPrincipalView()) {
                    Text("Ingresar")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .font(.title2.bold())
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                }
                .frame(maxWidth: 400)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    iniciarSesionView()
}
