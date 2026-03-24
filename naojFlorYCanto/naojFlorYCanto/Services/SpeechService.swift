//
//  SpeechService.swift
//  naojFlorYCanto
//
//  Created by CEDAM22 on 24/03/26.
//

import Foundation
import AVFoundation

class SpeechService {

    static let shared = SpeechService()
    private let synthesizer = AVSpeechSynthesizer()

    func leerTexto(_ texto: String) {
        let utterance = AVSpeechUtterance(string: texto)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
        synthesizer.speak(utterance)
    }
}

