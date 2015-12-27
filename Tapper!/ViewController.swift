//
//  ViewController.swift
//  Tapper!
//
//  Created by Dishank on 12/21/15.
//  Copyright © 2015 Dishank. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Variables
    var maxTaps = 0
    var currentTaps = 0
    var currentTaps2 = 0
    var btnSound : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do{
            
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)       //Use 'try' in a do loop when throw error is shown
            btnSound.prepareToPlay()
            
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }


    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapstxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsToGo: UILabel!
    @IBOutlet weak var tapBtn2: UIButton!
    
    
    func updateTaplbl(){
        if currentTaps2 >= currentTaps{
            tapsToGo.text = "Player 2 wins!!"
        } else {
            tapsToGo.text = "Player 1 wins!!"
        }
    
    }
    
    @IBAction func dismissKeypad(sender: AnyObject) {
        
        self.resignFirstResponder()
    }
    @IBAction func onPlayBtnPressed(sender: UIButton){
        playSound()
        
        if howManyTapstxt.text != nil && howManyTapstxt.text != "" {
            
            logoImg.hidden = true
            howManyTapstxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapBtn2.hidden = false
            tapsToGo.hidden = true
            
            maxTaps = Int(howManyTapstxt.text!)!
            currentTaps = 0
            currentTaps2 = 0
            
            //updateTaplbl()
            
            
        }
        
        
    }
    
    
    @IBAction func coinTap(sender: UIButton){
        playSound()
        
        currentTaps++
        
        //updateTaplbl()
        
        if currentTaps >= maxTaps{
            
        
            restartGame()
        }
        
        
    }
    
    func restartGame(){
        maxTaps = 0
        howManyTapstxt.text = nil
        
        logoImg.hidden = false
        howManyTapstxt.hidden = false
        playBtn.hidden = false
        
        tapBtn.hidden = true
        tapBtn2.hidden = true
        tapsToGo.hidden = false
        
        updateTaplbl()
        
    }
    
    @IBAction func coinTap2(sender: UIButton) {
        playSound()
        
        currentTaps2++
        
        if currentTaps2 >= maxTaps{
            
            restartGame()
        }
    }
    
    func playSound(){
        if btnSound.playing{
            btnSound.stop()
        }
        btnSound.play()
    }


}

