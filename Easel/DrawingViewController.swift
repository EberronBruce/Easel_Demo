//
//  ViewController.swift
//  Easel
//
//  Created by Bruce Burgess on 11/29/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(DrawingViewController.appBecameActive), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func appBecameActive() {
        self.buttonsStackView.isHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self.imageView)
            self.lastPoint = point
        }
        
        
        self.buttonsStackView.isHidden = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self.imageView)
            print(point)
            
            
            UIGraphicsBeginImageContext(self.imageView.frame.size)
            let context = UIGraphicsGetCurrentContext()
            
            self.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
            
            context?.move(to: self.lastPoint)
            context?.addLine(to: point)
            
            context?.setStrokeColor(red: 0.3, green: 0.8, blue: 0.2, alpha: 1.0)
            context?.setLineCap(.round)
            context?.setLineWidth(15)
            
            context?.strokePath()
            
            self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            self.lastPoint = point
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Ended")
        self.buttonsStackView.isHidden = false
    }
    
    func earseEasel() {
        self.imageView.image = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "drawingToSettingsSegue" {
            let settingsVC = segue.destination as! SettingsViewController
            settingsVC.drawingVC = self
        }
    }
    
    
}

