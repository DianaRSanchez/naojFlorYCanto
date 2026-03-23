//
//  paginaPrincipalView.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 23/03/26.
//

import SwiftUI

struct paginaPrincipalView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Header at the very top
            HStack(spacing: 0) {
                // Left third: Racha
                Text("Racha")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(.white))
                    .padding(.horizontal)

                // Right two-thirds: actions
                HStack {
                    Button(action: { /* Buscar action */ }) {
                        HStack(spacing: 6) {
                            Image(systemName: "magnifyingglass").foregroundColor(.white)
                        }
                    }
                    Spacer(minLength: 16)
                    Button(action: { /* Menu action */ }) {
                        HStack(spacing: 6) {
                            Image(systemName: "house").foregroundColor(.white)
                        }
                    }
                    Spacer(minLength: 16)
                    Button(action: { /* Perfil action */ }) {
                        HStack(spacing: 6) {
                            Image(systemName: "person").foregroundColor(.white)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 56)
            .padding(.horizontal)
            .background(Color(.black))

            // Main content below header
            VStack{
                Text("Lecturas recientes")
                    .font(.system(size: 26, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                HStack{
                    
                }
                
                
                NavigationLink(destination: bibliotecaView()) {
                    Text("Biblioteca")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .font(.title2.bold())
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                }
               
                
                NavigationLink(destination: RecomendacionesView()) {
                    Text("Para ti")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(16)
                        .font(.title2.bold())
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                }
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    paginaPrincipalView()
}
