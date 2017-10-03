//
//  ViewController.swift
//  homework03-music
//
//  Created by zhiliang_wang on 3/10/17.
//  Copyright © 2017 zhiliang_wang. All rights reserved.
//

import UIKit

class playerViewController: UIViewController, mediaPlayerProtocol {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mediaPlayer.setup()
        
    }
    
    func displaySong(_song:song){
        
    }
    
    func displayCompletionPercentage(_compPercentage:Float){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

