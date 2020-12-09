//
//  GameViewController+Audio.swift
//  HeadphoneMotion
//
//  Created by Kolibaba, Volodymyr on 04.12.20.
//

import SceneKit
import AVFoundation


extension GameViewController {
    
    /// Sets up the audio for playback.
    func setupAudio() {
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        scnView.audioEnvironmentNode.renderingAlgorithm = .auto

        // Instantiate the audio source
        audioSource = SCNAudioSource(fileNamed: "fireplace.mp3")!
        // As an environmental sound layer, audio should play indefinitely
        audioSource.loops = true
        // Decode the audio from disk ahead of time to prevent a delay in playback
        audioSource.load()
    }
    
    /// Plays a sound on the `objectNode` using SceneKit's positional audio
    func playSound() {
        // Ensure there is only one audio player
        stopSound()
        // Create a player from the source and add it to `objectNode`
        
        let audioPlayer = SCNAudioPlayer(source: audioSource)
        audioPlayer.willStartPlayback = {
            
            print("willStartPlayback")
        }
        audioPlayer.didFinishPlayback = {
            
            print("didFinishPlayback")
        }
        shipNode.addAudioPlayer(audioPlayer)
        
        guard let player = shipNode.audioPlayers.first else { return }
        if let avNode = player.audioNode as? AVAudioMixing {
            
            avNode.volume = 1.0
        }
    }
    
    func stopSound() {
        
        shipNode.removeAllAudioPlayers()
    }
}
