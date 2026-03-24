//
//  LibraryView.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import SwiftUI

struct LibraryView: View {

    @EnvironmentObject var viewModel: LibraryViewModel
    @State private var showPicker = false

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
        
        NavigationView {
            VStack {
                Text("Mi Biblioteca")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                List(viewModel.libros) { libro in
                    
                    NavigationLink(destination: PDFReaderView(url: libro.fileURL)) {
                        HStack {

                            if let data = libro.coverImage,
                               let image = UIImage(data: data) {

                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 50, height: 75)
                            }

                            Text(libro.title)
                        }
                    }
                }

                Button("Agregar PDF") {
                    showPicker = true
                }

            }
        }
        .sheet(isPresented: $showPicker) {
            DocumentPicker { url in
                viewModel.agregarLibro(from: url)
            }
        }
    }
}

#Preview {
    LibraryView()
}
