//
//  EvaluationManager.swift
//  Rohan - BabyChakra
//
//  Created by Rohan Sanap on 01/12/17.
//  Copyright © 2017 The Rohan Sanap Tech Studios. All rights reserved.
//

import Foundation

class Evaluator {
    
    static let shared = Evaluator()
    private init() {}
    
    func evaluate(_ infixExpressionString: String) -> Double? {
        let infixExpressionArray = getExpressionArray(infixExpressionString)
        
        if let postfixExpressionArray = getPostfixExpressionArray(infixExpressionArray) {
            let executionStack = Stack<Double>(size: 100)
            
            for token in postfixExpressionArray {
                if let value = token as? Double {
                    executionStack.push(value)
                }else if let mathOperator = token as? MathOperator {
                    if let operand2 = executionStack.pop(),
                        let operand1 = executionStack.pop() {
                        
                        switch mathOperator.symbol {
                        
                        case "+": executionStack.push(operand1 + operand2)
                        
                        case "-": executionStack.push(operand1 - operand2)
                        
                        case "*": executionStack.push(operand1 * operand2)
                        
                        case "%":
                            if operand2 != 0 {
                                executionStack.push(operand1.truncatingRemainder(dividingBy: operand2))
                            }else {
                                return nil
                            }
                            
                        case "/":
                            if operand2 != 0 {
                                executionStack.push(operand1 + operand2)
                            }else {
                                return nil
                            }
                            
                        default:
                            return nil
                        }
                    }else {
                        return nil
                    }
                }
            }
            
            if executionStack.count() == 1 {
                return executionStack.pop()!
            }
        }
        
        return nil
    }
    
    func getExpressionArray(_ infixExpressionString: String) -> [String] {
        var infixExpressionArray = [String]()
        var temp = [Character]()
        
        for (index, char) in infixExpressionString.enumerated() {
            switch char {
            case "/", "*", "+", "-", "%":
                if index == 0 && (char == "+" || char == "-") {
                    temp.append(char)
                }else {
                    if !temp.isEmpty {
                        infixExpressionArray.append(String(temp))
                        temp.removeAll()
                    }
                    infixExpressionArray.append(String(char))
                }
            default:
                temp.append(char)
            }
        }
        
        if !temp.isEmpty {
            infixExpressionArray.append(String(temp))
        }
        
        return infixExpressionArray
    }
    
    func getPostfixExpressionArray(_ infixExpressionArray: [String]) -> [Any]? {
        var outputArray = [Any]()
        let operatorStack = Stack<MathOperator>(size: 100)
        
        for symbol in infixExpressionArray {
            if let doubleValue = Double(symbol) {
                outputArray.append(doubleValue)
            }else if let currentOperator = MathOperator(symbol) {
                while !operatorStack.isEmpty() && currentOperator.precedance <= operatorStack.peek()!.precedance {
                    outputArray.append(operatorStack.pop()!)
                }
                operatorStack.push(currentOperator)
            }else {
                return nil
            }
        }
        
        while !operatorStack.isEmpty() {
            outputArray.append(operatorStack.pop()!)
        }
        
        return outputArray
    }
}



fileprivate class MathOperator {
    
    let symbol: String
    let precedance: UInt
    
    init?(_ symbol: String) {
        self.symbol = symbol
        
        switch symbol {
        case "%", "/", "*":
            self.precedance = 1
        case "+", "-":
            self.precedance = 0
        default:
            return nil
        }
    }
}
