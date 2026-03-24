//
//  PDFService.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import Foundation
import PDFKit
import UIKit

struct PDFService {

    static func getCover(from url: URL) -> Data? {
        guard let pdf = PDFDocument(url: url),
              let page = pdf.page(at: 0) else { return nil }

        let image = page.thumbnail(of: CGSize(width: 100, height: 150), for: .mediaBox)
        return image.pngData()
    }
}
