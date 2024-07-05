//
//  ContentView.swift
//  AudioApp
//
//  Created by 김혜림 on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    var audioPlayerManager = AudioPlayerManager()
    @State var playAudio = false
    
    var body: some View {
        VStack {
            Button(action: {
                if !playAudio {
                    audioPlayerManager.play()
                } else {
                    audioPlayerManager.pause()
                }
                playAudio.toggle()
                
            }, label: {
                Text(!playAudio ? "Play audio" : "Stop audio")
            })
        }
        .padding()
        .onAppear {
            audioPlayerManager.loadAudio(name: "Small World", withExtenstion: "mp3")
        }
    }
}

#Preview {
    ContentView()
}
