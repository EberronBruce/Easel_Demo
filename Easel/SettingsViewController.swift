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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func eraseTapped(_ sender: Any) {
        self.drawingVC?.earseEasel()
        _ = self.navigationController?.popViewController(animated: true)
    }

}
