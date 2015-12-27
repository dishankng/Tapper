//
//  ViewController.swift
//  Tapper!
//
//  Created by Dishank on 12/21/15.
//  Copyright © 2015 Dishank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var maxTaps = 0
    var currentTaps = 0

    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapstxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsToGo: UILabel!
    
    
    func updateTaplbl(){
        tapsToGo.text = "\(maxTaps-currentTaps) Taps to go! "
    }
    
    @IBAction func dismissKeypad(sender: AnyObject) {
        
        self.resignFirstResponder()
    }
    @IBAction func onPlayBtnPressed(sender: UIButton){
        
        if howManyTapstxt.text != nil && howManyTapstxt.text != "" {
            
            logoImg.hidden = true
            howManyTapstxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapsToGo.hidden = false
            
            maxTaps = Int(howManyTapstxt.text!)!
            currentTaps = 0
            
            updateTaplbl()
            
            
        }
        
        
    }
    
    
    @IBAction func coinTap(sender: UIButton){
        
        currentTaps++
        
        updateTaplbl()
        
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
        tapsToGo.hidden = true
        
    }
    


}

