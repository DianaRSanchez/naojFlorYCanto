//
//  bibliotecaView.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 23/03/26.
//

import SwiftUI

struct bibliotecaView: View {
    var body: some View {
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
        
        NavigationView{
            List{
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                Text("Libro 1")
                
            }.navigationTitle("Biblioteca")
            
        }
    }
}

#Preview {
    bibliotecaView()
}
