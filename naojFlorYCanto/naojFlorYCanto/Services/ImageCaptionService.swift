//
//  ImageCaptionService.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import Foundation
import UIKit

class ImageCaptionService {

    private let apiKey = "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"

    func describirImagen(_ image: UIImage, completion: @escaping (String?) -> Void) {
        
        guard let url = URL(string: "https://api-inference.huggingface.co/models/nlpconnect/vit-gpt2-image-captioning") else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("image/jpeg", forHTTPHeaderField: "Content-Type")

        guard let imageData = image.jpegData(compressionQuality: 0.7) else {
            completion(nil)
            return
        }

        request.httpBody = imageData

        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error request:", error)
                completion(nil)
                return
            }

            guard let data = data else {
                completion(nil)
                return
            }

            let responseString = String(data: data, encoding: .utf8) ?? "No response"
            print("Respuesta cruda:", responseString)

            // 🔥 manejar cuando el modelo está cargando
            if responseString.contains("loading") {
                print("⏳ Modelo cargando, intenta otra vez en unos segundos")
                completion(nil)
                return
            }

            do {
                if let result = try JSONSerialization.jsonObject(with: data) as? [[String: Any]],
                   let caption = result.first?["generated_text"] as? String {
                    
                    completion(caption)
                } else {
                    print("Formato inesperado")
                    completion(nil)
                }
            } catch {
                print("Error parsing:", error)
                completion(nil)
            }

        }.resume()
    }
}
