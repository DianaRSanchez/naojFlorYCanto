//
//  FileManagerService.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import Foundation

struct FileManagerService {

    static func savePDF(from url: URL) -> URL? {
        let fileManager = FileManager.default
        let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!

        let destinationURL = documents.appendingPathComponent(url.lastPathComponent)

        do {
            if fileManager.fileExists(atPath: destinationURL.path) {
                try fileManager.removeItem(at: destinationURL)
            }

            try fileManager.copyItem(at: url, to: destinationURL)
            return destinationURL

        } catch {
            print("Error guardando:", error)
            return nil
        }
    }
}
