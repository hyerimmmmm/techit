//
//  AudioPlayerManager.swift
//  AudioApp
//
//  Created by 김혜림 on 7/5/24.
//

import AVFoundation

class AudioPlayerManager {
    var audioPlayer: AVAudioPlayer?
    
    func loadAudio(name fileName: String, withExtenstion ext: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: ext) else {
            print("Audio file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error loading audio: \(error.localizedDescription)")
        }
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func pause() {
        audioPlayer?.pause()
    }
    
    func stop() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }
}
