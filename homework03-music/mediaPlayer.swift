//
//  mediaPlayer.swift
//  homework03-music
//
//  Created by zhiliang_wang on 3/10/17.
//  Copyright © 2017 zhiliang_wang. All rights reserved.
//

import UIKit
import AVFoundation

@objc protocol mediaPlayerProtocol{
    func displaySong(_ song:song)
    func displayCompletionPercentage(_ compPercentage:Float)
    
}

class mediaPlayer:NSObject{
    @objc var avPlayer = AVPlayer()
    @objc var songIndex = 0
    @objc var songs = [song]()
    
    @objc func setup(){
        let song01 = song(artist: "Ben Pearce", title: "What I Might Do", image: UIImage(named: "ben-pearce")!, musicFilePath: Bundle.main.url(forResource: "Ben Pearce - What I Might Do (Kilter Remix)", withExtension: "mp3")!)
        let song02 = song(artist: "What So Not", title: "High you are", image: UIImage(named: "what-so-not")!, musicFilePath: Bundle.main.url(forResource: "What So Not - High you are (Branchez Remix)", withExtension: "mp3")!)
        let song03 = song(artist: "ASTR", title: "Hold On We're Going Home", image: UIImage(named: "astr")!, musicFilePath: Bundle.main.url(forResource: "ASTR - Hold On We're Going Home [Free DL]", withExtension: "mp3")!)
        songs.append(contentsOf:[song01,song02,song03])
    }
    @IBAction func playPrevious() {
        songIndex = songIndex - 1
        
        if songIndex < 0 {
            songIndex = songs.count - 1
        }
        
        playSong()
        
    }
    @IBAction func playSong() {
        let song = songs[songIndex]
        
        avPlayer = AVPlayer(url: song.musicFilePath as URL)
        avPlayer.play()
        
        delegate?.displaySong(song)
        
        let interval = CMTime(seconds: 1, preferredTimescale: 1)
        avPlayer.addPeriodicTimeObserver(forInterval: interval, queue: nil) { (currentTime) in
            
            if let duration = self.avPlayer.currentItem?.duration {
                let durationInSeconds = CMTimeGetSeconds(duration)
                let currentTimeInSeconds = CMTimeGetSeconds(currentTime)
                
                let currentProgress = Float(currentTimeInSeconds/durationInSeconds)
                self.delegate?.displayCompletionPercentage(currentProgress)
    }
    
    @IBAction func playNext() {
        songIndex = songIndex + 1
        
        if songIndex >= songs.count {
            songIndex = 0
        }
        
        playSong()
    }
    
    
}
