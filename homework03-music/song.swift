//
//  song.swift
//  homework03-music
//
//  Created by zhiliang_wang on 3/10/17.
//  Copyright © 2017 zhiliang_wang. All rights reserved.
//

import UIKit

class song: NSObject{
    @objc let artist:String
    @objc let title:String
    @objc let image:UIImage
    @objc let musicFilePath:URL
    @objc init(artist:String,title:String,image:UIImage,musicFilePath:URL){
        self.artist = artist
        self.title = title
        self.image = image
        self.musicFilePath = musicFilePath
        
    }
}
