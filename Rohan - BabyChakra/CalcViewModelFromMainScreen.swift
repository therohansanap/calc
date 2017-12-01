//
//  CalcViewModelFromMainScreen.swift
//  Rohan - BabyChakra
//
//  Created by Rohan Sanap on 25/11/17.
//  Copyright © 2017 The Rohan Sanap Tech Studios. All rights reserved.
//

import UIKit

class ClacViewModelFromMainScreen: CalcViewModel {
    let errorString = "Error!"
    var displayText = Dynamic("0")
    
    func buttonTapped(_ button: UIButton) {
        guard let title = button.titleLabel?.text else {
            return
        }
        
        guard title != "+/-" else {
            return
        }
        
        guard title != "C" else {
            displayText.value = "0"
            return
        }
        
        guard title != "=" else {
            //TODO: evaluate expression
            return
        }
        
        if displayText.value == "0" || displayText.value == errorString {
            if title == "." {
                displayText.value = "0."
            }else {
                displayText.value = title
            }
        }else {
            displayText.value = displayText.value + title
        }
    }
}
