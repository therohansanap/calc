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
    var isShowingResult = false
    
    func buttonTapped(buttonTitle: String) {
        var title = buttonTitle
        
        switch title {
        
        case "C":
            displayText.value = "0"
            isShowingResult = false
            return
        
        case "=":
            if let result = Evaluator.shared.evaluate(displayText.value) {
                displayText.value = getFormattedText(result)
            }else {
                displayText.value = errorString
            }
            isShowingResult = true
            return
        
        case "+/-":
            return
            
        case "x":
            title = "*"
            
        case "÷":
            title = "/"
        
        default:
            break
        }
        
        if displayText.value == "0" || displayText.value == errorString || displayText.value == "" {
            displayText.value = title == "." ? "0." : title
        }else if isShowingResult && title.isNumericValue() {
            displayText.value = title
        }else {
            if title == "." {
                let last = String(displayText.value.last!)
                let lastValue = Double(last)
                
                if lastValue == nil {
                    displayText.value = displayText.value + "0"
                }
            }
            displayText.value = displayText.value + title
        }
        
        isShowingResult = false
    }
    
    func getFormattedText(_ value: Double) -> String {
        let integerValue = Int(value)
        let integerToDouble = Double(integerValue)
        return integerToDouble == value ? "\(integerValue)" : "\(value)"
    }
}

extension String {
    func isNumericValue() -> Bool {
        if let _ = Double(self) {
            return true
        }
        return false
    }
}
