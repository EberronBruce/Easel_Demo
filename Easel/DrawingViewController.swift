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
    var red : CGFloat = 0.0
    var green : CGFloat = 0.0
    var blue : CGFloat = 0.0
    var brushSize : CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(DrawingViewController.appBecameActive), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
        blueTapped(UIButton())
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
            
            drawBetweenPoints(firstPoint: self.lastPoint, secondPoint: point)
            
            self.lastPoint = point
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let point = touch.location(in: self.imageView)
            print(point)
            
            drawBetweenPoints(firstPoint: self.lastPoint, secondPoint: point)
        }

        self.buttonsStackView.isHidden = false
    }
    
    func drawBetweenPoints(firstPoint: CGPoint, secondPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.imageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        
        self.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
        
        context?.move(to: firstPoint)
        context?.addLine(to: secondPoint)
        
        context?.setStrokeColor(red: self.red, green: self.green, blue: self.blue, alpha: 1.0)
        context?.setLineCap(.round)
        context?.setLineWidth(brushSize)
        
        context?.strokePath()
        
        self.imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()

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
    
    
    @IBAction func blueTapped(_ sender: Any) {
        self.red = 56/255
        self.green = 109/255
        self.blue = 229/255
    }
    
    @IBAction func greenTapped(_ sender: Any) {
        self.red = 37/255
        self.green = 235/255
        self.blue = 114/255
    }
    
    @IBAction func redTapped(_ sender: Any) {
        self.red = 229/255
        self.green = 56/255
        self.blue = 56/255
    }
    
    @IBAction func yellowTapped(_ sender: Any) {
        self.red = 249/255
        self.green = 215/255
        self.blue = 23/255
    }
    
    @IBAction func randomTapped(_ sender: Any) {
        self.red = CGFloat(arc4random_uniform(256))/255
        self.green = CGFloat(arc4random_uniform(256))/255
        self.blue = CGFloat(arc4random_uniform(256))/255
    }
    
    
    
}

