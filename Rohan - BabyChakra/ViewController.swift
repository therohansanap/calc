//
//  ViewController.swift
//  Rohan - BabyChakra
//
//  Created by Rohan Sanap on 25/11/17.
//  Copyright © 2017 The Rohan Sanap Tech Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    let viewModel = ClacViewModelFromMainScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.displayText.bindAndFire { [unowned self] (displayText) in
            self.label.text = displayText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        viewModel.buttonTapped(sender)
    }
    


}

