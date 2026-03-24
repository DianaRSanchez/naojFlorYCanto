//
//  PDFImageService.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import Foundation
import UIKit
import PDFKit

struct PDFImageService {

    static func renderPageAsImage(page: PDFPage) -> UIImage {
        let pageRect = page.bounds(for: .mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)

        let image = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            page.draw(with: .mediaBox, to: ctx.cgContext)
        }

        return image
    }
}


