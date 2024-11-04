//
//  Voice.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2024-11-04.
//

import AVFoundation

struct VoiceIO {
    private let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    
    func speech(tile:Int){
        if(tile == 1){
            let crossVoice = AVSpeechUtterance(string: "Circle")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
        }else if(tile == 2){
            let crossVoice = AVSpeechUtterance(string: "Cross")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
        }else if(tile == 3){
            let crossVoice = AVSpeechUtterance(string: "Time to place a marker")
            synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate )
            synthesizer.speak(crossVoice)
        }
    }
}
