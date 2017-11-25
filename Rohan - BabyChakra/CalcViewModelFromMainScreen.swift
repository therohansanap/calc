//
//  CalcViewModelFromMainScreen.swift
//  Rohan - BabyChakra
//
//  Created by Rohan Sanap on 25/11/17.
//  Copyright © 2017 The Rohan Sanap Tech Studios. All rights reserved.
//

import UIKit

class ClacViewModelFromMainScreen: CalcViewModel {
    let model: CalcModel
    
    var displayText: Dynamic<String>
    
    init() {
        model = CalcModel()
        displayText = Dynamic("0")
    }
    
    func buttonTapped(_ button: UIButton) {
        guard let title = button.titleLabel?.text else {
            return
        }
        
        guard title != "C" else {
            model.resetModel()
            displayText.value = "0"
            return
        }
        
        guard title != "+/-" else {
            if let value = Double(displayText.value) {
                displayText.value = String(value * -1)
            }
            return
        }
        
        if displayText.value != "0" {
            displayText.value = displayText.value + title
        }else {
            displayText.value = title
        }
    }
}
