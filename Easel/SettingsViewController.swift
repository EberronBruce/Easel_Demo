//
//  SettingsViewController.swift
//  Easel
//
//  Created by Bruce Burgess on 11/29/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    weak var drawingVC : DrawingViewController? = nil

    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let brushSize = self.drawingVC?.brushSize {
            self.slider.value = Float(brushSize)
        }
        
    }

    @IBAction func eraseTapped(_ sender: Any) {
        self.drawingVC?.earseEasel()
        _ = self.navigationController?.popViewController(animated: true)
    }

    @IBAction func sharedTapped(_ sender: Any) {
        if let image = self.drawingVC?.imageView.image {
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.present(activityVC, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        self.drawingVC?.brushSize = CGFloat(self.slider.value)
    }
}
