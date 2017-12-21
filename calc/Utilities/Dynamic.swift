//
//  Dynamic.swift
//  Rohan - BabyChakra
//
//  Created by Rohan Sanap on 25/11/17.
//  Copyright © 2017 The Rohan Sanap Tech Studios. All rights reserved.
//

class Dynamic<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
