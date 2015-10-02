//
//  ViewController.swift
//  YouTubeSpeechTest
//
//  Created by Tanmay Bakshi on 2015-09-30.
//  Copyright © 2015 Tanmay Bakshi. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechRecognizerDelegate {

    @IBOutlet var output: NSTextView!
    
    var breakState = false
    
    var sr = NSSpeechRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sr!.delegate = self
        sr!.commands = ["Chicken", "Rice", "Mangoes", "Apples", "Bananas", "Pears", "take a break", "get back to work"]
        sr!.startListening()
    }
    
    func speechRecognizer(sender: NSSpeechRecognizer, didRecognizeCommand command: String) {
        breakState = command == "take a break" ? true : command == "get back to work" ? false : breakState
        output.string! += !breakState && command != "get back to work" ? "\(command)\n" : ""
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

