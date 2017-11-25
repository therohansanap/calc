//
//  CalcModel.swift
//  Rohan - BabyChakra
//
//  Created by Rohan Sanap on 25/11/17.
//  Copyright © 2017 The Rohan Sanap Tech Studios. All rights reserved.
//

import Foundation

enum Operator {
    case addition
    case substraction
    case multiplication
    case division
    case negation
}

class CalcModel: NSObject {
    var operand1: Double = 0
    var operand2: Double?
    var operation: Operator?
    
    func resetModel() {
        operand1 = 0
        operand2 = nil
        operation = nil
    }
}
