//
//  CalcViewModel.swift
//  Rohan - BabyChakra
//
//  Created by Rohan Sanap on 25/11/17.
//  Copyright © 2017 The Rohan Sanap Tech Studios. All rights reserved.
//

import UIKit

protocol CalcViewModel {
    var displayText: Dynamic<String> { get }
    func buttonTapped(_ button: UIButton)
}
