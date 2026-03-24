//
//  PDFReaderView.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import Foundation
import SwiftUI
import PDFKit

struct PDFReaderView: View {

    let url: URL
    let captionService = ImageCaptionService()
    @State private var currentPage: PDFPage? = nil

    var body: some View {
        VStack {

            PDFKitView(url: url, currentPage: $currentPage)

            Button("Comenzar lectura") {
                if let page = currentPage {
                    let texto = page.string ?? ""
                    SpeechService.shared.leerTexto(texto)
                }
            }
            .padding()
            
            Button("Describir página (IA)") {
                if let page = currentPage {
                    let image = PDFImageService.renderPageAsImage(page: page)
                    
                    captionService.describirImagen(image) { texto in
                        DispatchQueue.main.async {
                            if let texto = texto {
                                print("Descripción:", texto)
                                SpeechService.shared.leerTexto(texto)
                            } else {
                                print("No se pudo obtener descripción")
                            }
                        }
                    }
                }
            }
            
            
        }
    }
}

struct PDFKitView: UIViewRepresentable {

    let url: URL
    @Binding var currentPage: PDFPage?

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.displayMode = .singlePageContinuous
        pdfView.document = PDFDocument(url: url)
        
        // Accesibilidad
        pdfView.isAccessibilityElement = true
        pdfView.accessibilityLabel = "Documento PDF"
        
        //Detectar cambio de página
        NotificationCenter.default.addObserver(
            context.coordinator,
            selector: #selector(Coordinator.pageChanged(_:)),
            name: Notification.Name.PDFViewPageChanged,
            object: pdfView
        )

        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}

    class Coordinator: NSObject {

        var parent: PDFKitView

        init(_ parent: PDFKitView) {
            self.parent = parent
        }

        @objc func pageChanged(_ notification: Notification) {
            if let pdfView = notification.object as? PDFView {
                parent.currentPage = pdfView.currentPage
            }
        }
        
    }
}

