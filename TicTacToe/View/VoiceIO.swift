//
//  Voice.swift
//  TicTacToe
//
//  Created by Jonas Willén on 2024-11-04.
//

import AVFoundation

@MainActor
final class VoiceIO: NSObject, AVSpeechSynthesizerDelegate {
    private let synthesizer = AVSpeechSynthesizer()

    override init() {
        super.init()
        synthesizer.delegate = self
        configureAudioSession()
    }

    private func configureAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .spokenAudio, options: [.duckOthers])
            try session.setActive(true)
        } catch {
            print("AudioSession error: \(error)")
        }
    }

    func speakCross() {
        // Cancel only if already speaking
        if synthesizer.isSpeaking { synthesizer.stopSpeaking(at: .immediate) }

        let utterance = AVSpeechUtterance(string: "Cross")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate  = AVSpeechUtteranceDefaultSpeechRate

        synthesizer.speak(utterance)
    }
    
    func speakCircle() {
        // Cancel only if already speaking
        if synthesizer.isSpeaking { synthesizer.stopSpeaking(at: .immediate) }

        let utterance = AVSpeechUtterance(string: "Circle")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate  = AVSpeechUtteranceDefaultSpeechRate

        synthesizer.speak(utterance)
    }
    
    func speakHurryUp() {
        // Cancel only if already speaking
        if synthesizer.isSpeaking { synthesizer.stopSpeaking(at: .immediate) }

        let utterance = AVSpeechUtterance(string: "Time to place a marker")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate  = AVSpeechUtteranceDefaultSpeechRate

        synthesizer.speak(utterance)
    }
    
    func speakTheString(theString : String) {
        // Cancel only if already speaking
        if synthesizer.isSpeaking { synthesizer.stopSpeaking(at: .immediate) }

        let utterance = AVSpeechUtterance(string: theString)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate  = AVSpeechUtteranceDefaultSpeechRate

        synthesizer.speak(utterance)
    }
    
}
