//
//  LibraryViewModel.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import Foundation
import SwiftUI
import Combine

class LibraryViewModel: ObservableObject {

    @Published var libros: [Libro] = []

    func agregarLibro(from url: URL) {
        guard let savedURL = FileManagerService.savePDF(from: url) else { return }

        let cover = PDFService.getCover(from: savedURL)

        let libro = Libro(
            title: savedURL.deletingPathExtension().lastPathComponent,
            fileURL: savedURL,
            coverImage: cover
        )

        libros.append(libro)
    }
}
