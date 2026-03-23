//
//  crearCuenta.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 23/03/26.
//

import SwiftUI

struct crearCuenta: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Image("Recurso 2@4x").resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)
                
                NavigationLink(destination: iniciarSesionView()) {
                    Text("Iniciar Sesion")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .font(.title2.bold())
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                }
                .padding(.top, 60)

                NavigationLink(destination: crearUsuarioView()) {
                    Text("Registrarse")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .font(.title2.bold())
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                }
            }.background(RadialGradient(gradient: Gradient(colors: [Color.white, Color.black]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 165, endRadius: 600))
        }
    }
}

#Preview {
    NavigationView { crearCuenta() }
}
