//
//  ViewController.swift
//  Easel
//
//  Created by Bruce Burgess on 11/29/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonsStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.appBecameActive), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func appBecameActive() {
        self.buttonsStackView.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Began")
        self.buttonsStackView.isHidden = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Moved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ended")
        self.buttonsStackView.isHidden = false
    }


}

