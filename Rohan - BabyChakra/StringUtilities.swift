//
//  StringUtilities.swift
//  Rohan - BabyChakra
//
//  Created by Rohan Sanap on 02/12/17.
//  Copyright © 2017 The Rohan Sanap Tech Studios. All rights reserved.
//

import Foundation

extension String {
    func isNumericValue() -> Bool {
        if let _ = Double(self) {
            return true
        }
        return false
    }
}
