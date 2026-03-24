//
//  Libro.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import Foundation

struct Libro: Identifiable, Codable {
    let id: UUID
    let title: String
    let fileURL: URL
    let coverImage: Data?

    init(id: UUID = UUID(), title: String, fileURL: URL, coverImage: Data?) {
        self.id = id
        self.title = title
        self.fileURL = fileURL
        self.coverImage = coverImage
    }
}
